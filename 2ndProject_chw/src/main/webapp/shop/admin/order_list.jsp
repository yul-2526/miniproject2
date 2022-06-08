<%-- <%@page import="java.text.DecimalFormat"%>
<%@page import="order.OrdersBean"%>
<%@page import="java.util.Vector"%>
<%@page import="order.OrdersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "admain_top.jsp"%>


<%
	OrdersDao odao = OrdersDao.getInstance();
	
	Vector<OrdersBean> list = new Vector<OrdersBean>();
	String memid = request.getParameter("memid");
	
	if(memid != null){ 
		list = odao.getOrderList(memid); 
	} 
%>
		
		<table border="1" width="90%">
			<tr>
				<td colspan="5" align="center">
					<form action="order_list.jsp" method="post">
						조회할 회원 아이디 :
						<input type="text" name="memid" value="">
						<input type="submit" value="내역 조회">
					</form>
				</td>
			</tr>
			<tr>
				<th>고객명</th>
				<th>아이디</th>
				<th>상품명</th>
				<th>수량</th>
				<th>금액</th>
			</tr>
			<%
				int totalAmount=0;
				DecimalFormat df = new DecimalFormat("#,###");
				for( OrdersBean ob : list){
			%>
					<tr>
						<td align="center"><%=ob.getMname() %></td>
						<td align="center"><%=ob.getMid() %></td>
						<td align="center"><%=ob.getPname() %></td>
						<td align="center"><%=ob.getQty() %></td>
						<td align="center"><%=ob.getAmount() %></td>
					</tr>
			<%					
					totalAmount += ob.getAmount();
				}//for
			%>
			<tr>
				<td colspan="4" align="center">총합</td>
				<td align="right">￦<%=df.format(totalAmount) %></td>
			</tr>
		</table>

<%@ include file = "admain_bottom.jsp"%>

     --%>