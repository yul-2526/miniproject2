<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String num = request.getParameter("num");
	MemberDao mdao = MemberDao.getInstance();
	int cnt = mdao.memDelete(num);  
	String msg=null , url=null;
    if(cnt>0){
    	msg = "유저정보 삭제 성공";
    	url = "member_list.jsp";
    }else{
		msg="유저정보 삭제 실패";
		url = "member_list.jsp";
	}
    %>
    
    <script type="text/javascript">
		alert("<%=msg%>");
		location.href="<%=url%>";
	</script>

