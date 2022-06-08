<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
list.jsp=>content.jsp=>deleteForm.jsp => deleteProc.jsp
<!-- 번호,비번이 넘어간다. -->
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String passwd=request.getParameter("passwd");
	int pageNum=Integer.parseInt(request.getParameter("pageNum"));


	BoardDao bdao=BoardDao.getInstance();
	int cnt=bdao.deleteArticle(num,passwd); 
	
	int pageSize =10;
	int count = bdao.getArticleCount();
	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); // 전체 
	
	if(cnt > 0){
		
		if(pageNum > pageCount){
			response.sendRedirect("list.jsp?pageNum="+(pageNum-1));
		}
		else{
			response.sendRedirect("list.jsp?pageNum="+pageNum);
		}
	}
	else{
	%>
	  <script type="text/javascript">
		   alert('비밀번호가 맞지 않습니다.');
		   history.go(-1);
	</script>
	<%   
   }
%>
