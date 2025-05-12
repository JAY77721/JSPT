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
</head>
<body>
<h2>欢迎你，<%= user.getUsername() %>！</h2>
<p>邮箱地址：<%= user.getEmail() != null ? user.getEmail() : "未填写" %></p>
<p>前往管理用户-><a href="manageUsers.jsp">管理用户</a></p>
<!-- 退出登录表单 -->
<form action="logout" method="post">
    <input type="submit" value="退出登录">
</form>

</body>
</html>
