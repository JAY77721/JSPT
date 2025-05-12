<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.Hnfnu.model.User" %>
<%
    User user = (User) session.getAttribute("user");
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

<form action="logout" method="post">
    <input type="submit" value="退出登录">
</form>
</body>
</html>
