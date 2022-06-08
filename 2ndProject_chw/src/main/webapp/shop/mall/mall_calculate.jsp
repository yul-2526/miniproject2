<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:useBean id="mallCart" class="order.CartBean" scope="session" />
 
<%
int mno =  (int)session.getAttribute("mno"); 

String msg, url;
	msg = "주문 완료했습니다.";
	url = request.getContextPath()+"/shop/mall/mall_main.jsp";
	mallCart.removeAllProduct();
%>
<script type="text/javascript">
	alert("<%=msg%>"); 
	location.href="<%=url%>";
</script>
 %>
