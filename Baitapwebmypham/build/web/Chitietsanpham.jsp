<%@page import="Model.Mypham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Users"%>
<%@page import="Model.GioHangDAO"%>
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
    int id = sanpham != null ? sanpham.getId() : 0;
    String ten = sanpham != null ? sanpham.getTen() : "Khong tim thay san pham";
    float gia = sanpham != null ? sanpham.getGia() : 0;
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
            <form action="<%= request.getContextPath() %>/chitietsanpham" method="get">
                <input type="text" name="id" placeholder="Tìm sản phẩm, thương hiệu bạn mong muốn..." required>
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
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
                    <form action="<%= request.getContextPath() %>/ThemSPVaoGioHang" method="post">
                        <input type="hidden" name="mypham_id" value="<%= id %>">
                        <input type="hidden" name="price" value="<%= gia %>">
                        <button type="submit" class="btn-detail btn-action btn-add-cart">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <span>Thêm vào giỏ</span>
                        </button>
                    </form>
                    <a href="thanhtoan.jsp" class="login-btn btn-action btn-buy-now">
                        <i class="fa-solid fa-bag-shopping"></i>
                        <span>Mua ngay</span>
                    </a>
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
        (function () {
            var addCartBtn = document.querySelector(".detail-actions .btn-add-cart");
            var cartIconTop = document.querySelector(".top-menu .cart-icon");
            if (!addCartBtn || !cartIconTop) {
                return;
            }

            addCartBtn.addEventListener("click", function (event) {
                var form = addCartBtn.closest("form");
                if (!form) {
                    return;
                }
                event.preventDefault();

                var start = addCartBtn.getBoundingClientRect();
                var end = cartIconTop.getBoundingClientRect();

                var flyingIcon = document.createElement("i");
                flyingIcon.className = "fa-solid fa-cart-shopping fly-cart-icon";
                flyingIcon.style.left = (start.left + start.width / 2) + "px";
                flyingIcon.style.top = (start.top + start.height / 2) + "px";
                document.body.appendChild(flyingIcon);

                requestAnimationFrame(function () {
                    var moveX = (end.left + end.width / 2) - (start.left + start.width / 2);
                    var moveY = (end.top + end.height / 2) - (start.top + start.height / 2);
                    flyingIcon.style.transform = "translate(" + moveX + "px, " + moveY + "px) scale(0.7)";
                    flyingIcon.style.opacity = "0.2";
                });

                setTimeout(function () {
                    flyingIcon.remove();
                    form.submit();
                }, 900);
            });
        })();
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
