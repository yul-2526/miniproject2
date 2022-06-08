<%@page import="mall.ProductBean"%>
<%@page import="mall.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="styleSheet" href="../../style.css" />

<%@ include file = "mall_top.jsp"%>
<h2>신상품</h2>
<hr aligh="center" color="#5C3E66" size="5px" width="500px">
<%
	DecimalFormat df = new DecimalFormat("#,###");
	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> list = pdao.productAllNew();	
		
		if(list.size()==0){
			out.print("<b>상품 없습니다.</b><br><br><br><br>");
		}
		else{
			
	%>
			<table  align="center" width="90%">
			<tr>
			<%
				int count=0;
				for( ProductBean pb : list){
					count++;
					int pnum = pb.getPnum();
					String pname = pb.getPname();
					int price = pb.getPrice();
					int mile = pb.getPmile();
					String pimage = pb.getPimage(); 
					
					String imgPath = request.getContextPath()+"/shop/images/"+pimage;
			%>
					<td align="center">
						<a href="mall_prodView.jsp?pnum=<%=pnum %>">
							<img src="<%=imgPath %>" width=80 height=80>
						</a> <br>
						<%=pname %><br>
						<font color=red><%=df.format(price) %></font>원<br>
						<font color=blue><%=mile %></font>p 적립<br>
					</td>
					
			<%		
					if(count%3==0){
						out.print("</tr><tr>");
					}//if
				}//for
			%>				
			</tr>
			</table>
	<%			
		}//else
		

%>


<%@ include file = "mall_bottom.jsp"%>
