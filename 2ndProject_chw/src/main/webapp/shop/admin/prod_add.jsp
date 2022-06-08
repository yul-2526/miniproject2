<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ include file = "admain_top.jsp"%>
    
	<form action="prod_add_proc.jsp" method="post" enctype = "multipart/form-data">
			<table border="0" class="outline" width="600">
			
				<tr>
					<th  align="center" bgcolor="pink" class="table">상품명</th>
					<td>
						<input type="text" name="pname">
					</td>
				</tr>
				
				<tr>
					<th  align="center" bgcolor="pink" class="table">카테고리</th>
					<td>
					<select name="pcate">
						<%  
						CategoryDao cdao = CategoryDao	.getInstance();
						ArrayList<CategoryBean> list = cdao.categoryAll(); 
						
						if(list.size()==0){ 
						%>
							<option value="">카테고리 없음</option>
						<%							
						} // if
						else{  
							for( CategoryBean cb : list){ 
								String code = cb.getCode();
								String cname = cb.getCname();
								%>
									<option value="<%=code %>"><%=cname%></option>
								<%
								
							}//for
						} // else
						%>					
					</select>
					</td>
				</tr>
				<th align="center" bgcolor="pink" class="table">상품코드</th>
					<td>
						<input type="text" name="pcode">
					</td>
				<tr> 
				<th  align="center" bgcolor="pink" class="table">상품이미지</th>
					<td>
						<input type="file" name="pimage">
					</td>
				</tr>
				
				<tr>
					<th  align="center" bgcolor="pink" class="table">상품 수량</th>
					<td>
						<input type="text" name="pqty">
					</td>
				</tr>
				
				<tr>
					<th  align="center" bgcolor="pink" class="table">상품 가격</th>
					<td>
						<input type="text" name="price">
					</td>
				</tr>
				
				<tr>
					<th  align="center" bgcolor="pink" class="table">상품 소개</th>
					<td>
						<textarea name="pinfo" rows=5 cols=50 style="resize:none;"></textarea>
					</td>
				</tr>
				
				<tr>
					<th  align="center" bgcolor="pink" class="table">적립 마일리지</th>
					<td>
						<input type="text" name="pmile">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center" >
						<input type="submit" value="상품등록" class="bt">
						<input type="button" value="취소" class="bt" onClick="location.href='prod_list.jsp'">
					</td>
				</tr>
				
			</table>
		</form>
		
<%@ include file = "admain_bottom.jsp"%>
		