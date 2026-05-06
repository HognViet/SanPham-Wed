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
        List<Mypham> noibatList = myphamDAO.getByDanhMuc("noibat", 3);
        List<Mypham> hangmoiList = myphamDAO.getByDanhMuc("hangmoi", 3);
        List<Mypham> banchayList = myphamDAO.getByDanhMuc("banchay", 3);
        List<Mypham> giamgiaList = myphamDAO.getByDanhMuc("giamgia", 3);

        request.setAttribute("noibatList", noibatList);
        request.setAttribute("hangmoiList", hangmoiList);
        request.setAttribute("banchayList", banchayList);
        request.setAttribute("giamgiaList", giamgiaList);
        request.setAttribute("mvcForward", true);

        if (noibatList.isEmpty() && hangmoiList.isEmpty() && banchayList.isEmpty() && giamgiaList.isEmpty()) {
            request.setAttribute("dbWarning", "Khong lay duoc du lieu. Hay kiem tra: MySQL da chay, da import webmypham_demo.sql, dung DB webmypham.");
        }
        request.getRequestDispatcher("/Trangchu.jsp").forward(request, response);
    }
}
