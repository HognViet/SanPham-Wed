<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%
    Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
    if (cart == null) {
        cart = new LinkedHashMap<String, Integer>();
        session.setAttribute("cart", cart);
    }

    String action = request.getParameter("action");
    String id = request.getParameter("id");

    if ("add".equals(action) && id != null && !id.trim().isEmpty()) {
        Integer qty = cart.get(id);
        cart.put(id, qty == null ? 1 : qty + 1);
        response.sendRedirect(request.getContextPath() + "/Giohang.jsp");
        return;
    }

    if ("remove".equals(action) && id != null && !id.trim().isEmpty()) {
        cart.remove(id);
        response.sendRedirect(request.getContextPath() + "/Giohang.jsp");
        return;
    }
%>
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
        <a href="Trangchu.jsp#noibat">SẢN PHẨM</a>
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
                    <a href="Trangchu.jsp#noibat">Sản phẩm nổi bật (3)</a>
                    <a href="Trangchu.jsp#hangmoi">Hàng mới (3)</a>
                    <a href="Trangchu.jsp#banchay">Bán chạy (3)</a>
                    <a href="Trangchu.jsp#giamgia">Giảm giá (3)</a>
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
                    <tbody>
                        <%
                            int tong = 0;
                            if (cart.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="5">Giỏ hàng đang trống. Hãy thêm sản phẩm từ trang chi tiết.</td>
                        </tr>
                        <%
                            } else {
                                for (Map.Entry<String, Integer> item : cart.entrySet()) {
                                    String maSp = item.getKey();
                                    int soLuong = item.getValue();
                                    String tenSp = maSp;
                                    int donGia = 0;

                                    if ("MP001".equals(maSp)) {
                                        tenSp = "Son lì mềm mịn cao cấp";
                                        donGia = 320000;
                                    } else if ("MP002".equals(maSp)) {
                                        tenSp = "Kem nền che phủ";
                                        donGia = 289000;
                                    } else if ("MP003".equals(maSp)) {
                                        tenSp = "Phấn mắt 6 màu";
                                        donGia = 199000;
                                    } else if ("MP004".equals(maSp)) {
                                        tenSp = "Serum cấp ẩm";
                                        donGia = 350000;
                                    } else if ("MP005".equals(maSp)) {
                                        tenSp = "Sữa rửa mặt dịu nhẹ";
                                        donGia = 149000;
                                    } else if ("MP006".equals(maSp)) {
                                        tenSp = "Kem chống nắng SPF50+";
                                        donGia = 259000;
                                    } else if ("MP007".equals(maSp)) {
                                        tenSp = "Nước hoa mini 30ml";
                                        donGia = 420000;
                                    } else if ("MP008".equals(maSp)) {
                                        tenSp = "Xịt khoáng dưỡng da";
                                        donGia = 179000;
                                    } else if ("MP009".equals(maSp)) {
                                        tenSp = "Mặt nạ cấp nước";
                                        donGia = 89000;
                                    } else if ("MP010".equals(maSp)) {
                                        tenSp = "Toner hoa cúc";
                                        donGia = 199000;
                                    } else if ("MP011".equals(maSp)) {
                                        tenSp = "Kem dưỡng đêm";
                                        donGia = 275000;
                                    } else if ("MP012".equals(maSp)) {
                                        tenSp = "Son dưỡng có màu";
                                        donGia = 109000;
                                    }

                                    int thanhTien = donGia * soLuong;
                                    tong += thanhTien;
                        %>
                        <tr>
                            <td><%= tenSp %> (<%= maSp %>)</td>
                            <td><%= String.format("%,d", donGia) %> VND</td>
                            <td><%= soLuong %></td>
                            <td><%= String.format("%,d", thanhTien) %> VND</td>
                            <td><a class="cart-remove" href="<%= request.getContextPath() %>/Giohang.jsp?action=remove&id=<%= maSp %>">Xóa</a></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>

                <div class="cart-summary">
                    <p>Tổng cộng: <strong><%= String.format("%,d", tong) %> VND</strong></p>
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
