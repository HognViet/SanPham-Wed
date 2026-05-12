/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.GioHangDAO;
import Model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ThemSPVaoGioHang extends HttpServlet {

    
    

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            // Kiểm tra đã đăng nhập chưa
            Users userLogin = (Users) request.getSession().getAttribute("userLogin");
            System.out.println("mauser: " + userLogin.mauser);
            if (userLogin == null) {
                response.sendRedirect("Dangnhap.jsp?mess=requiredLogin");
                return;
            }

            // Lấy thông tin sản phẩm từ request
            int mypham_id = Integer.parseInt(request.getParameter("mypham_id"));
            double price  = Double.parseDouble(request.getParameter("price"));

            // Thêm vào giỏ
            GioHangDAO ghDAO = new GioHangDAO();
            ghDAO.addToCart(userLogin.mauser, mypham_id, price);

            // Redirect về trang trước đó
            String referer = request.getHeader("Referer");
            if (referer != null) {
                response.sendRedirect(referer);
            } else {
                response.sendRedirect("trangchu");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("trangchu");
        }
    }

   
}
