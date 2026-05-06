package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MyphamDAO {
    private Mypham mapRow(ResultSet rs) throws Exception {
        Mypham sp = new Mypham();
        sp.setId(rs.getString("id"));
        sp.setTen(rs.getString("ten"));
        sp.setGia(rs.getString("gia"));
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
}
