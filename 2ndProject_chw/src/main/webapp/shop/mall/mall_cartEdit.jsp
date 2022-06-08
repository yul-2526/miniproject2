<%@page import="mall.ProductBean"%>
<%@page import="mall.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mallCart" class="order.CartBean" scope="session"/>

<%
String pnum=request.getParameter("pnum");  
String oqty=request.getParameter("oqty"); 

ProductDao pdao=ProductDao.getInstance();
ProductBean pb=pdao.selectByPnum(pnum);

if(pb.getPqty() < Integer.parseInt(oqty)){ 
%>	
	<script type="text/javascript">
		alert("수량 초과");
		location.href="mall_cartList.jsp";
	</script>
<%	
	return;
}

mallCart.setEdit(pnum,oqty); 
%>
<script type="text/javascript">
		alert("수량 수정 되었습니다.");
		location.href="mall_cartList.jsp";
</script>


