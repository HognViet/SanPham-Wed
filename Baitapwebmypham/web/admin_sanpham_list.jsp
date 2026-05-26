<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Mypham"%>
<%@page import="java.util.List"%>
<%
    List<Mypham> sanphams = (List<Mypham>) request.getAttribute("sanphams");
    if (sanphams == null) sanphams = java.util.Collections.emptyList();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Quản lý sản phẩm</title>
        <link href="<%= request.getContextPath()%>/trangchu.css?v=<%= System.currentTimeMillis()%>" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body>
        <div class="banner">
            <img src="image/bannermypham.png" alt="">
        </div>

        <nav class="top-menu">
            <div class="nav-left">
                <a href="<%= request.getContextPath()%>/trangchu">
                    <i class="fa fa-home"></i>
                </a>
            </div>
            <div class="nav-center">
                <form action="<%= request.getContextPath()%>/AdminSanPhamServlet" method="get">
                    <input type="text" name="keyword" placeholder="Admin: Tìm sản phẩm..." required>
                    <input type="hidden" name="action" value="search">
                    <button type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                </form>
            </div>
            <div class="nav-right">
                <a href="<%= request.getContextPath()%>/AdminController?action=listUser">User</a>
                <a href="<%= request.getContextPath()%>/AdminController?action=listOrder">Đơn hàng</a>
            </div>
        </nav>

        <div class="container">
            <div class="left">
                <div class="box">
                    <div class="box-title">Danh mục quản trị</div>
                    <div class="left-menu">
                        <a href="<%= request.getContextPath()%>/AdminController?action=listUser">Quản lý người dùng</a>
                        <a href="<%= request.getContextPath()%>/AdminController?action=listProfuct">Sản phẩm</a>
                        <a href="<%= request.getContextPath()%>/AdminController?action=listOrder">Đơn hàng</a>
                        <a href="<%= request.getContextPath()%>/trangchu">Quay lại trang người dùng</a>
                    </div>
                </div>
                    <div class="box">
                    <div class="box-title">Tìm kiếm sản phẩm</div>
                    <div class="left-menu" style="padding: 12px;">
                        <form action="<%= request.getContextPath()%>/AdminUserServlet" method="get">
                            <input type="text" name="keyword" placeholder="mã sản phẩm / tên sản phẩm...." required
                                   style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">
                            <input type="hidden" name="action" value="search">
                            <button type="submit" class="login-btn" style="width:100%;margin-top:10px;">TÌM</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="content-title">Quản lý sản phẩm</div>
                <div class="login-wrapper" style="max-width: 1150px;">
                    <div style="display:flex; justify-content: space-between; align-items:center; margin-bottom: 10px;">
                        <a class="btn-detail" href="<%= request.getContextPath()%>/AdminSanPhamServlet?action=add">+ Thêm sản phẩm</a>
                        <div style="color:#777;">Tổng: <%= sanphams.size()%></div>
                    </div>

                    <table class="cart-table">
                        <thead>
                            <tr>
                                <th>Mã SP</th>
                                <th>Tên</th>
                                <th>Giá</th>
                                <th>Danh mục</th>
                                <th>Màu Sắc</th>
                                <th>Thương Hiệu</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (sanphams.isEmpty()) { %>
                                <tr><td colspan="6">Chưa có dữ liệu.</td></tr>
                            <% } else { %>
                                <% for (Mypham sp : sanphams) { %>
                                    <tr>
                                        <td><%= sp.getId()%></td>
                                        <td><%= sp.getTen()%></td>
                                        <td><%= sp.getGia()%></td>
                                        <td><%= sp.getDanhMuc()%></td>
                                        <td>
                                            <img src="<%= sp.getHinh()%>" alt="" style="width:60px; height:40px; object-fit:cover;">
                                        </td>
                                        <td>
                                            <a class="cart-remove" style="color:#1f6feb;" href="<%= request.getContextPath()%>/AdminSanPhamServlet?action=edit&id=<%= sp.getId()%>">Sửa</a>
                                            &nbsp;|&nbsp;
                                            <a class="cart-remove" href="<%= request.getContextPath()%>/AdminSanPhamServlet?action=delete&id=<%= sp.getId()%>"
                                               onclick="return confirm('Xóa sản phẩm này?');">Xóa</a>
                                        </td>
                                    </tr>
                                <% } %>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="footer">
            Nguyen Thi Phuong Thao - 25/11/2005 | Ngo Van Son 28/02/2004 - |Ninh Hong Viet 09/11/2005
        </div>
    </body>
</html>