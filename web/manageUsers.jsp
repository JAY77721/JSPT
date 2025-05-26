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
    body {
      font-family: "Segoe UI", "Microsoft YaHei", sans-serif;
      background: linear-gradient(to right, #74ebd5, #9face6);
      margin: 0;
      padding: 40px;
    }

    .container {
      max-width: 900px;
      margin: auto;
      background-color: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 5px 25px rgba(0,0,0,0.15);
    }

    h2, h3 {
      text-align: center;
      color: #333;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      padding: 12px;
      border: 1px solid #ddd;
      text-align: center;
    }

    th {
      background-color: #f4f4f4;
      font-weight: bold;
    }

    .btn {
      padding: 6px 12px;
      font-size: 14px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin: 0 2px;
    }

    .delete-btn {
      background-color: #e74c3c;
      color: white;
    }

    .edit-btn {
      background-color: #3498db;
      color: white;
    }

    .add-btn {
      background-color: #2ecc71;
      color: white;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
      width: 100%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    button, input[type="submit"] {
      padding: 8px 16px;
      margin-top: 10px;
      border-radius: 4px;
      border: none;
      background-color: #4CAF50;
      color: white;
      cursor: pointer;
    }

    button:hover, input[type="submit"]:hover {
      background-color: #45a049;
    }

    .delete-row-btn {
      background-color: #e67e22;
      color: white;
      border: none;
      padding: 6px 10px;
      border-radius: 4px;
    }

    .delete-row-btn:hover {
      background-color: #d35400;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>用户管理</h2>

  <!-- 用户信息表格（可删除 + 修改） -->
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
        <form action="editUser.jsp" method="get" style="display:inline;">
          <input type="hidden" name="id" value="<%= user.getId() %>">
          <input type="submit" value="修改" class="btn edit-btn">
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
        <td><button type="button" class="delete-row-btn" onclick="deleteRow(this)">删除</button></td>
      </tr>
      </tbody>
    </table>
    <button type="button" onclick="addRow()">添加行</button>
    <input type="submit" value="添加用户" class="add-btn">
  </form>
</div>

<script>
  function addRow() {
    const tbody = document.getElementById("addTable").getElementsByTagName("tbody")[0];
    const row = tbody.insertRow();
    row.innerHTML = `
      <td><input type="text" name="username[]" required></td>
      <td><input type="password" name="password[]" required></td>
      <td><input type="email" name="email[]" required></td>
      <td><button type="button" class="delete-row-btn" onclick="deleteRow(this)">删除</button></td>
    `;
  }

  function deleteRow(btn) {
    const row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
  }
</script>

</body>
</html>
