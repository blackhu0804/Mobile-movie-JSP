<%@ page language="java" contentType="text/html; charset=utf-8"  
    pageEncoding="utf-8"%>  
<%  
  session.removeAttribute("username");  
  out.println("<script>window.location.href='./index.jsp'</script>");  
%>  