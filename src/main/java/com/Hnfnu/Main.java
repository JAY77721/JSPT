package com.Hnfnu;

import java.sql.Connection;  // DBC库中的一个接口，表示与数据库的连接。它提供了方法来执行SQL语句、管理事务等操作。
import java.sql.DriverManager;//是JDBC库中的一个类，提供了一些静态方法来管理数据库驱动程序和连接。其中，getConnection()方法用于建立与数据库的连接

public class Main {
    public static void main(String[] args) {
        //不用动，默认就是这么写的
        String driverName = "com.mysql.cj.jdbc.Driver";
        //本地连接
        String dbURL = "jdbc:mysql://localhost:3306/mysql?&useSSL=false&serverTimezone=Asia/Shanghai"; //mysql为数据库名

        String userName = "root";
        //自己数据库的密码
        String userPwd = "123456";

        try {
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL, userName, userPwd);
            System.out.println("连接数据库成功");

        } catch (Exception e) {
            e.printStackTrace();

            System.out.print("连接失败");
        }
    }
}

