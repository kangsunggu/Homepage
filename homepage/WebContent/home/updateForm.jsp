<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	MemoDTO dto = mdao.read(memono);
	
%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

.ta1{
	width: 50%;
	margin: auto;
	border:1;
}

</style> 
</head> 
<body> 
<!-- ---------------------------------------------------- -->
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- ---------------------------------------------------- -->

 <div class="container">
<h2 class="fa fa-pencil text-center">게시판수정</h2>
<form name="frm" 
	  method="post" 
	  action="./updateProc.jsp" 
	  class="form-horizontal">
	  <div class="row">
	  <div class="col-sm-3"></div>
	<div class="col-sm-6">
<input type="hidden" name="memono" value="<%=memono%>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
  <TABLE class="table table-hover">

     <TR>
      <TH>제목</TH>
      <TD class="td1"><input type="text" name="title" placeholder="<%=dto.getTitle() %>"></TD>
    </TR>
     <TR>
      <TH>내용</TH>
      <TD>
      	<textarea rows="10" cols="50" name="content"></textarea>
      </TD>
    </TR>
  </TABLE>
  </div>
  </div>
  <DIV class='text-center'>
    <input class="btn btn-success" type='submit' value='등록'>
    <input class="btn btn-success" type='reset' value='다시입력'>
  </DIV>
</FORM>
</div>


<!-- ---------------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp"/>
<!-- ---------------------------------------------------- -->
</body> 
</html> 
