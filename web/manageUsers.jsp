<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.Hnfnu.model.User" %>
<%@ page import="com.Hnfnu.dao.UserDao" %>
<%@ page import="java.util.List" %>

<%
  UserDao userDao = new UserDao();
  List<User> users = userDao.getAllUsers();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>用户管理</title>
  <style>
    table { width: 100%; border-collapse: collapse; }
    th, td { padding: 8px; border: 1px solid #ccc; text-align: center; }
    .btn { padding: 6px 12px; margin: 4px; cursor: pointer; }
    .delete-btn { background-color: red; color: white; border: none; }
  </style>
</head>
<body>
<h2>用户管理</h2>

<!-- 用户信息表格（只读 + 删除） -->
<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>用户名</th>
    <th>邮箱</th>
    <th>操作</th>
  </tr>
  </thead>
  <tbody>
  <% for (User user : users) { %>
  <tr>
    <td><%= user.getId() %></td>
    <td><%= user.getUsername() %></td>
    <td><%= user.getEmail() %></td>
    <td>
      <form action="deleteUser" method="post" style="display:inline;">
        <input type="hidden" name="id" value="<%= user.getId() %>">
        <input type="submit" value="删除" class="btn delete-btn" onclick="return confirm('确定要删除该用户吗？');">
      </form>
    </td>
  </tr>
  <% } %>
  </tbody>
</table>

<!-- 添加用户 -->
<h3>添加用户</h3>
<form action="addUser" method="post">
  <table id="addTable">
    <thead>
    <tr>
      <th>用户名</th>
      <th>密码</th>
      <th>邮箱</th>
      <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><input type="text" name="username[]" required></td>
      <td><input type="password" name="password[]" required></td>
      <td><input type="email" name="email[]" required></td>
      <td><button type="button" onclick="deleteRow(this)">删除</button></td>
    </tr>
    </tbody>
  </table>
  <button type="button" onclick="addRow()">添加行</button>
  <input type="submit" value="添加用户">
</form>

<script>
  function addRow() {
    var tbody = document.getElementById("addTable").getElementsByTagName("tbody")[0];
    var row = tbody.insertRow();
    row.innerHTML = `
            <td><input type="text" name="username[]" required></td>
            <td><input type="password" name="password[]" required></td>
            <td><input type="email" name="email[]" required></td>
            <td><button type="button" onclick="deleteRow(this)">删除</button></td>
        `;
  }

  function deleteRow(btn) {
    var row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
  }
</script>

</body>
</html>
