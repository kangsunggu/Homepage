<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	boolean flag = bdao.checkRefno(bbsno);
	
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function incheck(f){
	if(f.passwd.value==""){
		alert("패스워드를 입력하세요");
		f.passwd.focus();
		return false;
	}
}

</script>
<style type="text/css"> 
</style> 
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">삭제</DIV>

<%
	if(flag){
		out.print("답변있는 글이므로 삭제 할 수 없습니다.<br>");
		out.print("<input type='button' value='다시시도' onclick='history.go(-2)'>");

}else{ %>
<div class="container">
<div class="row">
<div class="col-lg-4"></div>

<div class="col-lg-4">

<FORM name='frm' 
method='POST' 
action='./deleteProc.jsp' 
onsubmit="return incheck(this)"
class="form-horizontal">
<input type="hidden" name="bbsno"value="<%=bbsno %>">
<input type="hidden" name="col"value="<%=request.getParameter("col") %>">
<input type="hidden" name="word"value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage"value="<%=request.getParameter("nowPage") %>">
<input type="hidden" name="oldfile"value="<%=request.getParameter("oldfile") %>">


삭제하면 복구할 수 없습니다.<br><br>

  <TABLE>
    <TR>
      <TH><span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span></TH>
      <TD><input type="password" class="form-control" name="passwd"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' class="btn btn-default" value='확인'>
    <input type='button' class="btn btn-default" value='취소' onclick="history.back()">
  </DIV>
</FORM>
<%} %>
</div> 
</div>
 </div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 