<%-- 
    Document   : index
    Created on : 2017-11-22, 9:07:40
    Author     : Administrator
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="referrer" content="never">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>JSP Page</title>
        <link rel="stylesheet" href="http://at.alicdn.com/t/font_453516_twt3qzwfgdp9zfr.css">
        <link rel="stylesheet" href="./css/index.css">
    </head>
    <body>
        <main>
        <section id="top250">
            <div class="container"></div>
            <div class="loading">
              <span class="iconfont icon-loading"></span>
            </div>
        </section>
        <section id="beimei">
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
            <div class="container">
                <div class="item">
                        <a href="#">
                                <div class="cover">
                                        <img src=<%=rs.getString("img") %> alt="">          
                                </div>
                                <div class="detail">
                                        <h2><%=rs.getString("movieName") %></h2>
                                        <div class="extra"><span class="score"><%=rs.getString("score") %>分</span> / <span class="collect"><%=rs.getString("collection") %></span>收藏</div>
                                        <div class="extra"><span class="year"><%=rs.getString("year") %></span> / 分类：<span class="type"><%=rs.getString("category") %></span></div>
                                        <div class="extra">导演：<span class="director"><%=rs.getString("director") %></span></div>
                                        <div class="extra">主演：<span class="actor"><%=rs.getString("actor") %></span></div>
                                </div>
                        </a>
                </div>
            </div>
            <div class="loading">
              <span class="iconfont icon-loading"></span>
            </div>
         <%
            }
            rs.close();
            stmt.close();
            con.close();
        %>
        </section>


        <section id="search">
          <div class="search-area">
            <input type="text" placeholder="搜索电影">
            <span class="button">搜索</span>
          </div>
          <div class="search-result">

          </div>
          <div class="loading">
            <span class="iconfont icon-loading"></span>
          </div>
        </section>
        <section id="user">
            <div class="user-info">
                <%
                    String username=(String)session.getAttribute("username");
                    if(username==null){
                        %>
                            <a class="btn" href="signIn.jsp">登录</a>
                            <a class="btn" href="signUp.jsp">注册</a>
                        <% 
                    }else{
                %>
                <div class="info-name">
                    欢迎${username}
                </div>
                <%
                    }
                %>
            </div>
        </section>
      </main>  
  <footer>
    <div class="active"><span class="iconfont icon-top250"></span><span>Top250</span></div>
    <div><span class="iconfont icon-us"></span><span>北美</span></div>
    <div><span class="iconfont icon-search"></span><span>搜索</span></div>
    <div><span class="iconfont icon-yonghu"></span><span>用户</span></div>
  </footer>  
    <script src="./js/jquery.min.js"></script>
    <script src="./js/js.js"></script>
    </body>
</html>
