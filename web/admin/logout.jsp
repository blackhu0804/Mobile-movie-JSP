<%-- 
    Document   : logout
    Created on : 2017-12-5, 9:09:11
    Author     : Administrator
--%>

<%@ page language="java" contentType="text/html; charset=utf-8"  
    pageEncoding="utf-8"%>  
<%  
  session.removeAttribute("username");  
  out.println("<script>window.location.href='./login.jsp'</script>");  
%>  