
---

# JSP 用户管理系统

这个项目是一个基于 Java Servlet 和 JSP 的用户管理系统，实现了用户的增、删功能。用户可以在管理页面查看、删除用户信息，并通过表单添加新用户。

## 项目功能

* **用户登录**：支持用户通过用户名和密码登录。
* **用户管理**：管理员可以查看所有用户的信息，并删除用户。
* **用户添加**：管理员可以通过表单添加新用户。

## 项目结构

```
.
├── src
│   ├── com
│   │   ├── Hnfnu
│   │   │   ├── dao
│   │   │   │   └── UserDao.java        # 数据库操作类
│   │   │   ├── model
│   │   │   │   └── User.java            # 用户模型类
│   │   │   └── servlet
│   │   │       └── DeleteUserServlet.java # 处理删除用户请求的 Servlet
│   │   │       └── AddUserServlet.java    # 处理添加用户请求的 Servlet
│   │   │       └── LoginServlet.java      # 处理登录用户请求的 Servlet
│   │   │       └── RegisterServlet.java   # 处理注册用户请求的 Servlet
│   └── web
│       └── WEB-INF
│           └── web.xml                   # 配置文件
│       └── manageUsers.jsp               # 用户管理页面
│       └── login.jsp                     # 登录页面
└── lib
    └── ... 
```

## 技术栈

* **Java Servlet**：用于处理前后端的交互。
* **JSP**：JavaServer Pages，用于渲染动态网页。
* **MySQL**：用于存储用户数据。
* **JDBC**：通过 JDBC 实现数据库的连接和操作。

## 环境要求

* **Java 17 版本**
* **Apache Tomcat 11** 
* **MySQL 5.7 或以上版本**

## 安装与配置

### 1. 克隆仓库

```bash
git clone https://github.com/JAY77721/JSPT.git
```

### 2. 配置数据库

* 创建数据库 `Users`。
* 导入 `sql` 文件，创建 `users` 表。

```sql
CREATE DATABASE Users;

USE Users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);
```

### 3. 配置数据库连接

在 `DBUtil.java` 文件中，配置数据库的连接信息（数据库 URL、用户名、密码等）。

### 4. 部署到 Tomcat

将项目部署到 Tomcat 服务器，启动 Tomcat。

### 5. 访问应用

在浏览器中访问：

* 登录页面：`http://localhost:8080/JSPT/login.jsp`
* 用户管理页面：`http://localhost:8080/JSPT/manageUsers.jsp`

## 使用方法

### 登录

1. 使用管理员账号登录。
2. 登录后，你将被重定向到用户管理页面。

### 用户管理

在 `manageUsers.jsp` 页面，你可以：

* **查看用户列表**：显示所有用户的用户名、邮箱等信息。
* **删除用户**：点击删除按钮，删除指定用户。
* **添加新用户**：填写用户名、密码和邮箱，点击添加按钮添加新用户。

## 常见问题

1. **无法登录**：请检查用户名和密码是否正确。如果忘记密码，请联系管理员。
2. **无法删除用户**：确保该用户存在，并且你有足够的权限。
3. **数据库连接失败**：检查 `DBUtil` 中的数据库连接配置，确保数据库服务器正常运行。

## 许可

该项目采用 MIT 许可证，详情见 [LICENSE](LICENSE)。

---

