<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.Hnfnu.model.User" %>
<%@ page import="com.Hnfnu.dao.UserDao" %>

<%
    int userId = Integer.parseInt(request.getParameter("id"));
    UserDao userDao = new UserDao();
    User user = userDao.getUserById(userId);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑用户</title>
    <style>
        body {
            font-family: "Microsoft YaHei", sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        form p {
            margin-bottom: 16px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .cancel-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #555;
            text-decoration: none;
            font-size: 14px;
        }

        .cancel-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>编辑用户</h2>
    <form action="updateUser" method="post">
        <input type="hidden" name="id" value="<%= user.getId() %>">
        <p>用户名: <input type="text" name="username" value="<%= user.getUsername() %>" required></p>
        <p>密码: <input type="password" name="password" value="<%= user.getPassword() %>" required></p>
        <p>邮箱: <input type="email" name="email" value="<%= user.getEmail() %>" required></p>
        <input type="submit" value="保存修改">
    </form>
    <a class="cancel-link" href="manageUsers.jsp">取消并返回</a>
</div>
</body>
</html>
