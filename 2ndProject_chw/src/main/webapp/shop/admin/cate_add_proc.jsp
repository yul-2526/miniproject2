<%@page import="mall.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="cb" class="mall.CategoryBean" />
<jsp:setProperty property="*" name="cb" />

<%
CategoryDao cdao = CategoryDao.getInstance();
int cnt = cdao.insertCatogory(cb);
String msg="", url=null;
if(cnt>0){
	msg = "카테고리 삽입 성공";
	url = "cate_list.jsp";
}
else{
	msg = "카테고리 삽입 실패";	
	url = "cate_add.jsp";
}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>


