<%-- 
    Document   : signUp
    Created on : 2017-11-26, 22:20:34
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- CSS -->
        <link rel="stylesheet" href="./css/login/reset.css">
        <link rel="stylesheet" href="./css/login/supersized.css">
        <link rel="stylesheet" href="./css/login/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="page-container">
            <h1>注册</h1>
            <form action="check_register.jsp" method="post">
                <input type="text" name="username" class="username" placeholder="用户名">
                <input type="email" name="email" placeholder="邮箱">
                <input type="password" name="password" class="password" placeholder="密码">
                <button type="submit">提交</button>
                <div class="error"><span>+</span></div>
            </form>
        </div>
		
        <!-- Javascript -->
        <script src="./js/jquery.min.js"></script>
        <script src="./js/login/supersized.3.2.7.min.js"></script>
        <script src="./js/login/supersized-init.js"></script>
        <script src="./js/login/scripts.js"></script>
    </body>
</html>
