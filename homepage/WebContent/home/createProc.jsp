
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %> 
<jsp:useBean id="dto" class ="memo.MemoDTO"/>




<%
dto.setTitle(request.getParameter("title"));
dto.setContent(request.getParameter("content"));
	boolean flag = mdao.create(dto);
%>


<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

.div1{
	text-align: center; 
	margin-top: 20px;
	margin-bottom: 20px;
}
.img {
	width: 200px;
}
</style> 
</head> 
<body> 
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
<br><br><br><br>
<div class="div1">
	<%
		if(flag){
			out.print("<img class='img' src='../home/tjdrhd.png'><br>");
			out.print("메모등록을 하였습니다.");
		}else{
		out.print("<img class='img' src='../home/tlfvo.png'><br>");
		out.print("메모등록이 실패하였습니다.");
			
		}
	%>
<br>
<input type="button" value="계속 등록" class="btn btn-default" onclick="location.href='./createForm.jsp'">
<input type="button" value="목록" class="btn btn-default" onclick="location.href='./list.jsp'">

</div>
<br><br><br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
<!-- *********************************************** -->

</body> 
</html> 