package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MyphamDAO {
    private Mypham mapRow(ResultSet rs) throws Exception {
        Mypham sp = new Mypham();
        sp.setId(rs.getInt("id"));
        sp.setTen(rs.getString("ten"));
        sp.setGia(rs.getFloat("gia"));
        sp.setHinh(rs.getString("hinh"));
        sp.setMoTa(rs.getString("mo_ta"));
        sp.setThuongHieu(rs.getString("thuong_hieu"));
        sp.setTrongLuong(rs.getString("trong_luong"));
        sp.setMauSac(rs.getString("mau_sac"));
        sp.setHanDung(rs.getString("han_dung"));
        sp.setDanhMuc(rs.getString("danh_muc"));
        return sp;
    }

    public List<Mypham> getByDanhMuc(String danhMuc, int limit) {
        List<Mypham> list = new ArrayList<>();
        String sql = "SELECT id, ten, gia, hinh, mo_ta, thuong_hieu, trong_luong, mau_sac, han_dung, danh_muc "
                + "FROM sanpham WHERE danh_muc = ? ORDER BY id LIMIT ?";
        try (Connection conn = dbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, danhMuc);
            ps.setInt(2, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapRow(rs));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();   
        }
        return list;
    }

    public Mypham getById(String id) {
        String sql = "SELECT id, ten, gia, hinh, mo_ta, thuong_hieu, trong_luong, mau_sac, han_dung, danh_muc "
                + "FROM sanpham WHERE id = ? LIMIT 1";
        try (Connection conn = dbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<Mypham> getAllProducts() {

    List<Mypham> list =
            new ArrayList<>();

    String sql =
            "SELECT * FROM sanpham";

    try (
            Connection conn =
                    dbConnection.getConnection();

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery()
    ) {

        while (rs.next()) {

            list.add(mapRow(rs));
        }

    } catch (Exception e) {

        e.printStackTrace();
    }

    return list;
}
    public List<Mypham> searchProducts(String keyword)
        throws Exception {

    List<Mypham> list = new ArrayList<>();

    Connection conn = dbConnection.getConnection();

    String sql =
            "SELECT * FROM sanpham "
            + "WHERE ten LIKE ? "
            + "OR mo_ta LIKE ? "
            + "OR danh_muc LIKE ?";

    PreparedStatement ps =
            conn.prepareStatement(sql);

    String k = "%" + keyword + "%";

    ps.setString(1, k);
    ps.setString(2, k);
    ps.setString(3, k);

    ResultSet rs = ps.executeQuery();

    while (rs.next()) {

        Mypham p = new Mypham();

        p.setId(rs.getInt("id"));

        p.setTen(rs.getString("ten"));

        p.setGia(rs.getFloat("gia"));

        p.setMoTa(rs.getString("mo_ta"));

        p.setThuongHieu(
                rs.getString("thuong_hieu")
        );

        p.setDanhMuc(
                rs.getString("danh_muc")
        );

        list.add(p);
    }

    rs.close();
    ps.close();
    conn.close();

    return list;
}
    public List<Mypham> timKiem(String keyword) throws Exception {
    Connection cnn = dbConnection.getConnection();
    List<Mypham> list = new ArrayList<>();
    String sql = "SELECT * FROM sanpham WHERE ten LIKE ? OR thuong_hieu LIKE ?";
    PreparedStatement ps = cnn.prepareStatement(sql);
    ps.setString(1, "%" + keyword + "%");
    ps.setString(2, "%" + keyword + "%");
    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
        Mypham mp = new Mypham();
        mp.setId(Integer.parseInt(rs.getString("id")) );
        mp.setTen(rs.getString("ten"));
        mp.setGia(Float.parseFloat(rs.getString("gia")) );
        mp.setHinh(rs.getString("hinh"));
        mp.setMoTa(rs.getString("mo_ta"));
        mp.setThuongHieu(rs.getString("thuong_hieu"));
        list.add(mp);
    }
    rs.close(); ps.close(); cnn.close();
    return list;
}

}
