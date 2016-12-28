<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = bdao.readReply(bbsno);
	
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css">
.title{
font-size: 35px;
}

</style>
<style type="text/css"> 

</style> 
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 

<div class="container">
<FORM name='frm' 
method='POST' 
action='./replyProc.jsp'
enctype="multipart/form-data"
class="form-form-horizontal">
<div class="row">
<div class="col-lg-3"></div>
<div class="col-lg-6">

<DIV class="text-center title">답변</DIV>
<!-- 답변을 등록하기 위해서 -->
<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">
<input type="hidden" name="indent" value="<%=dto.getIndent() %>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
<!-- 페이지와 검색유지를 위해서 -->
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
<!-- 부모글 삭제를 막기 위해서 -->
<input type="hidden" name="bbsno" value="<%=bbsno %>">

  <TABLE class="table table-hover">
    <TR>
      <TH>성명</TH>
      <TD class="td1"><input type="text" name="wname"></TD>
    </TR>
     <TR>
      <TH>제목</TH>
      <TD class="td1"><input type="text" name="title" value="<%=dto.getTitle() %>"></TD>
    </TR>
     <TR>
      <TH>내용</TH>
      <TD>
      	<textarea rows="10" cols="45" name="content"></textarea>
      </TD>
    </TR>
     <TR>
      <TH>비밀번호</TH>
      <TD class="td1"><input type="password" name="passwd"></TD>
    </TR>
    <TR>
      <TH>파일명</TH>
      <TD class="td1"><input type="file" name="filename"></TD>
    </TR>
  </TABLE>
  </div>
  </div>
  <DIV class="text-center">
    <input type='submit' class="btn btn-default" value='등록'>
    <input type='button' class="btn btn-default" value='취소' onclick="history.back()">
  </DIV>
</FORM>
 </div> 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 