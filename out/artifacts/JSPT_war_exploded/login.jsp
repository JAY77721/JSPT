<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
</head>
<body>
<h2>用户登录</h2>
<form action="login" method="post">
    用户名: <input type="text" name="username" required><br><br>
    密码: <input type="password" name="password" required><br><br>
    <input type="submit" value="登录">
</form>
<p>没有账号？<a href="register.jsp">注册新用户</a></p>
<%
    String msg = request.getParameter("msg");
    if (msg != null) {
%>
<p style="color:red;"><%= msg %></p>
<%
    }
%>
</body>
</html>
