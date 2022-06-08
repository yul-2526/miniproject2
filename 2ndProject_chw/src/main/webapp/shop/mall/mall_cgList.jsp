<%@page import="java.text.DecimalFormat"%>
<%@page import="mall.ProductBean"%>
<%@page import="mall.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "mall_top.jsp"%>
<%
String cname = request.getParameter("cname");
String code = request.getParameter("code");

ProductDao pdao = ProductDao.getInstance();
ArrayList<ProductBean> list = pdao.selectByCategory(code);
DecimalFormat df = new DecimalFormat("#,###");
%> 

<h3><%=cname %></h3>
<hr aligh="center" color="#5C3E66" size="5px" width="500px">
<%
	if(list.size()==0){
		out.print("<b>상품 없음.</b><br>");
	}
%>
	<br>
	<table border="0" align="center" width="90%">
	<tr>
		<%
			int count=0;
			for( ProductBean pb : list){
				count++;
				int pnum = pb.getPnum();
				String pname = pb.getPname();
				int price = pb.getPrice();
				int point = pb.getPmile();
				String pimage = pb.getPimage();
				
				String imgPath = request.getContextPath()+"/shop/images/"+pimage;
				%>
				<td align="center">
					<a href="mall_prodView.jsp?pnum=<%=pnum%>">
						<img src="<%=imgPath%>" width="120" height="120">
					</a> <br>
					<%=pname %><br>
					<font color=red><%=df.format(price) %></font>원<br>
					<font color=blue><%=point %></font>p 적립<br>
				</td>
				<%
				if(count%3==0){
					out.print("</tr><tr>");
				}
			}//for
		%>
	</tr>
	</table>

<%@ include file = "mall_bottom.jsp"%>