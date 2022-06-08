<%@page import="mall.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	request.setCharacterEncoding("UTF-8");
%>

올리는 경로:
<%
  	String uploadDir = config.getServletContext().getRealPath("shop/images"); 
 	int maxSize = 1024 * 1024 * 5; 
	String encType = "UTF-8";
	
	MultipartRequest mr = new MultipartRequest(request,
												uploadDir,
												maxSize,
												encType,
												new DefaultFileRenamePolicy()); 
  	
	String pname2= mr.getParameter("pname");
	String pimage= mr.getParameter("pimage");
	String pimage2 = mr.getFilesystemName("pimage");
 	
	out.print("pname2:" + pname2+"<br>");
	out.print("pimage:" + pimage+"<br>");
	out.print("pimage2:" + pimage2+"<br>");
	
	ProductDao pdao = ProductDao.getInstance();   
	int cnt = pdao.insertProduct(mr); 
	String msg="", url=null;
	if(cnt>0){
		msg = "상품 등록 성공";
		url = "prod_list.jsp";
	}
	else{
		msg = "상품 등록 실패";	
		url = "prod_add.jsp";
	}
	
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>


