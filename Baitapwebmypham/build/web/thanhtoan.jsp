<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Users"%>
<%@page import="Model.GioHangDAO"%>
<%@page import="Model.CartItem"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thanh toan - Website ban hang online</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/trangchu.css?v=<%= System.currentTimeMillis() %>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
    <%
        Users userLogin = (Users) session.getAttribute("userLogin");
        int cartCount = 0;
        List<CartItem> cartItems = null;
        double tong = 0;

        if (userLogin != null) {
            try {
                GioHangDAO ghDAO = new GioHangDAO();
                cartItems = ghDAO.getCartItems(userLogin.mauser);
                cartCount = ghDAO.countItems(userLogin.mauser);
                for (CartItem item : cartItems) {
                    tong += item.price * item.quantity;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>
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
            <% if (userLogin == null) { %>
                <a href="<%= request.getContextPath() %>/Dangky.jsp">Đăng ký</a>
                <a href="<%= request.getContextPath() %>/Dangnhap.jsp">
                    <i class="fa-solid fa-user"></i>
                    <span>Đăng nhập</span>
                </a>
            <% } else { %>
                <a href="#">
                    <i class="fa-solid fa-user"></i>
                    <span><%= userLogin.accname %></span>
                </a>
                <a href="#" onclick="showLogoutPopup()">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    <span>Đăng xuất</span>
                </a>
            <% } %>
            <a href="<%= request.getContextPath() %>/GioHangController" class="cart-icon">
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
                    <% if (cartItems == null || cartItems.isEmpty()) { %>                    
                    <p>Giỏ hàng đang trống. Vui lòng thêm sản phẩm trước khi thanh toán.</p>
                    <a href="<%= request.getContextPath() %>/trangchu" class="btn-detail">Về trang chủ</a>
                <% } else { %>
                        <form class="contact-form" action="<%= request.getContextPath() %>/ThanhToan" method="post">    
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
                           <p>Tạm tính: <strong><%= String.format("%,.0f", tong) %> VND</strong></p>
                        </div>

                        <button type="submit" class="login-btn">XÁC NHẬN ĐẶT HÀNG</button>
                    </form>
                <% } %>
            </div>
        </div>
    </div>

    <div class="footer">
        Nguyen Thi Phuong Thao - 25/11/2005 | Ngo Van Son 28/02/2004 - |Ninh Hong Viet 09/11/2005
    </div>
            <!-- Popup đăng xuất -->
        <div id="logout-overlay">
            <div id="logout-box">
                <i class="fas fa-right-from-bracket" style="font-size:48px; color:#e74c3c; margin-bottom:15px; display:block;"></i>
                <p id="logout-message">Bạn có chắc muốn đăng xuất không?</p>
                <div id="logout-buttons">
                    <button id="btn-cancel" onclick="closeLogoutPopup()">Huỷ</button>
                    <button id="btn-confirm" onclick="window.location.href='<%= request.getContextPath() %>/Dangxuat'">Đăng xuất</button>
                </div>
            </div>
        </div>
        <script>
            function showLogoutPopup() {
                document.getElementById("logout-overlay").style.display = "flex";
            }
            function closeLogoutPopup() {
                document.getElementById("logout-overlay").style.display = "none";
            }
        </script>
</body>
</html>
