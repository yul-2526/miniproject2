<%@page import="mall.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String cnum = request.getParameter("cnum");
	CategoryDao cdao = CategoryDao.getInstance();
	int cnt = cdao.categoryDelete(cnum);  
	String msg=null , url=null;
    if(cnt>0){
    	msg = "삭제성공";
    	url = "cate_list.jsp";
    }else{
		msg="삭제 실패";
		url = "cate_list.jsp";
	}
    %>
    
    <script type="text/javascript">
		alert("<%=msg%>");
		location.href="<%=url%>";
	</script>

