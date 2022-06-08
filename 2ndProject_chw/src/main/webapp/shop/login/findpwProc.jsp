<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findpwPro<br><br>

<%
request.setCharacterEncoding("UTF-8");

String id=request.getParameter("id");
String name=request.getParameter("name");
String hp1=request.getParameter("hp1");
String hp2=request.getParameter("hp2");

MemberDao mdao=MemberDao.getInstance();
String pw=mdao.getMemberByIdNameHp(id, name, hp1, hp2);

String msg;
if(pw==null){
	msg="해당 회원 정보가 없음";
}else{
	msg=name+"님의 비밀번호는 "+pw+" 입니다";
}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="main.jsp";

</script>