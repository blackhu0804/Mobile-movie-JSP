<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
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
		String movieId=request.getParameter("movieId");
		/* byte b0[]=movieId.getBytes("ISO-8859-1");
		movieId=new String(b0,"utf-8"); */
		
		String movieName=request.getParameter("movieName");
		/* byte b[]=movieName.getBytes("ISO-8859-1");
		movieName=new String(b,"utf-8"); */
		String score=request.getParameter("score");
		byte b1[]=score.getBytes("ISO-8859-1");
		score=new String(b1,"utf-8");
		String actor=request.getParameter("actor");
		/* byte b2[]=actor.getBytes("ISO-8859-1");
		actor=new String(b2,"utf-8"); */
		String director=request.getParameter("director");
		/* byte b3[]=director.getBytes("ISO-8859-1");
		director=new String(b3,"utf-8"); */
		String year=request.getParameter("year");
		byte b4[]=year.getBytes("ISO-8859-1");
		year=new String(b4,"utf-8");
		String category=request.getParameter("category");
		/* byte b5[]=category.getBytes("ISO-8859-1");
		category=new String(b5,"utf-8"); */
		String collection=request.getParameter("collection");
		byte b6[]=year.getBytes("ISO-8859-1");
		collection=new String(b6,"utf-8");
		String detail=request.getParameter("detail");
		/* byte b7[]=year.getBytes("ISO-8859-1");
		detail=new String(b7,"utf-8"); */
		
		Connection con =null;
		Statement stmt =null;	
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/movie?useUnicode=true&characterEncoding=gbk";
	 	con=DriverManager.getConnection(url,"root","root");
	 	stmt=con.createStatement();
	 	String sql="update movie_info set movieName='"+movieName+"',score='"+score+"',actor='"+actor+"',director='"+director+"',year='"+year+"',category='"+category+"',collection='"+collection+"',detail='"+detail+"' where id="+movieId;
	 	out.println(sql);
	 	stmt.executeUpdate(sql);
	 	stmt.close();
	 	con.close();
	 	response.sendRedirect("./index.jsp");
	  %>
  </body>
</html>
