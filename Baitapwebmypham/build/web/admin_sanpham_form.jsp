<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Mypham"%>
<%
    Mypham spEdit = (Mypham) request.getAttribute("spEdit");
    boolean isEdit = spEdit != null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= isEdit ? "Sửa sản phẩm" : "Thêm sản phẩm"%></title>
        <link href="<%= request.getContextPath()%>/trangchu.css?v=<%= System.currentTimeMillis()%>" rel="stylesheet">
    </head>
    <body>
        <div class="banner">
            <img src="image/bannermypham.png" alt="">
        </div>

        <div class="container">
            <div class="left">
                <div class="box">
                    <div class="box-title">Danh mục quản trị</div>
                    <div class="left-menu">
                        <a href="<%= request.getContextPath()%>/AdminUserServlet?action=list">Quản lý người dùng</a>
                        <a href="<%= request.getContextPath()%>/AdminSanPhamServlet?action=list">Sản phẩm</a>
                        <a href="<%= request.getContextPath()%>/AdminDonHangServlet?action=list">Đơn hàng</a>
                        <a href="<%= request.getContextPath()%>/AdminGioHangServlet?action=list">Giỏ hàng</a>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="content-title"><%= isEdit ? "Sửa sản phẩm" : "Thêm sản phẩm"%></div>
                <div class="login-wrapper" style="max-width: 1000px;">
                    <form action="<%= request.getContextPath()%>/AdminSanPhamServlet" method="post">
                        <input type="hidden" name="formAction" value="<%= isEdit ? "edit" : "add"%>">

                        <label>Mã sản phẩm (id)</label>
                        <input type="text"
                               name="id"
                               required
                               value="<%= isEdit ? spEdit.getId() : ""%>"
                               <%= isEdit ? "readonly" : ""%>
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <label>Tên sản phẩm</label>
                        <input type="text"
                               name="ten"
                               required
                               value="<%= isEdit ? spEdit.getTen() : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <label>Giá</label>
                        <input type="text"
                               name="gia"
                               required
                               value="<%= isEdit ? spEdit.getGia() : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <label>Hình (URL)</label>
                        <input type="text"
                               name="hinh"
                               required
                               value="<%= isEdit ? spEdit.getHinh() : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <label>Mô tả</label>
                        <textarea name="mo_ta"
                                  style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;min-height:90px;"><%= isEdit ? spEdit.getMoTa() : ""%></textarea>

                        <label>Thương hiệu</label>
                        <input type="text" name="thuong_hieu"
                               value="<%= isEdit ? spEdit.getThuongHieu() : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <label>Trọng lượng</label>
                        <input type="text" name="trong_luong"
                               value="<%= isEdit ? spEdit.getTrongLuong() : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <label>Màu sắc</label>
                        <input type="text" name="mau_sac"
                               value="<%= isEdit ? spEdit.getMauSac() : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <label>Hạn dùng</label>
                        <input type="text" name="han_dung"
                               value="<%= isEdit ? spEdit.getHanDung() : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <label>Danh mục</label>
                        <input type="text" name="danh_muc"
                               required
                               value="<%= isEdit ? spEdit.getDanhMuc() : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <div style="display:flex; gap:10px; margin-top: 14px;">
                            <button type="submit" class="login-btn" style="flex:1;">LƯU</button>
                            <a class="btn-detail" style="display:flex; align-items:center; justify-content:center; padding:11px 16px; text-decoration:none; color:#fff;"
                               href="<%= request.getContextPath()%>/AdminSanPhamServlet?action=list">HỦY</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="footer">
            Nguyen Thi Phuong Thao - 25/11/2005 | Ngo Van Son 28/02/2004 - |Ninh Hong Viet 09/11/2005
        </div>
    </body>
</html>