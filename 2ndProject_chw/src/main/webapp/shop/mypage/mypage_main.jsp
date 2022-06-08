<%@page import="member.MemberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/script.js"></script>

<%@ include file = "../mall/mall_top.jsp"%>
    
<% 
	String id = (String)session.getAttribute("mid");
	System.out.println(id);

	MemberDao mdao=MemberDao.getInstance();
	MemberBean bean=mdao.selectById(id);
%>
   
<form method="post" action="member_update.jsp" name="myform">

<table align="center" width="550px" height="70%">
	<tr>
		<td  colspan="2" align="center" bgcolor="#FFDC4A">
			<font size="3"><b>회원정보 수정</b></font>
		</td>
	</tr>
	
	<tr>
		<th align="center" bgcolor="pink" class="table">*아이디</th>
		<td>
			<input type="text" name="id2" value="<%=bean.getId() %>" disabled>
			<input type="hidden" name="id2" value="<%=bean.getId() %>">
		</td>
	</tr>
		
	<tr>
		<th align="center" bgcolor="pink" class="table">*이름</th>
		<td><input type="text" name="name" value="<%=bean.getName() %>"></td>
	</tr>
	
	<tr>
		<th align="center" bgcolor="pink" class="table">*비밀번호</th>
		<td><input type="password" name="password"  onBlur="return pwcheck()">영문 소문자/숫자 조합 3~8자</td>
	</tr>
	
	<tr>
		<th align="center" bgcolor="pink" class="table">*비밀번호 확인</th>
		<td>
			<input type="password" name="repassword" onBlur="repwcheck()">
			<span id="pwmessage"></span>
		</td>
	</tr>
	
	<tr>
		<th align="center" bgcolor="pink" class="table">주소</th>
		<td><input type="text" name="address" style="width:500px"  value="<%=bean.getAddress() %>"></td>	
	</tr>
	
	<tr>
		<th align="center" bgcolor="pink" class="table">E-Mail</th>
		<td><input type="text" name="email"  value="<%=bean.getEmail() %>"></td>
	</tr>
	
	</tr>
		<th align="center" bgcolor="pink" class="table">휴대전화번호</th>
		<td>
			010 - <input type="text" name="hp1" style="width:100px" value="<%=bean.getHp1() %>"> - <input type="text" name="hp2" style="width:100px" value="<%=bean.getHp2() %>">
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center" bgcolor="#FFDC4A">
			<input type="submit" value="수정" onClick="return writeSave()" class="bt">
			<input type="button" value="취소"  class="bt" onClick="location.href='<%=conPath%>/shop/mall/mall_main.jsp'">
		</td>
	</tr>
</table>
</form>
    
<%@ include file = "../mall/mall_bottom.jsp"%>
    