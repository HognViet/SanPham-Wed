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
        String id = request.getParameter("id");
        if (id == null || id.trim().isEmpty()) {
            id = "MP001";
        }

        Mypham sanpham = myphamDAO.getById(id);
        if (sanpham == null) {
            sanpham = new Mypham();
            sanpham.setId(id);
            sanpham.setTen("Khong tim thay san pham");
            sanpham.setGia("0 VND");
            sanpham.setHinh("https://picsum.photos/560/460?404");
            sanpham.setMoTa("Khong co mo ta.");
            sanpham.setThuongHieu("Dang cap nhat");
            sanpham.setTrongLuong("Dang cap nhat");
            sanpham.setMauSac("Dang cap nhat");
            sanpham.setHanDung("Dang cap nhat");
        }

        request.setAttribute("sanpham", sanpham);
        request.setAttribute("mvcForward", true);
        request.getRequestDispatcher("/Chitietsanpham.jsp").forward(request, response);
    } 
}
