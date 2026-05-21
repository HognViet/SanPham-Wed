<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="Model.Users"%>
<%@page import="Model.GioHangDAO"%>
<%
    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
    Double total = (Double) request.getAttribute("total");
    if (total == null) total = 0.0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gio hang - Website ban hang online</title>
    <link href="<%= request.getContextPath() %>/trangchu.css?v=<%= System.currentTimeMillis() %>" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .qty-actions {
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .qty-btn {
            width: 28px;
            height: 28px;
            border: 1px solid #f0a8c6;
            border-radius: 7px;
            background: #fff3f8;
            color: #d63b77;
            font-weight: 700;
            cursor: pointer;
            line-height: 1;
        }
        .qty-btn:hover {
            background: #ffe3ef;
        }
        .qty-value {
            min-width: 20px;
            text-align: center;
            font-weight: 700;
        }
    </style>
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
                    <a href="Trangchu.jsp#noibat">Sản phẩm nổi bật </a>
                    <a href="Trangchu.jsp#hangmoi">Hàng mới </a>
                    <a href="Trangchu.jsp#banchay">Bán chạy </a>
                    <a href="Trangchu.jsp#giamgia">Giảm giá </a>
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
                        <% if (cartItems == null || cartItems.isEmpty()) { %>
                            <tr><td colspan="5">Giỏ hàng đang trống!</td></tr>
                            <% } else { for (CartItem item : cartItems) { %>
                                <tr>
                                    <td><img src="<%= item.hinh %>" style="width:50px"> <%= item.ten %></td>
                                    <td><%= String.format("%,.0f", item.price) %> VND</td>
                                    <td class="item-qty"><%= item.quantity %></td>
                                    <td class="item-total" data-unit-price="<%= item.price %>"><%= String.format("%,.0f", item.price * item.quantity) %> VND</td>
                                    <td>
                                        <div class="qty-actions">
                                            <button type="button" class="qty-btn qty-minus" aria-label="Giảm số lượng">-</button>
                                            <span class="qty-value"><%= item.quantity %></span>
                                            <button type="button" class="qty-btn qty-plus" aria-label="Tăng số lượng">+</button>
                                        </div>
                                        <a class="cart-remove" href="<%= request.getContextPath() %>/XoaKhoiGio?cart_item_id=<%= item.cart_item_id %>">Xóa</a>
                                    </td>
                                </tr>
                            <% }} %>
                </table>

                <div class="cart-summary">
                <p>Tổng cộng: <strong id="cart-grand-total"><%= String.format("%,.0f", total) %> VND</strong></p>
                <div class="cart-actions">
                        <a href="Trangchu.jsp" class="btn-detail">Tiếp tục mua hàng</a>
                        <a href="<%= request.getContextPath() %>/thanhtoan.jsp" class="login-btn cart-checkout">Thanh toán</a>
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
        Nguyen Thi Phuong Thao - 25/11/2005 | Ngo Van Son - |Ninh Hong Viet - 09/11/2005
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
            function formatVnd(value) {
                return Number(value).toLocaleString("vi-VN") + " VND";
            }

            function refreshGrandTotal() {
                var sum = 0;
                document.querySelectorAll(".item-total").forEach(function (el) {
                    var text = (el.textContent || "").replace(/[^\d]/g, "");
                    sum += Number(text || 0);
                });
                var totalEl = document.getElementById("cart-grand-total");
                if (totalEl) {
                    totalEl.textContent = formatVnd(sum);
                }
            }

            document.querySelectorAll(".cart-table tbody tr, .cart-table tr").forEach(function (row) {
                var qtyCell = row.querySelector(".item-qty");
                var totalCell = row.querySelector(".item-total");
                var qtyView = row.querySelector(".qty-value");
                var minusBtn = row.querySelector(".qty-minus");
                var plusBtn = row.querySelector(".qty-plus");

                if (!qtyCell || !totalCell || !qtyView || !minusBtn || !plusBtn) {
                    return;
                }

                var unitPrice = Number(totalCell.getAttribute("data-unit-price") || 0);
                var qty = Number(qtyView.textContent || 1);

                function render() {
                    qtyCell.textContent = qty;
                    qtyView.textContent = qty;
                    totalCell.textContent = formatVnd(unitPrice * qty);
                    refreshGrandTotal();
                }

                plusBtn.addEventListener("click", function () {
                    qty += 1;
                    render();
                });

                minusBtn.addEventListener("click", function () {
                    if (qty > 1) {
                        qty -= 1;
                        render();
                    }
                });
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
