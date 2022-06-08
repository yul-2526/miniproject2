<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

findidPro<br><br>

<%
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
String email=request.getParameter("email");

MemberDao mdao=MemberDao.getInstance();
String id=mdao.getMemberByNameEmail(name, email);

String msg;
if(id==null){
	msg="해당 회원 정보가 없음";
}else{
	msg=name+"님의 아이디는 "+id;
}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="main.jsp";

</script>