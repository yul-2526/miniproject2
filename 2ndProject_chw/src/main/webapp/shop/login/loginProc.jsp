<%@page import="member.MemberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

String id=request.getParameter("id");
String password=request.getParameter("password");
String conPath=request.getContextPath(); 

MemberDao mdao=MemberDao.getInstance();
MemberBean mbean=mdao.getmemberInfo(id, password); 

String msg, viewPage;
if(mbean==null){
	msg="회원정보가 없음";
	viewPage=conPath+"/shop/login/main.jsp";
}else{
	msg="환영합니다";
	String mid=mbean.getId();
	int mno=mbean.getNum();
	
	session.setAttribute("mid",mid);
	session.setAttribute("mno",mno);
	if(mid.equals("admin")){
		viewPage=conPath+"/shop/admin/admin_main.jsp";
	}else{
		viewPage=conPath+"/shop/mall/mall_main.jsp";	
	}
}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=viewPage%>";
</script>