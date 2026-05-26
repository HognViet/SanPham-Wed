<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Order"%>
<%@page import="java.util.List"%>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    if (orders == null) orders = java.util.Collections.emptyList();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Quản lý đơn hàng</title>
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

                <div class="box">
                    <div class="box-title">Tìm kiếm đơn hàng</div>
                    <div class="left-menu" style="padding: 12px;">
                        <form action="<%= request.getContextPath()%>/AdminDonHangServlet" method="get">
                            <input type="text" name="keyword" placeholder="order_id / mauser / địa chỉ..." required
                                   style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">
                            <input type="hidden" name="action" value="search">
                            <button type="submit" class="login-btn" style="width:100%;margin-top:10px;">TÌM</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="content-title">Quản lý đơn hàng</div>
                <div class="login-wrapper" style="max-width: 1150px;">
                    <div style="display:flex; justify-content: space-between; align-items:center; margin-bottom:10px;">
                        <a class="btn-detail" href="<%= request.getContextPath()%>/AdminDonHangServlet?action=add">+ Thêm đơn hàng</a>
                        <div style="color:#777;">Tổng: <%= orders.size()%></div>
                    </div>

                    <table class="cart-table">
                        <thead>
                            <tr>
                                <th>Mã đơn</th>
                                <th>Người dùng</th>
                                <th>Tổng tiền</th>
                                <th>Địa chỉ</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (orders.isEmpty()) { %>
                                <tr><td colspan="5">Chưa có dữ liệu.</td></tr>
                            <% } else { %>
                                <% for (Order o : orders) { %>
                                    <tr>
                                        <td><%= o.order_id%></td>
                                        <td>
                                            Mauser: <%= o.mauser%><br>
                                            <span style="color:#777;"><%= o.accname%></span>
                                        </td>
                                        <td><%= String.format("%,.0f", o.total_price)%></td>
                                        <td><%= o.address%></td>
                                        <td>
                                            <a class="cart-remove" style="color:#1f6feb;" href="<%= request.getContextPath()%>/AdminDonHangServlet?action=detail&order_id=<%= o.order_id%>">Chi tiết</a>
                                            &nbsp;|&nbsp;
                                            <a class="cart-remove" href="<%= request.getContextPath()%>/AdminDonHangServlet?action=delete&order_id=<%= o.order_id%>"
                                               onclick="return confirm('Xóa đơn hàng này?');">Xóa</a>
                                            &nbsp;|&nbsp;
                                            <a class="cart-remove" style="color:#1f6feb;" href="<%= request.getContextPath()%>/AdminDonHangServlet?action=edit&order_id=<%= o.order_id%>">Sửa</a>
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