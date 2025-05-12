package com.Hnfnu.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.Hnfnu.dao.UserDao;


import java.io.IOException;


@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        int userId = Integer.parseInt(request.getParameter("id"));
        UserDao userDao = new UserDao();

        boolean success = userDao.deleteUser(userId);

        response.sendRedirect("manageUsers.jsp");

//        response.sendRedirect("manageUsers.jsp?msg=用户删除成功");
//        if (success) {
//            response.sendRedirect("manageUsers.jsp?msg=用户删除成功");
//        } else {
//            response.sendRedirect("manageUsers.jsp?msg=删除失败");
//        }

    }

}
