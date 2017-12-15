<%-- 
    Document   : index.jsp
    Created on : 2017-12-5, 8:41:22
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
                        <div class="am-fl tpl-header-navbar" style="height:30px;">
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
                    <table class="am-table am-table-bordered am-table-radius am-table-striped">
                        <thead>
                            <tr>
                                <th>电影名称</th>
                                <th>主演</th>
                                <th>导演</th>
                                <th>分类</th>
                                <th>评分</th>
                                <th>上映年份</th>
                                <th>宣传图</th>
                                <th style="width: 15em;">介绍</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Connection con=null;
                                Statement stmt=null;
                                ResultSet rs=null;
                                Class.forName("com.mysql.jdbc.Driver");
                                String url="jdbc:mysql://localhost:3306/movie?useUnicode=true&characterEncoding=gbk";
                                con=DriverManager.getConnection(url,"root","root");
                                stmt=con.createStatement();
                                String sql="select * from movie_info";
                                rs=stmt.executeQuery(sql);
                                while(rs.next()){
                            %>
                            <tr>
                                <td style="width: 8em"><%=rs.getString("movieName") %></td>
                                <td style="width: 6em;"><%=rs.getString("actor") %></td>
                                <td style="width: 5em;"><%=rs.getString("director") %></td>                               
                                <td style="width: 5em;"><%=rs.getString("category") %></td>
                                <td><%=rs.getString("score") %></td>
                                <td  style="width: 5em;"><%=rs.getString("year") %></td>
                                <%
                                    String str = rs.getString("img");
                                    String imgStr = "../" + str;
                                %>
                                
                                <td>
                                    <img src=<%=imgStr%> style="width:5em;">
                                    <form action="./upload.jsp" method="post" enctype="multipart/form-data">
                                        <input type="file" name="img">
                                        <button type="submit" class="am-btn am-btn-secondary am-radius" style="margin-bottom: 1em;">修改图片</button>
                                    </form>
                                </td>
                                <td style="display: block;width: 15em;height: 18em;overflow: auto"><%=rs.getString("detail")%></td>
                                <td style="width: 40px;">
                                    <form action="correctMovie.jsp" method="post">
                                        <input style="display: none;" name="movieId" value=<%=rs.getString("id")%> />
                                        <button type="submit" class="am-btn am-btn-secondary am-radius" style="margin-bottom: 1em;">修改</button>
                                    </form>
                                    <form action="./deleteMovie.jsp" method="post">
                                        <input style="display: none;" name="movieId" value=<%=rs.getString("id")%> />
                                        <button type="submit" class="am-btn am-btn-danger am-radius">删除</button>
                                    </form>
                                </td>
                            </tr>
                             <%
                                }
                                rs.close();
                                stmt.close();
                                con.close();
                            %>
                        </tbody>
                    </table>
		</div>
	</div>
	</div>
	<script src="assets/js/amazeui.min.js"></script>
        <script src="assets/js/app.js"></script>
    </body>
</html>
