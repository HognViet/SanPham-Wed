<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    if (id == null || id.trim().isEmpty()) {
        id = "MP001";
    }

    String ten = "Son lì mềm mịn cao cấp";
    String gia = "320,000 VND";
    String hinh = "https://picsum.photos/560/460?11";
    String moTa = "Son có chất kem mịn, lên màu chuẩn, bám tốt nhiều giờ và không gây khô môi. Thiết kế nhỏ gọn, phù hợp để mang theo hằng ngày.";
    String thuongHieu = "TSV Cosmetic";
    String trongLuong = "3.5g";
    String mauSac = "Đỏ hồng";
    String hanDung = "24 tháng";

    if ("MP002".equals(id)) {
        ten = "Kem nền che phủ";
        gia = "289,000 VND";
        hinh = "https://picsum.photos/560/460?12";
        moTa = "Kem nền mỏng nhẹ, che phủ tốt, giữ lớp trang điểm bền đẹp và tiệp da tự nhiên.";
        thuongHieu = "TSV Makeup";
        trongLuong = "30ml";
        mauSac = "Natural Beige";
        hanDung = "18 tháng";
    } else if ("MP003".equals(id)) {
        ten = "Phấn mắt 6 màu";
        gia = "199,000 VND";
        hinh = "https://picsum.photos/560/460?13";
        moTa = "Bảng màu dễ phối, chất phấn mịn, bám màu ổn định cho phong cách trang điểm hằng ngày.";
        thuongHieu = "TSV Beauty";
        trongLuong = "18g";
        mauSac = "Warm tone";
        hanDung = "24 tháng";
    } else if ("MP004".equals(id)) {
        ten = "Serum cấp ẩm";
        gia = "350,000 VND";
        hinh = "https://picsum.photos/560/460?14";
        moTa = "Serum giúp cấp ẩm sâu, làm dịu da và hỗ trợ phục hồi hàng rào bảo vệ da.";
        thuongHieu = "TSV Skin";
        trongLuong = "50ml";
        mauSac = "Trong suốt";
        hanDung = "24 tháng";
    } else if ("MP005".equals(id)) {
        ten = "Sữa rửa mặt dịu nhẹ";
        gia = "149,000 VND";
        hinh = "https://picsum.photos/560/460?21";
        moTa = "Làm sạch da nhẹ nhàng, không gây khô căng sau khi sử dụng.";
        thuongHieu = "TSV Skin";
        trongLuong = "100ml";
        mauSac = "Trắng ngà";
        hanDung = "24 tháng";
    } else if ("MP006".equals(id)) {
        ten = "Kem chống nắng SPF50+";
        gia = "259,000 VND";
        hinh = "https://picsum.photos/560/460?22";
        moTa = "Chống nắng phổ rộng, chất kem mỏng nhẹ, không bết dính.";
        thuongHieu = "TSV UV";
        trongLuong = "50ml";
        mauSac = "Trắng sữa";
        hanDung = "24 tháng";
    } else if ("MP007".equals(id)) {
        ten = "Nước hoa mini 30ml";
        gia = "420,000 VND";
        hinh = "https://picsum.photos/560/460?23";
        moTa = "Mùi hương thanh lịch, lưu hương tốt, thiết kế chai nhỏ gọn.";
        thuongHieu = "TSV Perfume";
        trongLuong = "30ml";
        mauSac = "Hồng pastel";
        hanDung = "36 tháng";
    } else if ("MP008".equals(id)) {
        ten = "Xịt khoáng dưỡng da";
        gia = "179,000 VND";
        hinh = "https://picsum.photos/560/460?24";
        moTa = "Bổ sung độ ẩm tức thì, hỗ trợ làm dịu và giữ lớp trang điểm lâu hơn.";
        thuongHieu = "TSV Skin";
        trongLuong = "150ml";
        mauSac = "Trong suốt";
        hanDung = "24 tháng";
    } else if ("MP009".equals(id)) {
        ten = "Mặt nạ cấp nước";
        gia = "89,000 VND";
        hinh = "https://picsum.photos/560/460?31";
        moTa = "Mặt nạ dưỡng ẩm nhanh, giúp da mềm mịn và tươi tắn.";
        thuongHieu = "TSV Mask";
        trongLuong = "25ml";
        mauSac = "Trắng";
        hanDung = "18 tháng";
    } else if ("MP010".equals(id)) {
        ten = "Toner hoa cúc";
        gia = "199,000 VND";
        hinh = "https://picsum.photos/560/460?32";
        moTa = "Làm dịu da, cân bằng độ pH và hỗ trợ làm sạch sâu sau rửa mặt.";
        thuongHieu = "TSV Skin";
        trongLuong = "200ml";
        mauSac = "Vàng nhạt";
        hanDung = "24 tháng";
    } else if ("MP011".equals(id)) {
        ten = "Kem dưỡng đêm";
        gia = "275,000 VND";
        hinh = "https://picsum.photos/560/460?33";
        moTa = "Dưỡng ẩm và phục hồi da ban đêm, cho làn da mềm mượt vào sáng hôm sau.";
        thuongHieu = "TSV Care";
        trongLuong = "50g";
        mauSac = "Trắng kem";
        hanDung = "24 tháng";
    } else if ("MP012".equals(id)) {
        ten = "Son dưỡng có màu";
        gia = "109,000 VND";
        hinh = "https://picsum.photos/560/460?34";
        moTa = "Son dưỡng mềm môi, có màu nhẹ, phù hợp sử dụng hằng ngày.";
        thuongHieu = "TSV Lip";
        trongLuong = "4g";
        mauSac = "Hồng đào";
        hanDung = "24 tháng";
    }
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
                    <a href="<%= request.getContextPath() %>/Trangchu.jsp#hangmoi">Hàng mới</a>
                    <a href="<%= request.getContextPath() %>/Trangchu.jsp#banchay">Bán chạy</a>
                    <a href="<%= request.getContextPath() %>/Trangchu.jsp#giamgia">Giảm giá</a>
                </div>
            </div>
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
