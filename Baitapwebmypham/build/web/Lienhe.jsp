<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lien he - Website ban hang online</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/trangchu.css?v=20260407"/>
    <link href="trangchu.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="banner">
        <img src="image/bannerweb.png" alt="Banner website">
    </div>

    <nav class="top-menu">
        <a href="<%= request.getContextPath() %>/Trangchu.jsp">TRANG CHỦ</a>
        <a href="<%= request.getContextPath() %>/Trangchu.jsp#tatca">SẢN PHẨM</a>
        <a href="<%= request.getContextPath() %>/Dangky.jsp">ĐĂNG KÝ</a>
        <a href="<%= request.getContextPath() %>/Dangnhap.jsp">ĐĂNG NHẬP</a>
        <a href="<%= request.getContextPath() %>/Giohang.jsp">GIỎ HÀNG</a>
        <a href="<%= request.getContextPath() %>/Lienhe.jsp">LIÊN HỆ</a>
    </nav>

    <div class="container">
        <div class="left">
            <div class="box">
                <div class="box-title">Danh mục sản phẩm</div>
                <div class="left-menu">
                    <a href="<%= request.getContextPath() %>/Trangchu.jsp#tatca">Tất cả (12)</a>
                    <a href="<%= request.getContextPath() %>/Trangchu.jsp#hangmoi">Hàng mới (4)</a>
                    <a href="<%= request.getContextPath() %>/Trangchu.jsp#banchay">Bán chạy (4)</a>
                    <a href="<%= request.getContextPath() %>/Trangchu.jsp#giamgia">Giảm giá (4)</a>
                </div>
            </div>

            
        </div>

        <div class="content">
            <div class="content-title">Liên hệ với chúng tôi</div>
            <div class="contact-wrapper">
                <form class="contact-form" action="#" method="post">
                    <label for="contactName">Họ và tên</label>
                    <input id="contactName" name="contactName" type="text" placeholder="Nhập họ và tên" required>

                    <div class="contact-grid">
                        <div>
                            <label for="contactEmail">Email</label>
                            <input id="contactEmail" name="contactEmail" type="email" placeholder="Nhập email" required>
                        </div>
                        <div>
                            <label for="contactPhone">Số điện thoại</label>
                            <input id="contactPhone" name="contactPhone" type="tel" placeholder="Nhập số điện thoại" required>
                        </div>
                    </div>

                    <label for="contactSubject">Chủ đề</label>
                    <input id="contactSubject" name="contactSubject" type="text" placeholder="Nhập chủ đề liên hệ" required>

                    <label for="contactMessage">Nội dung liên hệ</label>
                    <textarea id="contactMessage" name="contactMessage" rows="5" placeholder="Nhập nội dung bạn muốn gửi" required></textarea>

                    <button type="submit" class="login-btn">GỬI LIÊN HỆ</button>
                </form>
            </div>
        </div>
    </div>

    <button class="ai-chat-toggle" type="button" onclick="toggleAiChat()"><img src="image/chatbox.png" alt="Chatbox"></button>
    <div id="aiChatBox" class="ai-chat-box">
        <div class="ai-chat-header">AI Assistant</div>
        <div id="aiChatMessages" class="ai-chat-messages">
            <div class="ai-msg bot">Xin chao! Toi co the huong dan ban de lai thong tin lien he.</div>
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
