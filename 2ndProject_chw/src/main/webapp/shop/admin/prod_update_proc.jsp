<%@page import="java.io.File"%>
<%@page import="mall.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 String uploadDir = config.getServletContext().getRealPath("shop/images");
  
 int maxSize = 1024 * 1024 * 5; 
String encType = "UTF-8";
MultipartRequest mr = new MultipartRequest(request,
						uploadDir,
						maxSize,
						encType,
						new DefaultFileRenamePolicy()); 
 
String pcate = mr.getParameter("pcate");
String pnum = mr.getParameter("pnum");
String pname = mr.getParameter("pname");
String pimage = mr.getFilesystemName("pimage"); 
String pimage2 = mr.getParameter("pimage2"); 
String pqty = mr.getParameter("pqty");
String price = mr.getParameter("price");
String pinfo = mr.getParameter("pinfo");
String pmile = mr.getParameter("pmile");

ProductDao pdao = ProductDao.getInstance();
int cnt =  pdao.updateProduct(mr); 

 if(pimage!=null){ 
	if(pimage2!=null) { 
		File dirDelete = new File(uploadDir,pimage2); 
 
		if(dirDelete.exists()){ 
			dirDelete.delete(); 
 			
		}//
	}//
}//
String msg, url;
if(cnt>0){
	msg = "수정성공";
	url = "prod_list.jsp";
}
else{
	msg = "수정실패";
	url = "prod_update.jsp?pnum="+pnum; 
 }
 %>
 
 <script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
 
 
 
 