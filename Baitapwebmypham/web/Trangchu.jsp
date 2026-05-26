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

            <div class="banner-slider" id="bannerSlider">

                <div class="banner-slide">
                    <img src="image/bannermypham.png" alt="">
                </div>

                <div class="banner-slide">
                    <img src="image/banner2.png" alt="">
                </div>

                <div class="banner-slide">
                    <img src="image/banner3.png" alt="">
                </div>
                <div class="banner-slide">
                    <img src="image/banner4.png" alt="">
                </div>
                
            </div>

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


                <div class="flash-deals-section" id="flashDeals">
                    
                    <div class="flash-deals-header">

                        <span class="flash-title">Flash deals</span>

                        <div class="flash-timer">

                            <span id="flash-hours">02</span>
                            :
                            <span id="flash-minutes">00</span>
                            :
                            <span id="flash-seconds">00</span>

                        </div>

                    </div>
                    <div class="flash-nav">
                        <button type="button" class="flash-nav-btn flash-prev" aria-label="Lướt trái">
                            <i class="fa-solid fa-chevron-left"></i>
                        </button>
                        <button type="button" class="flash-nav-btn flash-next" aria-label="Lướt phải">
                            <i class="fa-solid fa-chevron-right"></i>
                        </button>
                    </div>
                    <div class="flash-track-wrap">
                        <div class="flash-track">
                            <%
                                int flashCount = 0;
                                if (noibatList != null) {
                                    for (Mypham sp : noibatList) {
                                        flashCount++;
                            %>
                            <a class="flash-item"
                               href="<%= request.getContextPath()%>/chitietsanpham?id=<%= sp.getId()%>">
                                <img src="<%= sp.getHinh()%>" alt="<%= sp.getTen()%>">
                                <div class="flash-info">
                                    <div class="flash-price"><%= sp.getGia()%></div>
                                    <div class="flash-name"><%= sp.getTen()%></div>
                                </div>
                            </a>
                            <%      }
                                }
                                if (flashCount == 0) { %>
                            <div class="flash-empty">Chưa có dữ liệu flash deals.</div>
                            <% }%>
                        </div>
                    </div>
                </div>

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
<i class="fa-solid fa-robot"></i>
   

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

        <script>
            (function () {
                function splitSrcParts(src) {
                    var cleanSrc = (src || "").trim();
                    var qIndex = cleanSrc.indexOf("?");
                    var hIndex = cleanSrc.indexOf("#");
                    var cutIndex = -1;
                    if (qIndex >= 0 && hIndex >= 0) {
                        cutIndex = Math.min(qIndex, hIndex);
                    } else if (qIndex >= 0) {
                        cutIndex = qIndex;
                    } else if (hIndex >= 0) {
                        cutIndex = hIndex;
                    }
                    var noSuffix = cutIndex >= 0 ? cleanSrc.substring(0, cutIndex) : cleanSrc;
                    var lastSlash = noSuffix.lastIndexOf("/");
                    var folder = lastSlash >= 0 ? noSuffix.substring(0, lastSlash + 1) : "";
                    var file = lastSlash >= 0 ? noSuffix.substring(lastSlash + 1) : noSuffix;
                    return {folder: folder, file: file};
                }

                document.querySelectorAll(".product-card").forEach(function (card) {
                    var imgEl = card.querySelector("img");
                    if (!imgEl) {
                        return;
                    }

                    var srcInfo = splitSrcParts(imgEl.getAttribute("src"));
                    var fileMatch = srcInfo.file.match(/^(sp\d+)(?:_trangchu)?\.(png|jpg|jpeg|webp)$/i);
                    if (!fileMatch) {
                        return;
                    }

                    var baseName = fileMatch[1];
                    var homeSrc = srcInfo.folder + baseName + "_trangchu.png";
                    var hoverSrc = srcInfo.folder + baseName + ".jpg";

                    imgEl.setAttribute("src", homeSrc);

                    card.addEventListener("mouseenter", function () {
                        imgEl.setAttribute("src", hoverSrc);
                    });

                    card.addEventListener("mouseleave", function () {
                        imgEl.setAttribute("src", homeSrc);
                    });
                });

                document.querySelectorAll(".flash-item img").forEach(function (imgEl) {
                    var srcInfo = splitSrcParts(imgEl.getAttribute("src"));
                    var fileMatch = srcInfo.file.match(/^(sp\d+)(?:_trangchu)?\.(png|jpg|jpeg|webp)$/i);
                    if (!fileMatch) {
                        return;
                    }

                    var baseName = fileMatch[1];
                    var homeSrc = srcInfo.folder + baseName + "_trangchu.png";
                    var hoverSrc = srcInfo.folder + baseName + ".jpg";
                    var flashItem = imgEl.closest(".flash-item");
                    if (!flashItem) {
                        return;
                    }

                    imgEl.setAttribute("src", homeSrc);

                    flashItem.addEventListener("mouseenter", function () {
                        imgEl.setAttribute("src", hoverSrc);
                    });

                    flashItem.addEventListener("mouseleave", function () {
                        imgEl.setAttribute("src", homeSrc);
                    });
                });
            })();
        </script>

        <script>
            (function () {
                var flashBox = document.getElementById("flashDeals");
                if (!flashBox) {
                    return;
                }
                var trackWrap = flashBox.querySelector(".flash-track-wrap");
                if (!trackWrap) {
                    return;
                }
                var prevBtn = flashBox.querySelector(".flash-prev");
                var nextBtn = flashBox.querySelector(".flash-next");

                var timerId = null;
var direction = 1;

/* giảm step để mượt hơn */
var step = 320;

/* tự động lướt */
setInterval(function () {

    slideOnce(direction);

    var maxScroll =
        trackWrap.scrollWidth - trackWrap.clientWidth;

    if (trackWrap.scrollLeft >= maxScroll - step) {
        direction = -1;
    }

    if (trackWrap.scrollLeft <= 0) {
        direction = 1;
    }

}, 4500);


                function slideOnce(dir) {
                    var maxScroll = trackWrap.scrollWidth - trackWrap.clientWidth;
                    if (maxScroll <= 0) {
                        return;
                    }
                    var target = dir > 0
                            ? Math.min(trackWrap.scrollLeft + step, maxScroll)
                            : Math.max(trackWrap.scrollLeft - step, 0);
                    trackWrap.scrollTo({
                        left: target,
                        behavior: "smooth"
                    });
                }

                flashBox.addEventListener("mouseenter", function () {
                    if (timerId) {
                        clearTimeout(timerId);
                    }
                    timerId = setTimeout(function () {
                        slideOnce(direction);
                        direction = direction * -1;
                    }, 5000);
                });

                flashBox.addEventListener("mouseleave", function () {
                    if (timerId) {
                        clearTimeout(timerId);
                        timerId = null;
                    }
                });

                if (prevBtn) {
                    prevBtn.addEventListener("click", function () {
                        slideOnce(-1);
                    });
                }
                if (nextBtn) {
                    nextBtn.addEventListener("click", function () {
                        slideOnce(1);
                    });
                }
            })();
            
        </script>


        <%
            String mess = (String) request.getAttribute("mess");
        %>
<script>

(function () {

    let totalSeconds = 2 * 60 * 60;

    const h = document.getElementById("flash-hours");
    const m = document.getElementById("flash-minutes");
    const s = document.getElementById("flash-seconds");

    function updateTimer() {

        let hours =
            Math.floor(totalSeconds / 3600);

        let minutes =
            Math.floor((totalSeconds % 3600) / 60);

        let seconds =
            totalSeconds % 60;

        h.innerText =
            String(hours).padStart(2, "0");

        m.innerText =
            String(minutes).padStart(2, "0");

        s.innerText =
            String(seconds).padStart(2, "0");

        if (totalSeconds > 0) {
            totalSeconds--;
        }

    }

    updateTimer();

    setInterval(updateTimer, 1000);

})();
</script>
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
        <script>

(function () {

    var slider = document.getElementById("bannerSlider");

    if (!slider) return;

    var index = 0;
    var total = slider.children.length;

    setInterval(function () {

        index++;

        if (index >= total) {
            index = 0;
        }

        slider.style.transform =
            "translateX(-" + (index * 100) + "%)";

    }, 10000);

})();

</script>

    </body>
</html>