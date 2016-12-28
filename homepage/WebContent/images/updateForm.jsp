<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
int no = Integer.parseInt(request.getParameter("no"));
ImagesDTO vo = idao.read(no);
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Images - updateForm</title>
<script type="text/javascript">
function inputCheck(f) {
if (f.wname.value == "") {
alert("이름이 없음");
f.wname.focus();
return false;
}
if (f.title.value == "") {
alert("제목이 없음");
f.title.focus();
return false;
}
if (f.content.value == "") {
alert("내용이 없음");
f.content.focus();
return false;
}
if (f.passwd.value == "") {
alert("암호가 없음");
f.passwd.focus();
return false;
}
if (f.fname.value == "") {
alert("사진이 없음");
f.passwd.focus();
return false;
}
}
</script>
<style type="text/css">
* {
font-family: gulim;
font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top2.jsp" flush="false" />
<!-- *********************************************** -->

<DIV class="title">사진 수정</DIV>

<FORM name='frm' method='POST' action='./updateProc.jsp' enctype="multipart/form-data" onsubmit="return inputCheck(this)">
<input type="hidden" name="grpno" value="<%=vo.getGrpno()%>">
<input type="hidden" name="indent" value="<%=vo.getIndent()%>">
<input type="hidden" name="ansnum" value="<%=vo.getAnsnum()%>">
<input name="no" value="<%=no%>" type="hidden">
<input name="col" value="<%=request.getParameter("col")%>" type="hidden">
<input name="word" value="<%=request.getParameter("word")%>" type="hidden">
<input name="nowPage" value="<%=request.getParameter("nowPage")%>" type="hidden">
<input name="oldfile" value="<%=vo.getFname()%>" type="hidden">
<TABLE> 
<TR>
<TH>성명</TH>
<TD>
<input type="text" name="wname" value="<%=vo.getWname()%>">
</TD>
</TR>
<TR>
<TH>제목</TH>
<TD>
<input type="text" name="title" value="<%=vo.getTitle()%>">
</TD>
</TR>
<TR>
<TH>내용</TH>
<TD>
<textarea rows="10" cols="45" name="content"><%=vo.getContent()%></textarea>
</TD>
</TR>
<TR>
<TH>비밀번호</TH>
<TD>
<input type="password" name="passwd" placeholder="비밀번호를 꼭! 입력하세요.">
</TD>
</TR>
<TR>
<TH>첨부파일</TH>
<TD>
<%
if (vo.getFname() != null) {
%>
<%=Utility.checkNull(vo.getFname())%><br>
<%
}
%>
<input type="file" name="fname" accept=".jpg,.png,.gif">
</TD>
</TR>
</TABLE>


<DIV class='bottom'>
<input type='submit' value='수정'>
<input type='button' value='취소' onclick="history.back()">
</DIV>
</FORM>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>