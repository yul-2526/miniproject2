<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
logout<br><br>

<%
	session.invalidate();
%>

<jsp:forward page="main.jsp"/>

