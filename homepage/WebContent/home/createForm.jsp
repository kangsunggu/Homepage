<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

<!DOCTYPE html> 
<html> 
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title></title> 
<style type="text/css"> 

</style> 
</head> 
<body> 
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->

 <div class="container">
<FORM name='frm' 
	  method='POST' 
	  action='./createProc.jsp'
	  class="form-horizontal">
	<div class="row"> 
	<div class="col-lg-3"></div>
	<div class="col-lg-8">
	<h2 class="fa fa-pencil-square text-center">게시판등록</h2>
  <TABLE class="table table-hover">
     <TR>
      <TH>제목</TH>
      <TD ><input type="text" name="title"></TD>
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
<div class="text-center">
   <input type='submit' class="btn btn-default" value='등록'>
    <input type='reset' class="btn btn-default" value='다시입력'>
 </div>   
</FORM>
</div>

<jsp:include page="/menu/bottom.jsp" flush="false"/>
<!-- *********************************************** -->
</body> 
</html> 
