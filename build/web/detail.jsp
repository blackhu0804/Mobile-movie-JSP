<%@page contentType="text/html"  import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>电影详情</title>
        <link rel="stylesheet" href="./css/detail.css">
    </head>
    <body>
        
        <section id="movieDetail">
        <%
            String idInfo = request.getParameter("id");
            Connection con=null;
            Statement stmt=null;
            ResultSet rs=null;
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/movie?useUnicode=true&characterEncoding=gbk";
            con=DriverManager.getConnection(url,"root","root");
            stmt=con.createStatement();
            String sql="select * from movie_info where id = " + idInfo;
            rs=stmt.executeQuery(sql);
            while(rs.next()){
        %>
        <div class="detail">
            <div class="header">
                <div class="poster-bg" style="background-image: url(&quot;//gw.alicdn.com/i2/TB1xsowaG_85uJjSZFlXXXemXXa_.jpg_400x400Q30s150.jpg&quot;);"></div>

                <img src="<%=rs.getString("img")%>">
                <div class="detail-info">
                    <h2><%=rs.getString("movieName") %></h2>
                    <div class="extra"><span class="score"><%=rs.getString("score") %>分</span> / <span class="collect"><%=rs.getString("collection") %></span>评分</div>
                    <div class="extra"> 分类：<span class="type"><%=rs.getString("category") %></span></div>
                    <div class="extra">导演：<span class="director"><%=rs.getString("director") %></span></div>
                    <div class="extra">主演：<span class="actor"><%=rs.getString("actor") %></span></div>
                </div>
            </div>
        </div>
        
        </section>
        <section class="movie-introduction" id="introduction" style="display: none;">
            <p class="itr-info"><%=rs.getString("detail")%></p>
        </section>
        <p id="toggle">展开介绍</p>
        <%
            }
            rs.close();
            stmt.close();
            con.close();
        %>
        <section class="comment">
            <%
                Connection con1=null;
                Statement stmt1=null;
                ResultSet rs1=null;
                Class.forName("com.mysql.jdbc.Driver");
                String url1="jdbc:mysql://localhost:3306/movie?useUnicode=true&characterEncoding=gbk";
                con=DriverManager.getConnection(url,"root","root");
                stmt=con.createStatement();
                String sql1="select * from comment where movieId = " + idInfo;
                rs=stmt.executeQuery(sql1);
                while(rs.next()){
            %>
            <div class="row">
                <div>
                    <p class="comment-user"><%=rs.getString("username")%>说：</p>
                    <p class="comment-time"><%=rs.getString("commentTime")%></p>
                </div>
                <p class="comment-content"><%=rs.getString("comment")%></p>
            </div>
            <%
                }
                rs.close();
                stmt.close();
                con.close();
            %>
        </section>
        <section class="submit-comment">
            <%   
                java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
                java.util.Date currentTime = new java.util.Date();//得到当前系统时间   
                String str_date= formatter.format(currentTime); //将日期时间格式化  
            %>  
            <form action="addComment.jsp" method="post">
                <input name="idInfo" value="<%=idInfo%>"/>
                <input name="comment-user" value="<%=(String)session.getAttribute("username")%>"/>
                <input name="comment-time" value="<%=str_date%>"/>
                <textArea  name="commentContent" placeholder="请填写您的评论"></textArea>
                <button type="submit" class="sub-button">提交</button>
            </form>
        </section>
    </body>
    <script src="./js/jquery.min.js"></script>
    <script type="text/javascript">
    $(function() {
        $("#toggle").click(function() {
            if($("#introduction").is(":hidden")) {
                $("#introduction").slideToggle(500);
                $("#toggle").text("收起介绍")
            }else{
                $("#introduction").slideToggle(500);
                $("#toggle").text("展开介绍")
            }
        });
    });
    </script>
</html>
