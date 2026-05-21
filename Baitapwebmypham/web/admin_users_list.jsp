<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Users"%>
<%@page import="java.util.List"%>
<%@page import="Model.GioHangDAO"%>
<%
    Users userLogin = (Users) session.getAttribute("userLogin");
    int cartCount = 0;
    if (userLogin != null) {
        try {
            cartCount = new GioHangDAO().countItems(userLogin.mauser);
        } catch (Exception e) {
            cartCount = 0;
        }
    }
    List<Users> users = (List<Users>) request.getAttribute("users");
    if (users == null) users = java.util.Collections.emptyList();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Quản lý người dùng</title>
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
                <a href="#noibat">Sản phẩm</a>
                <a href="#">
                    <i class="fa-solid fa-user"></i>
                    <span><%= userLogin != null ? userLogin.accname : "Admin"%></span>
                </a>
                <a href="#" onclick="showLogoutPopup()">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    <span>Đăng xuất</span>
                </a>
                <a href="<%= request.getContextPath()%>/Giohang.jsp" class="cart-icon">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <span class="cart-count"><%= cartCount%></span>
                </a>
                <a href="<%= request.getContextPath()%>/Lienhe.jsp">
                    <i class="fa-solid fa-headset"></i> Liên hệ
                </a>
            </div>
        </nav>

        <div class="container">
            <div class="left">
                <div class="box">
                    <div class="box-title">Danh mục quản trị</div>
                    <div class="left-menu">
                        <a href="<%= request.getContextPath()%>/AdminUserServlet?action=list">Quản lý người dùng</a>
                        <a href="<%= request.getContextPath()%>/AdminSanPhamServlet?action=list">Sản phẩm</a>
                        <a href="<%= request.getContextPath()%>/AdminDonHangServlet?action=list">Đơn hàng</a>
                        <a href="<%= request.getContextPath()%>/AdminGioHangServlet?action=list">Giỏ hàng</a>
                        <a href="<%= request.getContextPath()%>/trangchu">Quay lại trang người dùng</a>
                    </div>
                </div>

                <div class="box">
                    <div class="box-title">Tìm kiếm người dùng</div>
                    <div class="left-menu" style="padding: 12px;">
                        <form action="<%= request.getContextPath()%>/AdminUserServlet" method="get">
                            <input type="text" name="keyword" placeholder="loginname / accname / email..." required
                                   style="width:100%;padding:11px 12px;border:1px solid #dcdcdc;border-radius:8px;outline:none;">
                            <input type="hidden" name="action" value="search">
                            <button type="submit" class="login-btn" style="width:100%;margin-top:10px;">TÌM</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="content-title">Quản lý người dùng</div>
                <div class="login-wrapper" style="max-width: 1100px;">
                    <div style="display:flex; justify-content: space-between; align-items:center; margin-bottom: 10px;">
                        <a class="btn-detail" href="<%= request.getContextPath()%>/AdminUserServlet?action=add">+ Thêm người dùng</a>
                        <div style="color:#777;">Tổng: <%= users.size()%></div>
                    </div>

                    <table class="cart-table">
                        <thead>
                            <tr>
                                <th>Mã</th>
                                <th>Tên hiển thị</th>
                                <th>Loginname</th>
                                <th>Mật khẩu</th>
                                <th>Email</th>
                                <th>SĐT</th>
                                <th>Địa chỉ</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (users.isEmpty()) { %>
                                <tr><td colspan="8">Chưa có dữ liệu.</td></tr>
                            <% } else { %>
                                <% for (Users u : users) { %>
                                    <tr>
                                        <td><%= u.mauser%></td>
                                        <td><%= u.accname%></td>
                                        <td><%= u.loginname%></td>
                                        <td><%= u.pass%></td>
                                        <td><%= u.email%></td>
                                        <td><%= u.phone%></td>
                                        <td><%= u.address%></td>
                                        <td>
                                            <a class="cart-remove" style="color:#1f6feb;" href="<%= request.getContextPath()%>/AdminUserServlet?action=edit&mauser=<%= u.mauser%>">Sửa</a>
                                            &nbsp;|&nbsp;
                                            <a class="cart-remove" href="<%= request.getContextPath()%>/AdminUserServlet?action=delete&mauser=<%= u.mauser%>"
                                               onclick="return confirm('Xóa người dùng này?');">Xóa</a>
                                        </td>
                                    </tr>
                                <% } %>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- AI CHAT -->
        <button class="ai-chat-toggle" type="button" onclick="toggleAiChat()">
            <img src="image/chatbox.png" alt="Chatbox">
        </button>
        <div id="aiChatBox" class="ai-chat-box">
            <div class="ai-chat-header">AI Trợ lý</div>
            <div id="aiChatMessages" class="ai-chat-messages">
                <div class="ai-msg bot">Xin chào! Bạn có thể quản lý người dùng tại đây.</div>
            </div>
            <div class="ai-chat-input">
                <input id="aiChatInput" type="text" placeholder="Nhập câu hỏi...">
                <button type="button" onclick="sendAiMessage()">Gửi</button>
            </div>
        </div>

        <div class="footer">
            Nguyen Thi Phuong Thao - 25/11/2005 | Ngo Van Son 28/02/2004 - |Ninh Hong Viet 09/11/2005
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
            function showLogoutPopup() {
                document.getElementById("logout-overlay").style.display = "flex";
            }
            function closeLogoutPopup() {
                document.getElementById("logout-overlay").style.display = "none";
            }
        </script>

        <div id="logout-overlay">
            <div id="logout-box">
                <i class="fas fa-right-from-bracket" style="font-size:48px;color:#e74c3c;margin-bottom:15px;display:block;"></i>
                <p id="logout-message">Bạn có chắc muốn đăng xuất không?</p>
                <div id="logout-buttons">
                    <button id="btn-cancel" onclick="closeLogoutPopup()">Huỷ</button>
                    <button id="btn-confirm" onclick="window.location.href = '<%= request.getContextPath()%>/Dangxuat'">Đăng xuất</button>
                </div>
            </div>
        </div>
    </body>
</html>