<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.Hnfnu.model.User" %>
<%
    // 获取 session 中的用户信息
    User user = (User) session.getAttribute("user");

    // 如果没有用户信息，跳转到登录页面并传递提示信息
    if (user == null) {
        response.sendRedirect("login.jsp?msg=请先登录");
        return;
    }
%>

<html>
<head>
    <title>欢迎页面</title>
    <style>
        body {
            font-family: "Microsoft YaHei", sans-serif;
            background: linear-gradient(to right, #43cea2, #185a9d);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .welcome-container {
            background-color: white;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            margin: 12px 0;
            color: #555;
        }

        a {
            color: #185a9d;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        input[type="submit"] {
            margin-top: 20px;
            background-color: #ff4b5c;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #e04352;
        }
    </style>
</head>
<body>
<div class="welcome-container">
    <h2>欢迎你，<%= user.getUsername() %>！</h2>
    <p>邮箱地址：<%= user.getEmail() != null ? user.getEmail() : "未填写" %></p>
    <p><a href="manageUsers.jsp">前往管理用户</a></p>

    <!-- 退出登录表单 -->
    <form action="logout" method="post">
        <input type="submit" value="退出登录">
    </form>
</div>
</body>
</html>
