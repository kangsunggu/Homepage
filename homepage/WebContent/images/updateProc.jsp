<%@page import="java.awt.print.Printable"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="vo" class="images.ImagesDTO" />
<%
String upDir = "/images/storage";
String tempDir = "/images/temp";

upDir = application.getRealPath(upDir);
tempDir = application.getRealPath(tempDir);

UploadSave upload = new UploadSave(request, -1, -1, tempDir);

String col = upload.getParameter("col");
String word = UploadSave.encode(upload.getParameter("word"));
String nowPage = upload.getParameter("nowPage");
String oldfile = UploadSave.encode(upload.getParameter("oldfile"));

vo.setNo(Integer.parseInt(upload.getParameter("no")));
vo.setWname(UploadSave.encode(upload.getParameter("wname")));
vo.setTitle(UploadSave.encode(upload.getParameter("title")));
vo.setContent(UploadSave.encode(upload.getParameter("content")));
vo.setPasswd(UploadSave.encode(upload.getParameter("passwd")));

FileItem fileItem = upload.getFileItem("fname");

int filesize = (int) fileItem.getSize();
String fname = null;

if (filesize > 0) { //새 파일을 업로드했다.
UploadSave.deleteFile(upDir, oldfile); //기존파일을 삭제
fname = UploadSave.saveFile(fileItem, upDir);
}

vo.setFname(fname);

Map map = new HashMap();
map.put("no", vo.getNo());
map.put("passwd", vo.getPasswd());
boolean pflag = idao.passCheck(map);

boolean flag = false;
if (pflag) {
flag = idao.update(vo);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Images - updateProc</title>
<script type="text/javascript">
function blist() {
var url = "list.jsp";
url += "?col=<%=col%>";
url += "&word=<%=word%>";
url += "&nowPage=<%=nowPage%>";
location.href = url;
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

<DIV class="title">Images - updateProc</DIV>

<div class="content">
<%
if (pflag == false) {
out.print("패스워드 틀리셨습니다.");
} else if (flag) {
out.print("수정에 성공하셨습니다.");
} else {
out.print("수정 실패 하셨습니다.");
}
%>
</div>

<%
if (pflag == false) {
%>

<DIV class='bottom'>
<input type='submit' value='재 시도' onclick="history.back()">
<input type='button' value='목록' onclick="blist()">
</DIV>

<%
} else {
%>
<DIV class='bottom'>
<input type='submit' value='새글 작성' onclick="location.href='createForm.jsp'">
<input type='button' value='목록' onclick="blist()">
</DIV>
<%
}
%>


<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>