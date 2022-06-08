<%@page import="java.text.DecimalFormat"%>
<%@page import="mall.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "mall_top.jsp"%>

<jsp:useBean id="mallCart" class="order.CartBean" scope="session"/>

<%
String pnum=request.getParameter("pnum");
String oqty=request.getParameter("oqty");

if(!pnum.equals("0")  && !oqty.equals("0")){ 
	mallCart.addProduct(pnum, oqty);
}
%>
	<table align="center" width="90%">
		<tr>
			<td colspan="6" align="center"><h3>결제 내역서</h3>	</td>
		</tr>
		<tr>
			<th width="40%"  bgcolor="pink" class="table">상품명</th>
			<th width="20%" bgcolor="pink" class="table">수량</th>
			<th width="40%" bgcolor="pink" class="table">금액</th>
		</tr>
<%

	Vector<ProductBean> cv = mallCart.getAllProducts();
	DecimalFormat df = new DecimalFormat("#,###");
	int totalPrice=0;
	for( ProductBean pb : cv){
	
%>
		<tr>
			<td align="center"><%=pb.getPname() %></td>
			<td align="right"><%=pb.getPqty() %>개</td>
			<td align="right"><%=df.format(pb.getTotolPrice()) %>원</td>
		</tr>
	<%
		totalPrice += pb.getTotolPrice();
	}//for
%>
	<tr>
		<td colspan="3" align="center">
		<hr>
			<b>총 결제금액</b>:
			<font color="red"><%=df.format(totalPrice) %>원</font>
		</td>
	</tr>
	</table>
	<br>
	<input type="button" value="결제하기" onClick="location.href='<%=request.getContextPath()%>/shop/mall/mall_calculate.jsp'" class="bt">
	
<%@ include file = "mall_bottom.jsp" %> 

