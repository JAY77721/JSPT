<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
</head>
<body>
<h2>注册新用户</h2>
<form action="register" method="post">
    用户名: <input type="text" name="username" required><br><br>
    密码: <input type="password" name="password" required><br><br>
    邮箱: <input type="email" name="email"><br><br>
    <input type="submit" value="注册">
</form>
<p>已有账号？<a href="login.jsp">返回登录</a></p>
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
