<%@page import="Model.Mypham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getAttribute("mvcForward") == null) {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/chitietsanpham");
        } else {
            response.sendRedirect(request.getContextPath() + "/chitietsanpham?id=" + idParam);
        }
        return;
    }
    Mypham sanpham = (Mypham) request.getAttribute("sanpham");
    String id = sanpham != null ? sanpham.getId() : "MP001";
    String ten = sanpham != null ? sanpham.getTen() : "Khong tim thay san pham";
    String gia = sanpham != null ? sanpham.getGia() : "0 VND";
    String hinh = sanpham != null ? sanpham.getHinh() : "https://picsum.photos/560/460?404";
    String moTa = sanpham != null ? sanpham.getMoTa() : "Khong co mo ta.";
    String thuongHieu = sanpham != null ? sanpham.getThuongHieu() : "Dang cap nhat";
    String trongLuong = sanpham != null ? sanpham.getTrongLuong() : "Dang cap nhat";
    String mauSac = sanpham != null ? sanpham.getMauSac() : "Dang cap nhat";
    String hanDung = sanpham != null ? sanpham.getHanDung() : "Dang cap nhat";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiet san pham - Website ban hang online</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/trangchu.css?v=20260407"/>
    <link href="trangchu.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="banner">
        <img src="image/bannerweb.png" alt="Banner website">
    </div>

    <nav class="top-menu">
        <a href="<%= request.getContextPath() %>/trangchu">TRANG CHỦ</a>
        <a href="<%= request.getContextPath() %>/trangchu#tatca">SẢN PHẨM</a>
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
                    <a href="<%= request.getContextPath() %>/trangchu#hangmoi">Hàng mới</a>
                    <a href="<%= request.getContextPath() %>/trangchu#banchay">Bán chạy</a>
                    <a href="<%= request.getContextPath() %>/trangchu#giamgia">Giảm giá</a>
                </div>
            </div>
                <form class="home-search-form" action="<%= request.getContextPath() %>/chitietsanpham" method="get">
                        <input type="text" name="id" placeholder="Tìm kiếm..." required><br>
                    <button type="submit">Tìm kiếm</button>
                </form>
        </div>

        <div class="content">
            <div class="content-title">Chi tiết sản phẩm</div>
            <div class="detail-wrapper">
                <div class="detail-image">
                    <img src="<%= hinh %>" alt="<%= ten %>">
                </div>
                <div class="detail-info">
                    <p class="detail-code">Mã sản phẩm: <%= id %></p>
                    <h2><%= ten %></h2>
                    <p class="detail-price"><%= gia %></p>
                    <p class="detail-desc"><%= moTa %></p>

                    <ul class="detail-specs">
                        <li>Thương hiệu: <%= thuongHieu %></li>
                        <li>Trọng lượng: <%= trongLuong %></li>
                        <li>Màu sắc: <%= mauSac %></li>
                        <li>Hạn sử dụng: <%= hanDung %></li>
                    </ul>

                    <div class="detail-actions">
                        <a href="<%= request.getContextPath() %>/Giohang.jsp?action=add&id=<%= id %>" class="btn-detail">Thêm vào giỏ</a>
                        <a href="#" class="login-btn">Mua ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <button class="ai-chat-toggle" type="button" onclick="toggleAiChat()"><img src="image/chatbox.png" alt="Chatbox"></button>
    <div id="aiChatBox" class="ai-chat-box">
        <div class="ai-chat-header">AI Assistant</div>
        <div id="aiChatMessages" class="ai-chat-messages">
            <div class="ai-msg bot">Xin chao! Toi co the tu van them ve san pham nay.</div>
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
