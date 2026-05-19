<%@page import="Model.Users"%>
<%@page import="java.util.List"%>
<%@page import="Model.Mypham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Users"%>
<%@page import="Model.GioHangDAO"%>

<%
    if (request.getAttribute("mvcForward") == null) {
        response.sendRedirect(request.getContextPath() + "/trangchu");
        return;
    }

    List<Mypham> noibatList = (List<Mypham>) request.getAttribute("noibatList");
    List<Mypham> hangmoiList = (List<Mypham>) request.getAttribute("hangmoiList");
    List<Mypham> banchayList = (List<Mypham>) request.getAttribute("banchayList");
    List<Mypham> giamgiaList = (List<Mypham>) request.getAttribute("giamgiaList");

    String dbWarning = (String) request.getAttribute("dbWarning");

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

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thaosonviet.vn | Mỹ phẩm & Clinic</title>

        <link href="<%= request.getContextPath()%>/trangchu.css?v=<%= System.currentTimeMillis()%>" rel="stylesheet">

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>

    <body>


        <div class="banner">
            <img src="image/bannermypham.png" alt="">
        </div>


        <nav class="top-menu">


            <div class="nav-left">
                <a href="<%= request.getContextPath()%>/trangchu">
                    <i class="fa fa-home"></i>
                </a>
            </div>


            <div class="nav-center">

                <form action="<%= request.getContextPath()%>/chitietsanpham"
                      method="get">

                    <input type="text"
                           name="id"
                           placeholder="Tìm sản phẩm, thương hiệu bạn mong muốn..."
                           required>

                    <button type="submit">
                        <i class="fa fa-search"></i>
                    </button>

                </form>

            </div>


            <div class="nav-right">

                <a href="#noibat">Sản phẩm</a>

                <% if (userLogin == null) {%>


                <a href="<%= request.getContextPath()%>/Dangky.jsp">
                    Đăng ký
                </a>

                <a href="<%= request.getContextPath()%>/Dangnhap.jsp">

                    <i class="fa-solid fa-user"></i>

                    <span>Đăng nhập</span>

                </a>

                <% } else {%>


                <a href="#">

                    <i class="fa-solid fa-user"></i>

                    <span><%= userLogin.accname%></span>

                </a>

                <a href="#" onclick="showLogoutPopup()">

                    <i class="fa-solid fa-right-from-bracket"></i>

                    <span>Đăng xuất</span>

                </a>

                <% }%>

                <!-- GIỎ HÀNG -->
                <a href="<%= request.getContextPath()%>/Giohang.jsp"
                   class="cart-icon">

                    <i class="fa-solid fa-cart-shopping"></i>

                    <span class="cart-count">
                        <%= cartCount%>
                    </span>

                </a>

                <!-- LIÊN HỆ -->
                <a href="<%= request.getContextPath()%>/Lienhe.jsp">

                    <i class="fa-solid fa-headset"></i>

                    Liên hệ

                </a>

            </div>

        </nav>


        <div class="container">


            <div class="left">

                <div class="box">

                    <div class="box-title">
                        Danh mục sản phẩm
                    </div>

                    <div class="left-menu">

                        <a href="#noibat">Sản phẩm nổi bật</a>

                        <a href="#hangmoi">Hàng mới</a>

                        <a href="#banchay">Bán chạy</a>

                        <a href="#giamgia">Giảm giá</a>

                    </div>

                </div>

            </div>


            <div class="content">

                <% if (dbWarning != null && !dbWarning.isEmpty()) {%>

                <p style="color:red; font-weight:bold;">
                    <%= dbWarning%>
                </p>

                <% } %>


                <div id="noibat" class="content-title">
                    Sản phẩm nổi bật
                </div>

                <div class="grid">

                    <%
                        if (noibatList != null && !noibatList.isEmpty()) {
                            for (Mypham sp : noibatList) {
                    %>

                    <div class="card product-card"
                         data-detail-url="<%= request.getContextPath()%>/chitietsanpham?id=<%= sp.getId()%>">

                        <img src="<%= sp.getHinh()%>"
                             alt="<%= sp.getTen()%>">

                        <div class="card-body">

                            <div class="code">
                                Mã SP: <%= sp.getId()%>
                            </div>

                            <div class="name">
                                <%= sp.getTen()%>
                            </div>

                            <div class="price">
                                <%= sp.getGia()%>
                            </div>

                            <a class="btn-detail"
                               href="<%= request.getContextPath()%>/chitietsanpham?id=<%= sp.getId()%>">

                                Xem chi tiết

                            </a>

                        </div>

                    </div>

                    <% }
                    } else { %>

                    <p>Chưa có dữ liệu.</p>

                    <% } %>

                </div>


                <div id="hangmoi" class="content-title">
                    Hàng mới
                </div>

                <div class="grid">

                    <%
                        if (hangmoiList != null && !hangmoiList.isEmpty()) {
                            for (Mypham sp : hangmoiList) {
                    %>

                    <div class="card product-card"
                         data-detail-url="<%= request.getContextPath()%>/chitietsanpham?id=<%= sp.getId()%>">

                        <img src="<%= sp.getHinh()%>"
                             alt="<%= sp.getTen()%>">

                        <div class="card-body">

                            <div class="code">
                                Mã SP: <%= sp.getId()%>
                            </div>

                            <div class="name">
                                <%= sp.getTen()%>
                            </div>

                            <div class="price">
                                <%= sp.getGia()%>
                            </div>

                            <a class="btn-detail"
                               href="<%= request.getContextPath()%>/chitietsanpham?id=<%= sp.getId()%>">

                                Xem chi tiết

                            </a>

                        </div>

                    </div>

                    <% }
                    } else { %>

                    <p>Chưa có dữ liệu.</p>

                    <% } %>

                </div>

                <!-- BÁN CHẠY -->
                <div id="banchay" class="content-title">
                    Hàng bán chạy
                </div>

                <div class="grid">

                    <%
                        if (banchayList != null && !banchayList.isEmpty()) {
                            for (Mypham sp : banchayList) {
                    %>

                    <div class="card product-card"
                         data-detail-url="<%= request.getContextPath()%>/chitietsanpham?id=<%= sp.getId()%>">

                        <img src="<%= sp.getHinh()%>"
                             alt="<%= sp.getTen()%>">

                        <div class="card-body">

                            <div class="code">
                                Mã SP: <%= sp.getId()%>
                            </div>

                            <div class="name">
                                <%= sp.getTen()%>
                            </div>

                            <div class="price">
                                <%= sp.getGia()%>
                            </div>

                            <a class="btn-detail"
                               href="<%= request.getContextPath()%>/chitietsanpham?id=<%= sp.getId()%>">

                                Xem chi tiết

                            </a>

                        </div>

                    </div>

                    <% }
                    } else { %>

                    <p>Chưa có dữ liệu.</p>

                    <% } %>

                </div>

                <!-- GIẢM GIÁ -->
                <div id="giamgia" class="content-title">
                    Hàng giảm giá
                </div>

                <div class="grid">

                    <%
                        if (giamgiaList != null && !giamgiaList.isEmpty()) {
                            for (Mypham sp : giamgiaList) {
                    %>

                    <div class="card product-card"
                         data-detail-url="<%= request.getContextPath()%>/chitietsanpham?id=<%= sp.getId()%>">

                        <img src="<%= sp.getHinh()%>"
                             alt="<%= sp.getTen()%>">

                        <div class="card-body">

                            <div class="code">
                                Mã SP: <%= sp.getId()%>
                            </div>

                            <div class="name">
                                <%= sp.getTen()%>
                            </div>

                            <div class="price">
                                <%= sp.getGia()%>
                            </div>

                            <a class="btn-detail"
                               href="<%= request.getContextPath()%>/chitietsanpham?id=<%= sp.getId()%>">

                                Xem chi tiết

                            </a>

                        </div>

                    </div>

                    <% }
                    } else { %>

                    <p>Chưa có dữ liệu.</p>

                    <% } %>

                </div>

            </div>
        </div>

        <!-- AI CHAT -->
        <button class="ai-chat-toggle"
                type="button"
                onclick="toggleAiChat()">

            <img src="image/chatbox.png" alt="Chatbox">

        </button>

        <div id="aiChatBox" class="ai-chat-box">

            <div class="ai-chat-header">
                AI Assistant
            </div>

            <div id="aiChatMessages"
                 class="ai-chat-messages">

                <div class="ai-msg bot">
                    Xin chào! Tôi có thể tư vấn sản phẩm cho bạn.
                </div>

            </div>

            <div class="ai-chat-input">

                <input id="aiChatInput"
                       type="text"
                       placeholder="Nhập câu hỏi...">

                <button type="button"
                        onclick="sendAiMessage()">

                    Gửi

                </button>

            </div>

        </div>

        <!-- FOOTER -->
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


        <script>

            document.querySelectorAll(".product-card")
                    .forEach(function (card) {

                        card.addEventListener("click",
                                function (event) {

                                    if (event.target.closest("a, button, input")) {
                                        return;
                                    }

                                    var detailUrl =
                                            card.getAttribute("data-detail-url");

                                    if (detailUrl) {
                                        window.location.href = detailUrl;
                                    }

                                });

                    });

        </script>


        <%
            String mess = (String) request.getAttribute("mess");
        %>

        <% if (mess != null) {%>

        <div id="popup-overlay">

            <div id="popup-box">

                <i class="fas fa-circle-check"></i>

                <p id="popup-message"
                   class="mess-success">

                    <%= mess%>

                </p>

                <button id="popup-close"
                        onclick="closePopup()">

                    Đóng

                </button>

            </div>

        </div>

        <script>

            window.addEventListener("load", function () {

                document.getElementById("popup-overlay")
                        .style.display = "flex";

            });

            function closePopup() {

                document.getElementById("popup-overlay")
                        .style.display = "none";

            }

        </script>

        <% }%>

        <!-- POPUP LOGOUT -->
        <div id="logout-overlay">

            <div id="logout-box">

                <i class="fas fa-right-from-bracket"
                   style="font-size:48px;color:#e74c3c;margin-bottom:15px;display:block;">
                </i>

                <p id="logout-message">
                    Bạn có chắc muốn đăng xuất không?
                </p>

                <div id="logout-buttons">

                    <button id="btn-cancel"
                            onclick="closeLogoutPopup()">

                        Huỷ

                    </button>

                    <button id="btn-confirm"
                            onclick="window.location.href = '<%= request.getContextPath()%>/Dangxuat'">

                        Đăng xuất

                    </button>

                </div>

            </div>

        </div>

        <script>

            function showLogoutPopup() {

                document.getElementById("logout-overlay")
                        .style.display = "flex";

            }

            function closeLogoutPopup() {

                document.getElementById("logout-overlay")
                        .style.display = "none";

            }

        </script>

    </body>
</html>