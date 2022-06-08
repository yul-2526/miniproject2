<%@page import="java.text.DecimalFormat"%>
<%@page import="mall.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "mall_top.jsp"%>

<jsp:useBean id="mallCart" class="order.CartBean" scope="session"/>
<%
Vector<ProductBean> cv = mallCart.getAllProducts();
DecimalFormat df = new DecimalFormat("#,###");
int cartTotalPrice=0, cartTotalPoint=0;
 %>
 
 <table width="100%" align="center" >
 	<tr>
 		<td colspan="6" align="center">
 			<h3>장바구니</h3>
 			 <hr>
 		</td>

 	</tr>
 	
 	<tr>
 		<th bgcolor="pink" class="table">번호</th>
 		<th bgcolor="pink" class="table">상품명</th>
 		<th bgcolor="pink" class="table">수량</th>
 		<th bgcolor="pink" class="table">금액</th>
 		<th bgcolor="pink" class="table">삭제</th>
 	</tr>
 	<%
 		if(cv.size() == 0){
	%>
			<tr>
				<td colspan="5" align="center">
					선택한 상품이 없습니다.
				</td>
			</tr>
	<% 			
 		}
 		else{
 			for( ProductBean pb : cv){
 				int pnum=pb.getPnum();
 				String pname=pb.getPname();
 				int price=pb.getPrice();
 				int point=pb.getPmile();
 				int pqty = pb.getPqty(); // 주문수량
 				String pimage=pb.getPimage();
 				String imgPath=request.getContextPath()+"/shop/images/"+pimage;
		%>
				<tr>
					<td align="center"><%=pnum %></td>
					<td align="center">
						<img src="<%=imgPath%>" width=120 height=120></a><br>
						<%=pname %>
					</td>
					<td align="center">
						<form name="f" method="post" action="mall_cartEdit.jsp">
							<input type="text" name="oqty" size="1" value="<%=pqty%>">개<br>
							<input type="hidden" name="pnum" value="<%=pnum %>" >
							<input type="submit" value="수정">
						</form>
					
					</td>
					<td align="center">
					<%=df.format(pb.getTotolPrice()) %>원<br> 
					<%=df.format(pb.getTotolPoint()) %>p<br>
					</td>
					<td align="center">
						<a href="mall_cartDel.jsp?pnum=<%=pnum %>">삭제</a>
					</td>
				</tr>
		<%
				cartTotalPrice += pb.getTotolPrice();
				cartTotalPoint += pb.getTotolPoint();
				%>
		<tr>
		<td colspan="5"><hr><br></td>
		</tr>
				<%
 			} // for
		%>

			<tr>
				<td colspan="3">
					<b>장바구니 총액</b> :
					<font color="red"><%=df.format(cartTotalPrice) %></font>원<br>
					총 적립금 : <%=df.format(cartTotalPoint) %>p<br>
					
				</td>
				<td colspan="2">
					<a href="mall_order.jsp?pnum=0&oqty=0">[주문하기]</a> / 
					<a href="mall_main.jsp">[계속 쇼핑]</a> 
				</td>
			</tr>
		<%	 			
 		}//else
 	%>
 </table>
 <%@ include file = "mall_bottom.jsp"%>
 