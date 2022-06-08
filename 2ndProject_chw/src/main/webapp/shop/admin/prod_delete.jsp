<%@page import="java.io.File"%>
<%@page import="mall.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String pnum = request.getParameter("pnum");
	String pimage = request.getParameter("pimage");
	
	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.deleteProduct(pnum); 
	
	String uploadDir = config.getServletContext().getRealPath("shop/images");
	File deleteDir = new File(uploadDir,pimage); 
	if(deleteDir.exists()){ 
		deleteDir.delete(); 
	}
	
	String msg, url;
	if(cnt>0){
		msg = "삭제성공";
		url = "prod_list.jsp";
	}
	else{
		msg = "삭제실패";
		url = "prod_list.jsp";
	}
	 %>
	 
	 <script type="text/javascript">
		alert("<%=msg%>");
		location.href="<%=url%>";
	</script>
	 