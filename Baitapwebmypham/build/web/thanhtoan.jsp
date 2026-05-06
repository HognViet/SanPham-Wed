<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%
    Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
    if (cart == null) {
        cart = new LinkedHashMap<String, Integer>();
    }

    int tong = 0;
    for (Map.Entry<String, Integer> item : cart.entrySet()) {
        String maSp = item.getKey();
        int soLuong = item.getValue();
        int donGia = 0;

        if ("MP001".equals(maSp)) {
            donGia = 320000;
        } else if ("MP002".equals(maSp)) {
            donGia = 289000;
        } else if ("MP003".equals(maSp)) {
            donGia = 199000;
        } else if ("MP004".equals(maSp)) {
            donGia = 350000;
        } else if ("MP005".equals(maSp)) {
            donGia = 149000;
        } else if ("MP006".equals(maSp)) {
            donGia = 259000;
        } else if ("MP007".equals(maSp)) {
            donGia = 420000;
        } else if ("MP008".equals(maSp)) {
            donGia = 179000;
        } else if ("MP009".equals(maSp)) {
            donGia = 89000;
        } else if ("MP010".equals(maSp)) {
            donGia = 199000;
        } else if ("MP011".equals(maSp)) {
            donGia = 275000;
        } else if ("MP012".equals(maSp)) {
            donGia = 109000;
        }

        tong += donGia * soLuong;
    }

    Integer cartCount = (Integer) session.getAttribute("cartCount");
    if (cartCount == null) cartCount = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thanh toan - Website ban hang online</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/trangchu.css?v=<%= System.currentTimeMillis() %>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <div class="banner">
        <img src="image/bannermypham.png" alt="Banner website">
    </div>

    <nav class="top-menu">
        <div class="nav-left">
            <a href="<%= request.getContextPath() %>/trangchu">
                <i class="fa fa-home"></i>
            </a>
        </div>
        <div class="nav-center">
            <form action="<%= request.getContextPath() %>/chitietsanpham" method="get">
                <input type="text" name="id" placeholder="Tìm sản phẩm, thương hiệu bạn mong muốn..." required>
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
        <div class="nav-right">
            <a href="<%= request.getContextPath() %>/trangchu#noibat">Sản phẩm</a>
            <a href="<%= request.getContextPath() %>/Dangky.jsp">Đăng ký</a>
            <a href="<%= request.getContextPath() %>/Dangnhap.jsp">
                <i class="fa-solid fa-user"></i>
                <span>Đăng nhập</span>
            </a>
            <a href="<%= request.getContextPath() %>/Giohang.jsp" class="cart-icon">
                <i class="fa-solid fa-cart-shopping"></i>
                <span class="cart-count"><%= cartCount %></span>
            </a>
            <a href="<%= request.getContextPath() %>/Lienhe.jsp">
                <i class="fa-solid fa-headset"></i> Liên hệ
            </a>
        </div>
    </nav>

    <div class="container">
        <div class="left">
            <div class="box">
                <div class="box-title">Danh mục sản phẩm</div>
                <div class="left-menu">
                    <a href="<%= request.getContextPath() %>/trangchu#noibat">Sản phẩm nổi bật (3)</a>
                    <a href="<%= request.getContextPath() %>/trangchu#hangmoi">Hàng mới (3)</a>
                    <a href="<%= request.getContextPath() %>/trangchu#banchay">Bán chạy (3)</a>
                    <a href="<%= request.getContextPath() %>/trangchu#giamgia">Giảm giá (3)</a>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="content-title">Thanh toán đơn hàng</div>
            <div class="contact-wrapper">
                <% if (cart.isEmpty()) { %>
                    <p>Giỏ hàng đang trống. Vui lòng thêm sản phẩm trước khi thanh toán.</p>
                    <a href="<%= request.getContextPath() %>/trangchu" class="btn-detail">Về trang chủ</a>
                <% } else { %>
                    <form class="contact-form" action="#" method="post">
                        <label for="fullName">Họ và tên người nhận</label>
                        <input id="fullName" name="fullName" type="text" placeholder="Nhập họ và tên" required>

                        <div class="contact-grid">
                            <div>
                                <label for="phone">Số điện thoại</label>
                                <input id="phone" name="phone" type="tel" placeholder="Nhập số điện thoại" required>
                            </div>
                            <div>
                                <label for="email">Email</label>
                                <input id="email" name="email" type="email" placeholder="Nhập email" required>
                            </div>
                        </div>

                        <label for="address">Địa chỉ nhận hàng</label>
                        <input id="address" name="address" type="text" placeholder="Số nhà, đường, phường/xã, quận/huyện, tỉnh/thành" required>

                        <label for="note">Ghi chú đơn hàng</label>
                        <textarea id="note" name="note" rows="4" placeholder="Ví dụ: Giao giờ hành chính, gọi trước khi giao..."></textarea>

                        <label for="paymentMethod">Phương thức thanh toán</label>
                        <select id="paymentMethod" name="paymentMethod" style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">
                            <option value="cod">Thanh toán khi nhận hàng (COD)</option>
                            <option value="bank">Chuyển khoản ngân hàng</option>
                            <option value="card">Thanh toán thẻ</option>
                        </select>

                        <div class="cart-summary" style="text-align:left;margin-top:14px;">
                            <p>Tạm tính: <strong><%= String.format("%,d", tong) %> VND</strong></p>
                        </div>

                        <button type="submit" class="login-btn">XÁC NHẬN ĐẶT HÀNG</button>
                    </form>
                <% } %>
            </div>
        </div>
    </div>

    <div class="footer">
        Nguyen Thi Phuong Thao - 25/11/2005 | Ngo Van Son - |Ninh Hong Viet
    </div>
</body>
</html>
