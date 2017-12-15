<%-- 
    Document   : addMovieToSql
    Created on : 2017-12-5, 19:34:33
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String img=request.getParameter("img");
            out.println(img);
        %>
    </body>
</html>
