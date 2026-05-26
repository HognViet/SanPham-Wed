package Controller;

import Model.Mypham;
import Model.MyphamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/chitietsanpham")
public class ChitietsanphamController extends HttpServlet {

    private final MyphamDAO myphamDAO = new MyphamDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        Mypham sanpham = null;

        if (idParam != null && !idParam.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idParam.trim());
                sanpham = myphamDAO.getById(idParam);
            } catch (NumberFormatException e) {
                // id không phải số → sanpham = null, xử lý bên dưới
            }
        }

        if (sanpham == null) {
            sanpham = new Mypham();
            sanpham.setId(0);
            sanpham.setTen("Không tìm thấy sản phẩm");
            sanpham.setGia(0f);
            sanpham.setHinh("https://picsum.photos/560/460?404");
            sanpham.setMoTa("Không có mô tả.");
            sanpham.setThuongHieu("Đang cập nhật");
            sanpham.setTrongLuong("Đang cập nhật");
            sanpham.setMauSac("Đang cập nhật");
            sanpham.setHanDung("Đang cập nhật");
        }

        request.setAttribute("sanpham", sanpham);
        request.setAttribute("mvcForward", true);
        request.getRequestDispatcher("/Chitietsanpham.jsp").forward(request, response);
    }
}