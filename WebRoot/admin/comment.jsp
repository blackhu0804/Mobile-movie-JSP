<%-- 
    Document   : comment
    Created on : 2017-12-5, 8:45:29
    Author     : Administrator
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>评论管理</title>
	<meta name="keywords" content="index">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="assets/css/amazeui.min.css" />
	<link rel="stylesheet" href="assets/css/app.css">
	<script src="assets/js/jquery.min.js"></script>

</head>

<body data-type="index">
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
                    <a href="index.jsp">
                        <i class="am-icon-home sidebar-nav-link-logo"></i> 电影管理
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="comment.jsp"  class="active">
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
        <div class="tpl-content-wrapper">
            <div class="" style="color: #fff;">
                <table class="am-fl am-table am-table-bordered am-table-radius am-table-striped">
                    <thead>
                        <tr>
                            <th>评论条数</th>
                            <th>评论内容</th>
                            <th>评论人</th>
                            <th>评论时间</th>
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
                            String sql="select * from comment";
                            rs=stmt.executeQuery(sql);
                            while(rs.next()){
                        %>
                        <tr>
                            <td><%=rs.getString("id")%></td>
                            <td><%=rs.getString("comment")%></td>
                            <td><%=rs.getString("username")%></td>
                            <td><%=rs.getString("commentTime")%></td>
                            <td>
                                <form action="./deleteComment.jsp" method="post">
                                    <input style="display: none;" value=<%=rs.getString("id")%> name="commentId"/>
                                    <button type="submit" class="am-btn am-btn-danger am-radius">删除评论</button>
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
