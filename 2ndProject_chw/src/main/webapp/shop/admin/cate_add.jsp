<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "admain_top.jsp"%>

<script type="text/javascript">
function check(){
	if(document.myform.code.value==""){
		alert('코드를 입력하시오');
		return false;
	}
	if(document.myform.cname.value==""){
		alert('이름을 입력하시오');
		return false;
	}
}
</script>

	<h2>카테고리 등록</h2>
	<form name="myform" method="post" action="cate_add_proc.jsp">
		<table width="300">
			<tr>
				<th align="center" bgcolor="pink" class="table">카테고리 코드</th>
				<td><input type="text" name="code"></td>
			</tr>
			<tr>
				<th align="center" bgcolor="pink" class="table">카테고리 이름</th>
				<td><input type="text" name="cname"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록" onClick="return check()" class="bt">
					<input type="reset" value="취소" onClick="location.href='cate_list.jsp'" class="bt">
				</td>
			</tr>
		</table>
	</form>

<%@ include file = "admain_bottom.jsp"%>

    