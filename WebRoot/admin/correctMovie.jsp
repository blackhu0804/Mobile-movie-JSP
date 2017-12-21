<%-- 
    Document   : correctMovie
    Created on : 2017-12-5, 20:31:52
    Author     : Administrator
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="这是一个 index 页面">
	<meta name="keywords" content="index">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="assets/css/amazeui.min.css" />
        <link rel="stylesheet" href="assets/css/admin.css" />
	<link rel="stylesheet" href="assets/css/app.css">
	<script src="assets/js/jquery.min.js"></script>
        <title>影评后台管理系统</title>
    </head>
    <body>
        <%
            String username = (String)session.getAttribute("username");
            if (username == null) {
               out.print("<script>alert('您还没有登陆！'); window.document.location.href='login.jsp';</script>");
            }
        %>
        <script src="assets/js/theme.js"></script>
	<div class="am-g tpl-g">
            <div class="tpl-skiner">
                <div class="tpl-skiner-toggle am-icon-cog">
                </div>
                <div class="tpl-skiner-content">
                    <div class="tpl-skiner-content-title">
                        选择主题
                    </div>
                    <div class="tpl-skiner-content-bar">
                        <span class="skiner-color skiner-white" data-color="theme-white"></span>
                        <span class="skiner-color skiner-black" data-color="theme-black"></span>
                    </div>
                </div>
            </div>
            <!-- 头部 -->
            <header>
                <!-- logo -->
                <div class="am-fl tpl-header-logo">
                    <h1 style="color: #fff;margin-top: 8px;">移动端影评后台管理</h1>
                </div>
                <!-- 右侧内容 -->
                <div class="tpl-header-fluid">
                    <div class="am-fl tpl-header-navbar" style="height:56px;">
                        <a style="display: inline;padding: .5em 1em;" href="./addMovie.jsp" type="submit" class="am-btn am-btn-success am-radius">添加</a>
                    </div>
                    <!-- 其它功能-->
                    <div class="am-fr tpl-header-navbar">
                        <ul>
                            <!-- 欢迎语 -->
                            <li class="am-text-sm tpl-header-navbar-welcome">
                                <a href="javascript:;">欢迎你,
                                    <span>${username}</span>
                                </a>
                            </li>
                            <!-- 退出 -->
                            <li class="am-text-sm">
                                <a type="submit" href="./logout.jsp">
                                    <span class="am-icon-sign-out"></span> 退出
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

            </header>
            <!-- 侧边导航栏 -->
            <div class="left-sidebar">
                <!-- 菜单 -->
                <ul class="sidebar-nav">
                    <li class="sidebar-nav-link">
                        <a href="index.jsp" class="active">
                            <i class="am-icon-home sidebar-nav-link-logo"></i> 电影管理
                        </a>
                    </li>
                    <li class="sidebar-nav-link">
                        <a href="comment.jsp">
                            <i class="am-icon-table sidebar-nav-link-logo"></i> 评论管理
                        </a>
                    </li>
                    <li class="sidebar-nav-link">
                        <a href="user.jsp">
                            <i class="am-icon-calendar sidebar-nav-link-logo"></i> 用户管理
                        </a>
                    </li>
                </ul>
            </div>

            <!-- 内容区域 -->
            <div class="tpl-content-wrapper" style="color: #fff;">
                <%
                    String movieId=request.getParameter("movieId");
                    /* byte b1[]=movieId.getBytes("ISO-8859-1");
                    movieId = new String(b1,"utf-8"); */
                    
                    Connection con=null;
                    Statement stmt=null;
                    ResultSet rs=null;
                    Class.forName("com.mysql.jdbc.Driver");
                    String url="jdbc:mysql://localhost:3306/movie?useUnicode=true&characterEncoding=gbk";
                    con=DriverManager.getConnection(url,"root","root");
                    stmt=con.createStatement();
                    String sql="select * from movie_info where id=" + movieId;
                    rs=stmt.executeQuery(sql);
                    while(rs.next()){
                %>
                <form class="am-form am-form-horizontal" action="./uploadMovieToSql.jsp" style="padding: 16px 48px;">
                	<input name="movieId" style="color:black;display:none;" value=<%=movieId%> >
                    <div class="row">
                        <label>电影名:</label>
                        <input name="movieName" type="text" placeholder="请输入要添加的电影名称" value="<%=rs.getString("movieName")%>">
                    </div>
                    <div class="row">
                        <label>评分:</label>
                        <input type="number" name="score" placeholder="请输入要添加的电影评分" value="<%=rs.getString("score")%>">
                    </div>
                    <div class="row">
                        <label>演员:</label>
                        <input type="text" name="actor" placeholder="请输入要添加的电影演员" value="<%=rs.getString("actor")%>">
                    </div>
                    <div class="row">
                        <label>导演:</label>
                        <input type="text" name="director" placeholder="请输入要添加的电影导演" value="<%=rs.getString("director")%>">
                    </div>
                    <div class="row">
                        <label>上映年份:</label>
                        <input type="text" name="year" placeholder="请输入要添加的电影上映年份" value="<%=rs.getString("year")%>">
                    </div>
                    <div class="row">
                        <label>分类:</label>
                        <input type="text" name="category" placeholder="请输入要添加的电影分类" value="<%=rs.getString("category")%>">
                    </div>
                    <div class="row">
                        <label>收藏:</label>
                        <input type="text" name="collection" placeholder="请输入要添加的收藏数" value="<%=rs.getString("collection")%>">
                    </div>
                    <div class="row">
                        <label>详细介绍:</label>
                        <textarea name="detail" placeholder="请输入要添加的电影详细介绍">
                            <%=rs.getString("detail")%>
                        </textarea>
                    </div>
                    <button type="submit" class="am-btn am-btn-warning">点击提交</button>
                </form>
                <%
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                %>
                
                
            </div>
	</div>
	<script src="assets/js/amazeui.min.js"></script>
        <script src="assets/js/app.js"></script>
    </body>
</html>