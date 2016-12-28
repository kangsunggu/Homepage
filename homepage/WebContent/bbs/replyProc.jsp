<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<jsp:setProperty property="*" name="dto" />
<%
String upDir = application.getRealPath("/bbs/storage");
String tempDir = application.getRealPath("/bbs/temp");


//빈즈객체 생성
UploadSave upload = new UploadSave(request,-1,-1,tempDir);

//페이징과 검색을 위한 값
String col = upload.getParameter("col");
String word = UploadSave.encode(upload.getParameter("word")); //한글처리
String nowPage = upload.getParameter("nowPage");
//답변을 위한 부모의 값
dto.setGrpno(Integer.parseInt(upload.getParameter("grpno")));
dto.setIndent(Integer.parseInt(upload.getParameter("indent")));
dto.setAnsnum(Integer.parseInt(upload.getParameter("ansnum")));
//부모글삭제를 제한하기 위해서
dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno")));
//form의 입력된 값 가져오기
dto.setWname(UploadSave.encode(upload.getParameter("wname")));
dto.setTitle(UploadSave.encode(upload.getParameter("title")));
dto.setContent(UploadSave.encode(upload.getParameter("content")));
dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
//filename 가져오기
FileItem fileItem = upload.getFileItem("filename");
int filesize = (int)fileItem.getSize();
String filename = null;
if(filesize>0){
	filename = UploadSave.saveFile(fileItem, upDir);
}
dto.setFilename(filename);
dto.setFilesize(filesize);



Map map = new HashMap();
map.put("grpno", dto.getGrpno());
map.put("ansnum", dto.getAnsnum());
bdao.upAnsnum(map);
boolean flag = bdao.createReply(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>createProc</title>
<script type="text/javascript">
function blist() {
var url = "list.jsp";
url+="?col=<%=col%>";
url+="&word=<%=word%>";
url+="&nowPage=<%=nowPage%>";

location.href = url;
}
</script>
<style type="text/css">

</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top2.jsp" flush="false" />
<!-- *********************************************** -->
<br><br><br><br>
<div class="text-center">처리 결과</div>
<DIV class="text-center">


<%
if (flag) {
out.print("답글이 등록 되었습니다.");
} else {
out.print("답글이 등록되지 못했습니다.");
}
%>
</DIV>
<div class="text-center">
<input type="button" value="새글 작성" class="btn btn-default" onclick="location='./createForm.jsp'"> 
<input type="button" value="목록" class="btn btn-default" onclick="blist()">
</div>
<br><br><br>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>