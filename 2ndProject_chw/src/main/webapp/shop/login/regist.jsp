<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="styleSheet" href="<%=request.getContextPath() %>/style.css?after" />

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/script.js"></script> 

<form method="post" action="registProc.jsp" name="myform">

<table align="center" width="750px" height="70%">
	<tr>
		<td  colspan="2" align="center" bgcolor="#FFDC4A">
			<font size="3"><b>회원정보 입력</b></font>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">* 표시가 붙은 항목은 꼭 기입해주세요</td>
	</tr>
	
	<tr>
		<th>*아이디</th>
		<td>
			<input type="text" name="id">
			<input type="button" id="id_check" value="중복확인" onClick="duplicate()">
			<span id="idmessage"></span>
		</td>
	</tr>
		
	<tr>
		<th>*이름</th>
		<td><input type="text" name="name"></td>
	</tr>
	
	<tr>
		<th>*비밀번호</th>
		<td><input type="password" name="password" onBlur="return pwcheck()">영문 소문자/숫자 조합 3~8자</td>
	</tr>
	
	<tr>
		<th>*비밀번호 확인</th>
		<td>
			<input type="password" name="repassword" onBlur="repwcheck()">
			<span id="pwmessage"></span>
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td><input type="text" name="address" style="width:500px"></td>	
	</tr>
	
	<tr>
		<th>E-Mail</th>
		<td><input type="text" name="email"></td>
	</tr>
	
	</tr>
		<th>휴대전화번호</th>
		<td>
			010 - <input type="text" name="hp1" style="width:100px"> - <input type="text" name="hp2" style="width:100px">
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center" bgcolor="#FFDC4A">
			<input type="submit" value="가입하기" onClick="return writeSave()" class="bt">
			<input type="reset" value="취소" onClick="location.href='main.jsp'" class="bt">
		</td>
	</tr>
</table>
</form>