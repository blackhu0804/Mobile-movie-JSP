<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String username=new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
	String email=new String(request.getParameter("email").getBytes("iso-8859-1"),"utf-8");
	String password=new String(request.getParameter("password").getBytes("iso-8859-1"),"utf-8");
	Connection con =null;
	Statement stmt =null;
	
	String userIN="该用户名已存在";
	String emailIN="该邮箱已注册";
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/movie?useUnicode=true&characterEncoding=gbk";
	con=DriverManager.getConnection(url,"root","root");
	//stmt=con.createStatement();
	String sql="select * from user where username='"+username+"'";
        stmt=con.prepareStatement(sql);
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next()){
            out.print("<script>alert('"+userIN+"'); window.document.location.href='signUp.jsp';</script>");
	}else{
            sql="select * from user where email='"+email+"'";
            stmt=con.prepareStatement(sql);
            rs=stmt.executeQuery(sql);
            if(rs.next()){
                    out.print("<script>alert('"+emailIN+"');window.document.location.href='signUp.jsp';</script>");

            }else{
                sql="insert into user (username,email,password) values ('"+username+"','"+email+"','"+password+"')";
                stmt=con.prepareStatement(sql);
                out.println(sql);
                stmt.executeUpdate(sql);
                sql="select id from user where username='"+username+"'";
                stmt=con.prepareStatement(sql);
                rs=stmt.executeQuery(sql);
                rs.next();
                session.setAttribute("id", rs.getString("id"));
                response.sendRedirect("index.jsp");
                    
            }
	}
	stmt.close();
 	con.close();
%>

</body>
</html>