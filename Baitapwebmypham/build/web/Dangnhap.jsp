<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dang nhap - Website ban hang online</title>
    <link href="<%= request.getContextPath() %>/trangchu.css?v=<%= System.currentTimeMillis() %>" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <div class="banner">
        <img src="image/bannerweb.png" alt="Banner website">
    </div>

    <%
        Integer cartCount = (Integer) session.getAttribute("cartCount");
        if (cartCount == null) cartCount = 0;
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
                    <a href="Trangchu.jsp#tatca">Tất cả (12)</a>
                    <a href="Trangchu.jsp#hangmoi">Hàng mới (4)</a>
                    <a href="Trangchu.jsp#banchay">Bán chạy (4)</a>
                    <a href="Trangchu.jsp#giamgia">Giảm giá (4)</a>
                    
                </div>
            </div>

           
        </div>

        <div class="content">
            <div class="content-title">Đăng nhập tài khoản</div>
            <div class="login-wrapper">
                <form class="login-form" action="#" method="post">
                    <label for="username">Tên đăng nhập</label>
                    <input id="username" name="username" type="text" placeholder="Nhập tên đăng nhập" required>

                    <label for="password">Mật khẩu</label>
                    <input id="password" name="password" type="password" placeholder="Nhập mật khẩu" required>

                    <div class="login-row">
                        <label class="remember-wrap">
                            <input type="checkbox" name="remember">
                            Ghi nhớ đăng nhập
                        </label>
                        <a class="forgot-link" href="#">Quên mật khẩu?</a>
                    </div>

                    <button type="submit" class="login-btn">ĐĂNG NHẬP</button>
                    <p class="register-text">Chưa có tài khoản? <a href="Dangky.jsp">Đăng ký ngay</a></p>
                </form>
            </div>
        </div>
    </div>

    <button class="ai-chat-toggle" type="button" onclick="toggleAiChat()"><img src="image/chatbox.png" alt="Chatbox"></button>
    <div id="aiChatBox" class="ai-chat-box">
        <div class="ai-chat-header">AI Assistant</div>
        <div id="aiChatMessages" class="ai-chat-messages">
            <div class="ai-msg bot">Xin chao! Toi co the ho tro ban dang nhap hoac tim san pham.</div>
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
