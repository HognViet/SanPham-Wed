/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.CartItem;
import Model.GioHangDAO;
import Model.Users;
import Model.UsersConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ThanhToan extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
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

            // Kiểm tra đăng nhập
            Users userLogin = (Users) request.getSession().getAttribute("userLogin");
            if (userLogin == null) {
                response.sendRedirect("Dangnhap.jsp?mess=requiredLogin");
                return;
            }

            // Lấy thông tin form
            String fullName      = request.getParameter("fullName");
            String phone         = request.getParameter("phone");
            String email         = request.getParameter("email");
            String address       = request.getParameter("address");
            String note          = request.getParameter("note");
            String paymentMethod = request.getParameter("paymentMethod");

            // Lấy giỏ hàng từ DB
            GioHangDAO ghDAO = new GioHangDAO();
            List<CartItem> cartItems = ghDAO.getCartItems(userLogin.mauser);

            if (cartItems == null || cartItems.isEmpty()) {
                response.sendRedirect("GioHangController");
                return;
            }

            // Tính tổng tiền
            double total = 0;
            for (CartItem item : cartItems) {
                total += item.price * item.quantity;
            }

            // Insert vào bảng orders
            Connection cnn = UsersConnection.getConnection();
            String sqlOrder = "INSERT INTO orders (mauser, total_price, address) VALUES (?, ?, ?)";
            PreparedStatement psOrder = cnn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, userLogin.mauser);
            psOrder.setDouble(2, total);
            psOrder.setString(3, address);
            psOrder.executeUpdate();

            // Lấy order_id vừa tạo
            ResultSet keys = psOrder.getGeneratedKeys();
            int orderId = 0;
            if (keys.next()) orderId = keys.getInt(1);
            keys.close();
            psOrder.close();

            // Insert từng sản phẩm vào order_item
            String sqlItem = "INSERT INTO order_item (order_id, sanpham_id, quantity, price, don_gia) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement psItem = cnn.prepareStatement(sqlItem);
            for (CartItem item : cartItems) {
                psItem.setInt(1, orderId);
                psItem.setInt(2, item.sanpham_id);
                psItem.setInt(3, item.quantity);
                psItem.setDouble(4, item.price * item.quantity); // price = thành tiền
                psItem.setDouble(5, item.price);                 // don_gia = đơn giá
                psItem.executeUpdate();
            }
            psItem.close();
            cnn.close();

            // Xóa giỏ hàng sau khi thanh toán
            ghDAO.clearCart(userLogin.mauser);

            // Chuyển về trang chủ với thông báo
            response.sendRedirect("trangchu?mess=orderSuccess");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("thanhtoan.jsp");
        }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */


}
