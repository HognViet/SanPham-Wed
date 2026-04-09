<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chu - Website ban hang online</title>
    
    <link href="trangchu.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="banner">
        
        <img src="image/bannerweb.png" alt=""/>
    </div>

    <nav class="top-menu">
        <a href="<%= request.getContextPath() %>/Trangchu.jsp">TRANG CHỦ</a>
        <a href="#tatca">SẢN PHẨM</a>
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
                    <a href="#tatca">Tất cả (12)</a>
                    <a href="#hangmoi">Hàng mới (4)</a>
                    <a href="#banchay">Bán chạy (4)</a>
                    <a href="#giamgia">Giảm giá (4)</a>
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
            <div id="tatca" class="content-title">Sản phẩm nổi bật</div>
            <div class="grid">
                <div id="hangmoi" class="card">
                    <img src="https://picsum.photos/300/220?11" alt="Son li mem min">
                    <div class="card-body">
                        <div class="code">Ma SP: MP001</div>
                        <div class="name">Son li mem min</div>
                        <div class="price">320,000 VND</div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/Chitietsanpham.jsp?id=MP001">Xem chi tiet</a>
                    </div>
                </div>
                <div class="card">
                    <img src="https://picsum.photos/300/220?12" alt="Kem nen che phu">
                    <div class="card-body">
                        <div class="code">Ma SP: MP002</div>
                        <div class="name">Kem nen che phu</div>
                        <div class="price">289,000 VND</div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/Chitietsanpham.jsp?id=MP002">Xem chi tiet</a>
                    </div>
                </div>
                <div class="card">
                    <img src="https://picsum.photos/300/220?13" alt="Phan mat 6 mau">
                    <div class="card-body">
                        <div class="code">Ma SP: MP003</div>
                        <div class="name">Phan mat 6 mau</div>
                        <div class="price">199,000 VND</div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/Chitietsanpham.jsp?id=MP003">Xem chi tiet</a>
                    </div>
                </div>
                <div class="card">
                    <img src="https://picsum.photos/300/220?14" alt="Serum cap am">
                    <div class="card-body">
                        <div class="code">Ma SP: MP004</div>
                        <div class="name">Serum cap am</div>
                        <div class="price">350,000 VND</div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/Chitietsanpham.jsp?id=MP004">Xem chi tiet</a>
                    </div>
                </div>

                <div id="banchay" class="card">
                    <img src="https://picsum.photos/300/220?21" alt="Sua rua mat diu nhe">
                    <div class="card-body">
                        <div class="code">Ma SP: MP005</div>
                        <div class="name">Sua rua mat diu nhe</div>
                        <div class="price">149,000 VND</div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/Chitietsanpham.jsp?id=MP005">Xem chi tiet</a>
                    </div>
                </div>
                <div class="card">
                    <img src="https://picsum.photos/300/220?22" alt="Kem chong nang SPF50">
                    <div class="card-body">
                        <div class="code">Ma SP: MP006</div>
                        <div class="name">Kem chong nang SPF50+</div>
                        <div class="price">259,000 VND</div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/Chitietsanpham.jsp?id=MP006">Xem chi tiet</a>
                    </div>
                </div>
                <div class="card">
                    <img src="https://picsum.photos/300/220?23" alt="Nuoc hoa mini">
                    <div class="card-body">
                        <div class="code">Ma SP: MP007</div>
                        <div class="name">Nuoc hoa mini 30ml</div>
                        <div class="price">420,000 VND</div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/Chitietsanpham.jsp?id=MP007">Xem chi tiet</a>
                    </div>
                </div>
                <div class="card">
                    <img src="https://picsum.photos/300/220?24" alt="Xit khoang duong da">
                    <div class="card-body">
                        <div class="code">Ma SP: MP008</div>
                        <div class="name">Xit khoang duong da</div>
                        <div class="price">179,000 VND</div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/Chitietsanpham.jsp?id=MP008">Xem chi tiet</a>
                    </div>
                </div>

                <div id="giamgia" class="card">
                    <img src="https://picsum.photos/300/220?31" alt="Mat na cap nuoc">
                    <div class="card-body">
                        <div class="code">Ma SP: MP009</div>
                        <div class="name">Mat na cap nuoc</div>
                        <div class="price">89,000 VND</div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/Chitietsanpham.jsp?id=MP009">Xem chi tiet</a>
                    </div>
                </div>
                <div class="card">
                    <img src="https://picsum.photos/300/220?32" alt="Tonner hoa cuc">
                    <div class="card-body">
                        <div class="code">Ma SP: MP010</div>
                        <div class="name">Toner hoa cuc</div>
                        <div class="price">199,000 VND</div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/Chitietsanpham.jsp?id=MP010">Xem chi tiet</a>
                    </div>
                </div>
                <div class="card">
                    <img src="https://picsum.photos/300/220?33" alt="Kem duong dem">
                    <div class="card-body">
                        <div class="code">Ma SP: MP011</div>
                        <div class="name">Kem duong dem</div>
                        <div class="price">275,000 VND</div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/Chitietsanpham.jsp?id=MP011">Xem chi tiet</a>
                    </div>
                </div>
                <div class="card">
                    <img src="https://picsum.photos/300/220?34" alt="Son duong co mau">
                    <div class="card-body">
                        <div class="code">Ma SP: MP012</div>
                        <div class="name">Son duong co mau</div>
                        <div class="price">109,000 VND</div>
                        <a class="btn-detail" href="<%= request.getContextPath() %>/Chitietsanpham.jsp?id=MP012">Xem chi tiet</a>
                    </div>
                </div>
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
</body>
</html>