<%-- 
    Document   : addComment
    Created on : 2017-12-4, 13:03:15
    Author     : Administrator
--%>

<%@page import="javafx.scene.control.Alert"%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String commentContent = request.getParameter("commentContent");
            byte b[] = commentContent.getBytes("ISO-8859-1");
            commentContent = new String(b, "UTF-8");
            String idInfo = request.getParameter("idInfo");
            String commentUser = request.getParameter("comment-user");
            String commentTime = request.getParameter("comment-time");
            if(commentUser == null){
                out.print("<script>alert('您还没有登陆！'); window.document.location.href='login.jsp';</script>");
            }
            Connection con=null;
            Statement stmt=null;
            ResultSet rs=null;
            
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/movie?useUnicode=true&characterEncoding=gbk";
            con=DriverManager.getConnection(url,"root","root");
            stmt=con.createStatement();
            String sql = "insert into comment (comment, movieId, username, commentTime) values ('"+commentContent+" ' , ' "+ idInfo +" ' , ' "+ commentUser +" ' , ' "+ commentTime+" ')";
            stmt.executeUpdate(sql);
            stmt.close();
            con.close();
            response.sendRedirect("detail.jsp?id=" + idInfo);
        %>
    </body>
</html>
