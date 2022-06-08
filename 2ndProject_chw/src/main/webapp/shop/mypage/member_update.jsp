<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

 <%
 request.setCharacterEncoding("UTF-8");
 String id=request.getParameter("id2");
 String name=request.getParameter("name");
 String password=request.getParameter("password");
 String address=request.getParameter("address");
 String email=request.getParameter("email");
 String hp1=request.getParameter("hp1");
 String hp2 =request.getParameter("hp2");
 
MemberDao mdao = MemberDao.getInstance();
int cnt =  mdao.updateMember(id,name,password,address,email,hp1,hp2); 

String msg, url;
if(cnt>0){
	msg = "수정성공";
	url = "../mall/mall_main.jsp";
}
else{
	msg = "수정실패";
	url = "mypage_main.jsp?id="+id; 
	
}
 %>
 
 <script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
 
 
 
 