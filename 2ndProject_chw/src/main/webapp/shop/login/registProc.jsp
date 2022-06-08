<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mb" class="member.MemberBean" />
<jsp:setProperty property="*" name="mb" />

<%
MemberDao mdao=MemberDao.getInstance();
int cnt=mdao.insertMember(mb);
String msg, url;

if(cnt>0){
	msg="가입성공";
	url="main.jsp";
}else{
	msg="가입실패";
	url="regist.jsp";
}
%>

<script type="text/javascript">
	alert("<%=msg%>"); 
	location.href="<%=url%>";
</script>
