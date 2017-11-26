<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Check_LOGING</title>
</head>
<body>
<% 
	String username=new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
	String password=new String(request.getParameter("password").getBytes("iso-8859-1"),"utf-8");
	Connection con =null;
	Statement stmt =null;
	
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/movie?useUnicode=true&characterEncoding=gbk";
	con=DriverManager.getConnection(url,"root","root");
	//stmt=con.createStatement();
	String sql="select * from user where username='"+username+"'and password='"+password+"'";
	
    stmt=con.prepareStatement(sql);
	

	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next()){
                System.out.println("登录成功！"); 
		session.setAttribute("username", username); 
		response.sendRedirect("index.jsp");
	}else{
		out.print("<script>alert('密码输入错误！'); window.document.location.href='login.jsp';</script>");
	}
	stmt.close();
 	con.close();
%>

</body>
</html>