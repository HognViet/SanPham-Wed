<%@page import="java.util.List"%>
<%@page import="Model.Mypham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thaosonviet.vn|Mỹ phẩm&Clinic</title>
    
    <link href="<%= request.getContextPath() %>/trangchu.css?v=<%= System.currentTimeMillis() %>" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
</head>
<body>
    
    <div class="banner">
        
        
        <img src="image/bannermypham.png" alt=""/>
    </div>

    
        <nav class="top-menu">
            <!-- LEFT -->
            <div class="nav-left">
        <a href="<%= request.getContextPath() %>/trangchu">
            <i class="fa fa-home"></i>
        </a>
    </div>
            <div class="nav-center">
   
        <form  action="<%= request.getContextPath() %>/chitietsanpham" method="get">
            <input type="text" name="id" placeholder="Tìm sản phẩm, thương hiệu bạn mong muốn..." required>
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
    </div>
<%
    Integer cartCount = (Integer) session.getAttribute("cartCount");
if (cartCount == null) cartCount = 0;
%>
    <!-- RIGHT: ICON -->
    <div class="nav-right">
        
        <a href="#noibat">Sản phẩm</a>
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
                    <a href="#noibat">Sản phẩm nổi bật (3)</a>
                    <a href="#hangmoi">Hàng mới (3)</a>
                    <a href="#banchay">Bán chạy (3)</a>
                    <a href="#giamgia">Giảm giá (3)</a>
                    
                </div>
                
            </div>
            

            
        </div>

        <div class="content">
            <% if (dbWarning != null && !dbWarning.isEmpty()) { %>
            <p style="color: #d9534f; font-weight: bold;"><%= dbWarning %></p>
            <% } %>
            <div id="noibat" class="content-title">Sản phẩm nổi bật</div>
            <div class="grid">
                <%
                    if (noibatList != null && !noibatList.isEmpty()) {
                        for (Mypham sp : noibatList) {
                %>
                <div class="card product-card" data-detail-url="<%= request.getContextPath() %>/chitietsanpham?id=<%= sp.getId() %>">
                    <img src="<%= sp.getHinh() %>" alt="<%= sp.getTen() %>">
                    <div class="card-body">
                        <div class="code">Ma SP: <%= sp.getId() %></div>
                        <div class="name"><%= sp.getTen() %></div>
                        <div class="price"><%= sp.getGia() %></div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/chitietsanpham?id=<%= sp.getId() %>">Xem chi tiet</a>
                    </div>
                </div>
                    
                <%
                        }
                    } else {
                %>
                <p>Chua co du lieu cho danh muc nay.</p>
                <%
                    }
                %>
            </div>
            <div id="hangmoi" class="content-title">Hàng mới</div>
            <div class="grid">
                <%
                    if (hangmoiList != null && !hangmoiList.isEmpty()) {
                        for (Mypham sp : hangmoiList) {
                %>
                <div class="card product-card" data-detail-url="<%= request.getContextPath() %>/chitietsanpham?id=<%= sp.getId() %>">
                    <img src="<%= sp.getHinh() %>" alt="<%= sp.getTen() %>">
                    <div class="card-body">
                        <div class="code">Ma SP: <%= sp.getId() %></div>
                        <div class="name"><%= sp.getTen() %></div>
                        <div class="price"><%= sp.getGia() %></div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/chitietsanpham?id=<%= sp.getId() %>">Xem chi tiet</a>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <p>Chua co du lieu cho danh muc nay.</p>
                <%
                    }
                %>
            </div>

            <div id="banchay" class="content-title">Hàng bán chạy</div>
            <div class="grid">
                <%
                    if (banchayList != null && !banchayList.isEmpty()) {
                        for (Mypham sp : banchayList) {
                %>
                <div class="card product-card" data-detail-url="<%= request.getContextPath() %>/chitietsanpham?id=<%= sp.getId() %>">
                    <img src="<%= sp.getHinh() %>" alt="<%= sp.getTen() %>">
                    <div class="card-body">
                        <div class="code">Ma SP: <%= sp.getId() %></div>
                        <div class="name"><%= sp.getTen() %></div>
                        <div class="price"><%= sp.getGia() %></div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/chitietsanpham?id=<%= sp.getId() %>">Xem chi tiet</a>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <p>Chua co du lieu cho danh muc nay.</p>
                <%
                    }
                %>
            </div>

            <div id="giamgia" class="content-title">Hàng giảm giá</div>
            <div class="grid">
                <%
                    if (giamgiaList != null && !giamgiaList.isEmpty()) {
                        for (Mypham sp : giamgiaList) {
                %>
                <div class="card product-card" data-detail-url="<%= request.getContextPath() %>/chitietsanpham?id=<%= sp.getId() %>">
                    <img src="<%= sp.getHinh() %>" alt="<%= sp.getTen() %>">
                    <div class="card-body">
                        <div class="code">Ma SP: <%= sp.getId() %></div>
                        <div class="name"><%= sp.getTen() %></div>
                        <div class="price"><%= sp.getGia() %></div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/chitietsanpham?id=<%= sp.getId() %>">Xem chi tiet</a>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <p>Chua co du lieu cho danh muc nay.</p>
                <%
                    }
                %>
            </div>
        </div>
    </div>
                    
    <button class="ai-chat-toggle" type="button" onclick="toggleAiChat()"><img src="image/chatbox.png" alt="Chatbox"></button>
    <div id="aiChatBox" class="ai-chat-box">
        <div class="ai-chat-header">AI Assistant</div>
        <div id="aiChatMessages" class="ai-chat-messages">
            <div class="ai-msg bot">Xin chao! Toi co the tu van san pham cho ban.</div>
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

    <script>
        document.querySelectorAll(".product-card").forEach(function (card) {
            card.addEventListener("click", function (event) {
                if (event.target.closest("a, button, input")) {
                    return;
                }
                var detailUrl = card.getAttribute("data-detail-url");
                if (detailUrl) {
                    window.location.href = detailUrl;
                }
            });
        });
    </script>
</body>
</html>