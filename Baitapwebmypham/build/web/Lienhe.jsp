<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Users"%>
<%@page import="Model.GioHangDAO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lien he - Website ban hang online</title>
    <link href="<%= request.getContextPath() %>/trangchu.css?v=<%= System.currentTimeMillis() %>" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <div class="banner">
        <img src="image/banner.png" alt="Banner website">
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
        Nguyen Thi Phuong Thao - 25/11/2005 | Ngo Van Son 28/02/2004 - |Ninh Hong Viet 09/11/2005
    </div>
    <script>
    function toggleAiChat() {
        document.getElementById("aiChatBox").classList.toggle("open");
    }

    async function sendAiMessage() {
        var input = document.getElementById("aiChatInput");
        var text = input.value.trim();
        if (!text) return;
        var messages = document.getElementById("aiChatMessages");
        messages.innerHTML += '<div class="ai-msg user">' + text + '</div>';
        input.value = "";
        var loadingId = "loading-" + Date.now();
        messages.innerHTML += '<div class="ai-msg bot" id="' + loadingId + '">Đang trả lời...</div>';
        messages.scrollTop = messages.scrollHeight;
        try {
            var res = await fetch("AIChat", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "message=" + encodeURIComponent(text)
            });
            var reply = await res.text();
            document.getElementById(loadingId).innerHTML = reply;
        } catch (err) {
            document.getElementById(loadingId).innerText = "Lỗi kết nối. Vui lòng thử lại!";
        }
        messages.scrollTop = messages.scrollHeight;
    }

    document.getElementById("aiChatInput").addEventListener("keypress", function(e) {
        if (e.key === "Enter") sendAiMessage();
    });
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
