/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.CartItem;
import Model.GioHangDAO;
import Model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
public class GioHangController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            // Kiểm tra đã đăng nhập chưa
            Users userLogin = (Users) request.getSession().getAttribute("userLogin");
            if (userLogin == null) {
                response.sendRedirect("Dangnhap.jsp?mess=requiredLogin");
                return;
            }

            GioHangDAO ghDAO = new GioHangDAO();

            // Lấy danh sách sản phẩm trong giỏ
            List<CartItem> cartItems = ghDAO.getCartItems(userLogin.mauser);

            // Tính tổng tiền
            double total = 0;
            for (CartItem item : cartItems) {
                total += item.price * item.quantity;
            }

            request.setAttribute("cartItems", cartItems);
            request.setAttribute("total", total);
            request.getRequestDispatcher("Giohang.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("trangchu");
        }
    }


}
