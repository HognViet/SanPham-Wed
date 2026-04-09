<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gio hang - Website ban hang online</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/trangchu.css?v=20260407"/>
    <link href="trangchu.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="banner">
        <img src="image/bannerweb.png" alt="Banner website">
    </div>

    <nav class="top-menu">
        <a href="Trangchu.jsp">TRANG CHỦ</a>
        <a href="Trangchu.jsp#tatca">SẢN PHẨM</a>
        <a href="Dangky.jsp">ĐĂNG KÝ</a>
        <a href="Dangnhap.jsp">ĐĂNG NHẬP</a>
        <a href="Giohang.jsp">GIỎ HÀNG</a>
        <a href="Lienhe.jsp">LIÊN HỆ</a>
    </nav>

    <div class="container">
        <div class="left">
            <div class="box">
                <div class="box-title">Danh mục sản phẩm</div>
                <div class="left-menu">
                    <a href="Trangchu.jsp#tatca">Tất cả (12)</a>
                    <a href="Trangchu.jsp#hangmoi">Hàng mới (4)</a>
                    <a href="Trangchu.jsp#banchay">Bán chạy (4)</a>
                    <a href="Trangchu.jsp#giamgia">Giảm giá (4)</a>
                </div>
            </div>

            <div class="box">
                <div class="box-title">Thông tin</div>
                <div class="left-menu">
                    <a href="Dangky.jsp">Đăng ký tài khoản</a>
                    <a href="Dangnhap.jsp">Đăng nhập hệ thống</a>
                    <a href="Lienhe.jsp">Gửi liên hệ</a>
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
                    <tbody>
                        <tr>
                            <td>Son lì mềm mịn</td>
                            <td>320,000 VND</td>
                            <td>1</td>
                            <td>320,000 VND</td>
                            <td><a class="cart-remove" href="#">Xóa</a></td>
                        </tr>
                        <tr>
                            <td>Kem chống nắng SPF50+</td>
                            <td>259,000 VND</td>
                            <td>2</td>
                            <td>518,000 VND</td>
                            <td><a class="cart-remove" href="#">Xóa</a></td>
                        </tr>
                    </tbody>
                </table>

                <div class="cart-summary">
                    <p>Tổng cộng: <strong>838,000 VND</strong></p>
                    <div class="cart-actions">
                        <a href="Trangchu.jsp" class="btn-detail">Tiếp tục mua hàng</a>
                        <a href="#" class="login-btn cart-checkout">Thanh toán</a>
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
        Nguyen Thi Phuong Thao - 25/11/2005 | Ngo Van Son - |Ninh Hong Viet
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
</body>
</html>
