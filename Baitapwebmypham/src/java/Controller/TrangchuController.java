package Controller;

import Model.Mypham;
import Model.MyphamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/trangchu")
public class TrangchuController extends HttpServlet {

    private final MyphamDAO myphamDAO = new MyphamDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Mypham> noibatList = myphamDAO.getByDanhMuc("noibat", 30);
        List<Mypham> hangmoiList = myphamDAO.getByDanhMuc("hangmoi", 30);
        List<Mypham> banchayList = myphamDAO.getByDanhMuc("banchay", 30);
        List<Mypham> giamgiaList = myphamDAO.getByDanhMuc("giamgia", 30);

        request.setAttribute("noibatList", noibatList);
        request.setAttribute("hangmoiList", hangmoiList);
        request.setAttribute("banchayList", banchayList);
        request.setAttribute("giamgiaList", giamgiaList);
        request.setAttribute("mvcForward", true);
        String mess = request.getParameter("mess");
        if (mess != null && mess.equals("success")) {
            request.setAttribute("mess", "Đăng ký tài khoản thành công!");
        } else if (mess != null && mess.equals("successlogin")) {
            request.setAttribute("mess", "Đăng nhập thành công!");
        }else if (mess != null && mess.equals("orderSuccess")) {
            request.setAttribute("mess", "Đặt hàng thành công! Cảm ơn bạn đã mua hàng.");
        }
        if (noibatList.isEmpty() && hangmoiList.isEmpty() && banchayList.isEmpty() && giamgiaList.isEmpty()) {
            request.setAttribute("dbWarning", "Khong lay duoc du lieu. Hay kiem tra: MySQL da chay, da import webmypham_demo.sql, dung DB webmypham.");
        }
        request.getRequestDispatcher("/Trangchu.jsp").forward(request, response);
    }
}
