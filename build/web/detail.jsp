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
            <div class="row">
                <p class="comment-user">xxx说：</p>
                <p class="comment-content">这部电影真的太棒了</p>
            </div>
            <div class="row">
                <p class="comment-user">xxx说：</p>
                <p class="comment-content">这部电影真的太棒了</p>
            </div>
            <div class="row">
                <p class="comment-user">xxx说：</p>
                <p class="comment-content">这部电影真的太棒了</p>
            </div>
            <div class="row">
                <p class="comment-user">xxx说：</p>
                <p class="comment-content">这部电影真的太棒了</p>
            </div>
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
