<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<% response.setContentType("text/html");%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'uploadMovieToSql.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
	  <%
		
		String movieName=request.getParameter("movieName");
		
		String score=request.getParameter("score");
		
		String actor=request.getParameter("actor");
		
		String director=request.getParameter("director");
		
		String year=request.getParameter("year");
		
		String category=request.getParameter("category");
		
		String collection=request.getParameter("collection");
		
		String detail=request.getParameter("detail");
		
		Connection con =null;
		Statement stmt =null;	
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/movie?useUnicode=true&characterEncoding=gbk";
	 	con=DriverManager.getConnection(url,"root","root");
	 	stmt=con.createStatement();
	 	String sql="insert into movie_info (movieName,score,director,year,category,collection,detail) values ('"+movieName+"',"+score+",'"+director+"',"+year+",'"+category+"',"+collection+",'"+detail+"')";
	 	out.println(sql);
	 	stmt.executeUpdate(sql);
	 	stmt.close();
	 	con.close();
	 	response.sendRedirect("./index.jsp");
	  %>
  </body>
</html>
