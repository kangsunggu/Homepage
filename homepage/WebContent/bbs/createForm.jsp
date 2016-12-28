<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); 
	String root = request.getContextPath();
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
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
	  action='./createProc.jsp'
	  enctype="multipart/form-data"
	  class="form-horizontal">
	  <div class="row">
	  <div class="col-lg-3"></div>
	  <div class="col-lg-8">
	  <h2 class="fa fa-pencil-square text-center">bbs등록</h2>
  <TABLE class="table table-hover">
    <TR>
      <TH>성명</TH>
      <TD class="td1"><input type="text" name="wname"></TD>
    </TR>
     <TR>
      <TH>제목</TH>
      <TD class="td1"><input type="text" name="title"></TD>
    </TR>
     <TR>
      <TH>내용</TH>
      <TD>
      	<textarea rows="10" cols="50" name="content"></textarea>
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
  
  <DIV class="text-center">
    <input type='submit' class="btn btn-default" value='등록' onclick="location='./'">
    <input type='button' class="btn btn-default" value='취소' onclick="history.back()">
  </DIV>
  </div>
  </div>
</FORM>
 </div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 