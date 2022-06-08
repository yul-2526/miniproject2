<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <jsp:useBean id="mallCart" class="order.CartBean" scope="session"/>
<%
String pnum=request.getParameter("pnum");
out.println("pnum:"+pnum+"<br>");

mallCart.removeProduct(pnum);
response.sendRedirect("mall_cartList.jsp");
%>
