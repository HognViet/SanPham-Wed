/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Admin
 */
public class GioHangDAO {
    private Connection getConn() throws ClassNotFoundException, SQLException {
        return UsersConnection.getConnection();
    }

    // Lấy cart theo mauser, nếu chưa có thì tạo mới
    public Cart getOrCreateCart(int mauser) throws ClassNotFoundException, SQLException {
        Connection cnn = getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM cart WHERE mauser = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, mauser);
            rs = ps.executeQuery();

            if (rs.next()) {
                Cart c = new Cart();
                c.cart_id = rs.getInt("cart_id");
                c.mauser  = rs.getInt("mauser");
                System.out.println("cart_id: " + c.cart_id);
                return c;
            }

            // Chưa có → tạo mới
            String sqlInsert = "INSERT INTO cart (mauser) VALUES (?)";
            PreparedStatement psInsert = cnn.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS);
            psInsert.setInt(1, mauser);
            psInsert.executeUpdate();
            ResultSet keys = psInsert.getGeneratedKeys();
            Cart c = new Cart();
            c.mauser = mauser;
            if (keys.next()) c.cart_id = keys.getInt(1);
            keys.close();
            psInsert.close();
            return c;
        } finally {
            if (rs  != null) rs.close();
            if (ps  != null) ps.close();
            if (cnn != null) cnn.close();
        }
    }

    // Thêm sản phẩm vào giỏ, nếu đã có thì tăng số lượng
    public void addToCart(int mauser, int mypham_id, double price) throws ClassNotFoundException, SQLException {
        Cart cart = getOrCreateCart(mauser);
        Connection cnn = getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sqlCheck = "SELECT * FROM cart_item WHERE cart_id = ? AND sanpham_id = ?";
            ps = cnn.prepareStatement(sqlCheck);
            ps.setInt(1, cart.cart_id);
            ps.setInt(2, mypham_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                String sqlUpdate = "UPDATE cart_item SET quantity = quantity + 1 WHERE cart_id = ? AND sanpham_id = ?";
                PreparedStatement psUpdate = cnn.prepareStatement(sqlUpdate);
                psUpdate.setInt(1, cart.cart_id);
                psUpdate.setInt(2, mypham_id);
                psUpdate.executeUpdate();
                psUpdate.close();
            } else {
                String sqlInsert = "INSERT INTO cart_item (cart_id, sanpham_id, quantity, price) VALUES (?, ?, 1, ?)";
                PreparedStatement psInsert = cnn.prepareStatement(sqlInsert);
                psInsert.setInt(1, cart.cart_id);
                psInsert.setInt(2, mypham_id);
                psInsert.setDouble(3, price);
                psInsert.executeUpdate();
                psInsert.close();
            }
        } finally {
            if (rs  != null) rs.close();
            if (ps  != null) ps.close();
            if (cnn != null) cnn.close();
        }
    }

    // Lấy danh sách sản phẩm trong giỏ
    public List<CartItem> getCartItems(int mauser) throws ClassNotFoundException, SQLException {
        Cart cart = getOrCreateCart(mauser);
        Connection cnn = getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<CartItem> list = new ArrayList<>();
        try {
            String sql = "SELECT ci.*, mp.ten, mp.hinh FROM cart_item ci " +
                         "JOIN sanpham mp ON ci.sanpham_id = mp.id " +
                         "WHERE ci.cart_id = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, cart.cart_id);
            rs = ps.executeQuery();

            while (rs.next()) {
                CartItem item = new CartItem();
                item.cart_item_id = rs.getInt("cart_item_id");
                item.cart_id      = rs.getInt("cart_id");
                item.sanpham_id    = rs.getInt("sanpham_id");
                item.quantity     = rs.getInt("quantity");
                item.price        = rs.getDouble("price");
                item.ten          = rs.getString("ten");
                item.hinh         = rs.getString("hinh");
                list.add(item);
            }
            return list;
        } finally {
            if (rs  != null) rs.close();
            if (ps  != null) ps.close();
            if (cnn != null) cnn.close();
        }
    }

    // Xóa 1 sản phẩm khỏi giỏ
    public void removeItem(int cart_item_id) throws ClassNotFoundException, SQLException {
        Connection cnn = getConn();
        PreparedStatement ps = null;
        try {
            String sql = "DELETE FROM cart_item WHERE cart_item_id = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, cart_item_id);
            ps.executeUpdate();
        } finally {
            if (ps  != null) ps.close();
            if (cnn != null) cnn.close();
        }
    }

    // Xóa toàn bộ giỏ hàng sau khi thanh toán
    public void clearCart(int mauser) throws ClassNotFoundException, SQLException {
        Cart cart = getOrCreateCart(mauser);
        Connection cnn = getConn();
        PreparedStatement ps = null;
        try {
            String sql = "DELETE FROM cart_item WHERE cart_id = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, cart.cart_id);
            ps.executeUpdate();
        } finally {
            if (ps  != null) ps.close();
            if (cnn != null) cnn.close();
        }
    }

    // Đếm số lượng sản phẩm trong giỏ (hiển thị badge)
    public int countItems(int mauser) throws ClassNotFoundException, SQLException {
        Cart cart = getOrCreateCart(mauser);
        Connection cnn = getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT SUM(quantity) FROM cart_item WHERE cart_id = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, cart.cart_id);
            rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
            return 0;
        } finally {
            if (rs  != null) rs.close();
            if (ps  != null) ps.close();
            if (cnn != null) cnn.close();
        }
    }
}
