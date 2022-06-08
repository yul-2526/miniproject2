<%@page import="mall.ProductBean"%>
<%@page import="mall.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "mall_top.jsp"%>

<script type="text/javascript">
    	function goCart(pnum){
    		oqty = document.f.oqty.value;
    		
    		if(oqty<1){
    			alert('수량은 1보다 커야합니다.');
    		}
    		location.href="mall_cartadd.jsp?pnum="+pnum+"&oqty="+oqty;

    	}
    	
    	function goOrder(pnum){
    		pnum = document.f.pnum.value;
    		oqty = document.f.oqty.value;
    		document.f.action="mall_order.jsp?pnum="+pnum+"&oqty="+oqty; 
    		document.f.submit();
    	}
    </script>


<%
	String pnum = request.getParameter("pnum");
	ProductDao pdao = ProductDao.getInstance();
	ProductBean bean = pdao.selectByPnum(pnum);
	String imgPath = request.getContextPath()+"/shop/images/"+bean.getPimage();
	
%>
<br><br>
<form name="f">
<table width="100%">
	<tr>
		<td  colspan="2" align="center">
			<img src="<%=imgPath%>" width="200" height="200">
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<font color="#3C305C" size="5">
				<b><%=bean.getPname() %></b>
			</font>
		</td>
	</tr>

	<tr>
		<td>
			<hr width="550px">
				<input type="hidden" name="pnum" value="<%=bean.getPnum() %>">
				
				가격 : <%=bean.getPrice() %>원<br>
				적립금 : <%=bean.getPmile() %>p<br><br>
				구매 수량 : <input type="text" name="oqty" size="3" value="1">개<br><br>
			
		</td>
			<td></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<a href="javascript:goCart('<%=pnum%>')"><img src="<%=request.getContextPath()%>/images/cartbtn.gif" width="100"></a>
			<a href="javascript:goOrder('<%=pnum%>')"><img src="<%=request.getContextPath()%>/images/orderbtn.gif" width="100"></a>
		</td>
	</tr>
	
	<tr height="200" valign="top">
		<td colspan="2">
			<br><br><hr width="550px"><b>상세정보</b><br><br>
			<%=bean.getPinfo() %>
		</td>	
	</tr>
</table>
</form>

<%@ include file = "mall_bottom.jsp"%>