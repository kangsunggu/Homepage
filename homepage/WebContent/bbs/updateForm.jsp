<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%


	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = bdao.read(bbsno);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function incheck(f){
	//f는 매개변수로 form을 가리킨다.
	if(f.wname.value==""){
		alert("이름을 입력하세요.");
		f.wname.focus();
		return false;
	}
	if(f.title.value==""){
		alert("제목을 입력하세요.");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요.");
		f.content.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요.");
		f.passwd.focus();
		return false;
	}
	
	
}

</script>
<style type="text/css"> 

.td1{
	text-align: left;
}
.title{
	font-size: 35px;
}
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
action='./updateProc.jsp' 
onsubmit="return incheck(this)"
enctype="multipart/form-data"
class="form-horizontal">
<input name="bbsno" value="<%=bbsno %>" type="hidden">
<input name="col" value="<%=request.getParameter("col") %>" type="hidden">
<input name="word" value="<%=request.getParameter("word") %>" type="hidden">
<input name="nowPage" value="<%=request.getParameter("nowPage") %>" type="hidden">
<input name="oldfile" value="<%=dto.getFilename() %>" type="hidden">
<div class="row">
<div class="col-lg-2"></div>
<div class="col-lg-8">
<h2 class="text-center title">bbs수정</h2>
  <TABLE class="table table-hover">
    <TR>
      <TH>성명</TH>
      <TD class="td1"><input type="text" name="wname" value="<%=dto.getWname() %>"></TD>
    </TR>
     <TR>
      <TH>제목</TH>
      <TD class="td1"><input type="text" name="title" value="<%=dto.getTitle() %>"></TD>
    </TR>
     <TR>
      <TH>내용</TH>
      <TD class="td1">
      	<textarea rows="10" cols="50" name="content"><%=dto.getContent() %></textarea>
      </TD>
    </TR>
     <TR>
      <TH>비밀번호</TH>
      <TD class="td1"><input type="password" name="passwd"></TD>
    </TR>
     <TH>파일명</TH>
      <TD class="td1"><input type="file" name="filename">(<%=Utility.checkNull(dto.getFilename()) %>)</TD>
    </TR>
  </TABLE>
  </div>
  </div>
  <DIV class="text-center">
    <input type='submit' class="btn btn-default" value='수정' >
    <input type='button' class="btn btn-default" value='취소' onclick="history.back()">
  </DIV>
</FORM>
 </div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 