<%-- 
    Document   : deleteComment
    Created on : 2017-12-5, 19:21:53
    Author     : Administrator
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String commentId=request.getParameter("commentId");
            byte b1[]=commentId.getBytes("ISO-8859-1");
            commentId = new String(b1,"utf-8");

            Connection con =null;
            Statement stmt =null;
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/movie?useUnicode=true&characterEncoding=gbk";
            con=DriverManager.getConnection(url,"root","root");
            stmt=con.createStatement();
            String sql="delete from comment where id="+ commentId;

            stmt.executeUpdate(sql);
            stmt.close();
            con.close();
            response.sendRedirect("./comment.jsp"); 

        %>
    </body>
</html>