/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Users;
import Model.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 *
 * @author Viet
 */
public class Dangky extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            Users u = new Users();
            u.accname = request.getParameter("fullName");
            u.loginname = request.getParameter("username");
            u.pass = request.getParameter("password");
            u.email = request.getParameter("email");
            u.phone = request.getParameter("phone");
            u.address = request.getParameter("address");
            
            String confirmPass = request.getParameter("confirmPassword");
            UsersDAO ud = new UsersDAO();
            // Check email phải có đuôi @gmail.com
            if (!u.email.endsWith("@gmail.com")) {
                response.sendRedirect("Dangky.jsp?mess=emailError");
                return;
            }

            // Check phone chỉ chứa số và đủ 10 chữ số
            if (!u.phone.matches("\\d{10}")) {
                response.sendRedirect("Dangky.jsp?mess=phoneError");
                return;
            }

            // Check mật khẩu khớp
            if (!confirmPass.equals(u.pass)) {
                response.sendRedirect("Dangky.jsp?mess=error");
                return;
            }

            // Check tồn tại trong DB
            if (!ud.isExist(u)) {
                ud.AddUser(u);
                response.sendRedirect("trangchu?mess=success");
            } else {
                response.sendRedirect("Dangky.jsp?mess=exist");
            }
            
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet Dangky</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet Dangky at " + request.getContextPath() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        }   catch (ClassNotFoundException ex) {
            System.getLogger(Dangky.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        } catch (SQLException ex) {
            System.getLogger(Dangky.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
