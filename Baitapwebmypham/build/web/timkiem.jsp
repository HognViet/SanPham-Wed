<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tim kiem san pham</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #fff6fa;
        }
        .wrapper {
            width: 900px;
            margin: 30px auto;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
            padding: 24px;
        }
        h2 {
            margin-top: 0;
            color: #c2185b;
        }
        .search-form {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .search-form input {
            flex: 1;
            padding: 10px 12px;
            border: 1px solid #d9d9d9;
            border-radius: 6px;
        }
        .search-form button {
            border: none;
            background: #e91e63;
            color: #fff;
            padding: 10px 16px;
            border-radius: 6px;
            cursor: pointer;
        }
        .search-form button:hover {
            background: #d81b60;
        }
        .result-box {
            background: #fff0f6;
            border: 1px solid #ffd5e6;
            padding: 12px;
            border-radius: 6px;
            color: #333;
        }
        .back-link {
            display: inline-block;
            margin-top: 16px;
            color: #c2185b;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <h2>Tìm kiếm sản phẩm</h2>
        <form class="search-form" method="get" action="timkiem.jsp">
            <input type="text" name="keyword" placeholder="Nhap ten san pham can tim..." value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
            <button type="submit">Tim kiem</button>
        </form>

        <div class="result-box">
            <%
                String keyword = request.getParameter("keyword");
                if (keyword != null && !keyword.trim().isEmpty()) {
            %>
                Ban da tim voi tu khoa: <strong><%= keyword %></strong>.<br>
                Chuc nang loc ket qua co the bo sung o buoc tiep theo.
            <%
                } else {
            %>
                Vui long nhap tu khoa de tim kiem san pham.
            <%
                }
            %>
        </div>

        <a class="back-link" href="<%= request.getContextPath() %>/Trangchu.jsp">Quay ve trang chu</a>
    </div>
</body>
</html>
