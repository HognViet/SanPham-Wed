<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="Model.Users"%>
<%@page import="Model.GioHangDAO"%>
<%
    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
    Double total = (Double) request.getAttribute("total");
    if (total == null) total = 0.0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gio hang - Website ban hang online</title>
    <link href="<%= request.getContextPath() %>/trangchu.css?v=<%= System.currentTimeMillis() %>" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <div class="banner">
        <img src="image/bannerweb.png" alt="Banner website">
    </div>

    <%
        Users userLogin = (Users) session.getAttribute("userLogin");
        int cartCount = 0;
        if (userLogin != null) {
            try {
                GioHangDAO ghDAO = new GioHangDAO();
                cartCount = ghDAO.countItems(userLogin.mauser);
            } catch (Exception e) {
                cartCount = 0;
            }
        }
    %>
    <nav class="top-menu">
        <div class="nav-left">
            <a href="<%= request.getContextPath() %>/trangchu">
                <i class="fa fa-home"></i>
            </a>
        </div>
        <div class="nav-center">
            
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
                    <a href="Trangchu.jsp#noibat">Sản phẩm nổi bật </a>
                    <a href="Trangchu.jsp#hangmoi">Hàng mới </a>
                    <a href="Trangchu.jsp#banchay">Bán chạy </a>
                    <a href="Trangchu.jsp#giamgia">Giảm giá </a>
                    <form class="home-search-form" action="<%= request.getContextPath() %>/Chitietsanpham.jsp" method="get">
                        <input type="text" name="id" placeholder="Tìm kiếm..." required><br>
                    <button type="submit">Tìm kiếm</button>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="content-title">Giỏ hàng của bạn</div>
            <div class="cart-wrapper">
                <table class="cart-table">
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                        <% if (cartItems == null || cartItems.isEmpty()) { %>
                            <tr><td colspan="5">Giỏ hàng đang trống!</td></tr>
                            <% } else { for (CartItem item : cartItems) { %>
                                <tr>
                                    <td><img src="<%= item.hinh %>" style="width:50px"> <%= item.ten %></td>
                                    <td><%= String.format("%,.0f", item.price) %> VND</td>
                                    <td><%= item.quantity %></td>
                                    <td><%= String.format("%,.0f", item.price * item.quantity) %> VND</td>
                                    <td><a class="cart-remove" href="<%= request.getContextPath() %>/XoaKhoiGio?cart_item_id=<%= item.cart_item_id %>">Xóa</a></td>
                                </tr>
                            <% }} %>
                </table>

                <div class="cart-summary">
                <p>Tổng cộng: <strong><%= String.format("%,.0f", total) %> VND</strong></p>
                <div class="cart-actions">
                        <a href="Trangchu.jsp" class="btn-detail">Tiếp tục mua hàng</a>
                        <a href="<%= request.getContextPath() %>/thanhtoan.jsp" class="login-btn cart-checkout">Thanh toán</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <button class="ai-chat-toggle" type="button" onclick="toggleAiChat()"><img src="image/chatbox.png" alt="Chatbox"></button>
    <div id="aiChatBox" class="ai-chat-box">
        <div class="ai-chat-header">AI Assistant</div>
        <div id="aiChatMessages" class="ai-chat-messages">
            <div class="ai-msg bot">Xin chao! Toi co the goi y san pham va ho tro gio hang.</div>
        </div>
        <div class="ai-chat-input">
            <input id="aiChatInput" type="text" placeholder="Nhap cau hoi...">
            <button type="button" onclick="sendAiMessage()">Gui</button>
        </div>
    </div>

    <div class="footer">
        Nguyen Thi Phuong Thao - 25/11/2005 | Ngo Van Son - |Ninh Hong Viet - 09/11/2005
    </div>
    <script>
        function toggleAiChat() {
            document.getElementById("aiChatBox").classList.toggle("open");
        }
        function sendAiMessage() {
            var input = document.getElementById("aiChatInput");
            var text = input.value.trim();
            if (!text) return;
            var messages = document.getElementById("aiChatMessages");
            messages.innerHTML += '<div class="ai-msg user">' + text + '</div>';
            messages.innerHTML += '<div class="ai-msg bot">Cam on ban! Day la giao dien frontend de tich hop AI API sau.</div>';
            input.value = "";
            messages.scrollTop = messages.scrollHeight;
        }
    </script>
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
