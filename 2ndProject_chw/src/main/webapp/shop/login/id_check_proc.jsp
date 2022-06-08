<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userid=request.getParameter("userid");	

	
	MemberDao mdao=MemberDao.getInstance();
	boolean flag = mdao.searchId(userid);
	
	if(flag){ 
		out.write("NO");
	}
	else{
		out.write("YES");
	}

%>

