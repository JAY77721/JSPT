package com.Hnfnu.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.Hnfnu.dao.UserDao;
import com.Hnfnu.model.User;

import java.io.IOException;


@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String[] usernames = request.getParameterValues("username[]");
        String[] passwords = request.getParameterValues("password[]");
        String[] emails = request.getParameterValues("email[]");

        UserDao userDao = new UserDao();
        for (int i = 0; i < usernames.length; i++) {
            User user = new User();
            user.setUsername(usernames[i]);
            user.setPassword(passwords[i]);
            user.setEmail(emails[i]);
            userDao.addUser(user);
        }
        response.sendRedirect("manageUsers.jsp");
    }
}
