<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Users"%>
<%
    Users userEdit = (Users) request.getAttribute("userEdit");
    boolean isEdit = userEdit != null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= isEdit ? "Sửa người dùng" : "Thêm người dùng"%></title>
        <link href="<%= request.getContextPath()%>/trangchu.css?v=<%= System.currentTimeMillis()%>" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body>
        <div class="banner">
            <img src="image/banner.png" alt="">
        </div>

        <nav class="top-menu">
            <div class="nav-left">
                <a href="<%= request.getContextPath()%>/trangchu">
                    <i class="fa fa-home"></i>
                </a>
            </div>
            <div class="nav-right">
                <a href="<%= request.getContextPath()%>/AdminController?action=return">
                    Quay lại
                </a>
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
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="content-title"><%= isEdit ? "Sửa người dùng" : "Thêm người dùng"%></div>
                <div class="login-wrapper" style="max-width: 900px;">
                    <form action="<%= request.getContextPath()%>/AdminUserServlet" method="post">
                        <input type="hidden" name="formAction" value="<%= isEdit ? "edit" : "add"%>">
                        <% if (isEdit) { %>
                            <input type="hidden" name="mauser" value="<%= userEdit.mauser%>">
                        <% } %>

                        <label>Full name (accname)</label>
                        <input class="home-search-form input"
                               name="accname"
                               type="text"
                               required
                               value="<%= isEdit ? userEdit.accname : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <label>Loginname</label>
                        <input name="loginname"
                               type="text"
                               required
                               value="<%= isEdit ? userEdit.loginname : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <label>Mật khẩu</label>
                        <input name="pass"
                               type="text"
                               required
                               value="<%= isEdit ? userEdit.pass : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <label>Email</label>
                        <input name="email"
                               type="text"
                               value="<%= isEdit ? userEdit.email : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <label>Số điện thoại</label>
                        <input name="phone"
                               type="text"
                               value="<%= isEdit ? userEdit.phone : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <label>Địa chỉ</label>
                        <input name="address"
                               type="text"
                               value="<%= isEdit ? userEdit.address : ""%>"
                               style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">

                        <div style="display:flex; gap:10px; margin-top: 14px;">
                            <button type="submit" class="login-btn" style="flex:1;">LƯU</button>
                            <a class="btn-detail" style="display:flex; align-items:center; justify-content:center; padding:11px 16px;"
                               href="<%= request.getContextPath()%>/AdminController?action=return">HỦY</a>
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