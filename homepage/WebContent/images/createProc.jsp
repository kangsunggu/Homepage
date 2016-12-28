<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="vo" class="images.ImagesDTO"/>
<%  

String tempDir = application.getRealPath("/images/temp");
String upDir = application.getRealPath("/images/storage");

UploadSave upload = new UploadSave(request,-1,-1,tempDir);

vo.setWname(UploadSave.encode(upload.getParameter("wname")));
vo.setTitle(UploadSave.encode(upload.getParameter("title")));
vo.setContent(UploadSave.encode(upload.getParameter("content")));
vo.setPasswd(UploadSave.encode(upload.getParameter("passwd")));

FileItem fileItem = upload.getFileItem("fname");
int size = (int)fileItem.getSize();
String fname = null;
if(size>0) fname = upload.saveFile(fileItem, upDir);

vo.setFname(fname);

boolean flag = idao.create(vo);

%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: 맑은고딕; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false" />
<!-- *********************************************** -->
 
<DIV class="title">사진등록</DIV>
<div class="content">
<% 
if(flag){
out.print("등록성공");
}else{
out.print("등록실패");
}

%>
</div>

<% if(flag){ %>
   <DIV class='bottom'>
    <input type="button" value='새로운 사진등록' onclick="location.href='./createForm.jsp'">
    <input type='button' value='목록' onclick="location.href='./list.jsp'">
  </DIV>
  <% }else{ %>
   <DIV class='bottom'>
    <input type="button" value='다시시도' onclick="history.back()">
    <input type='button' value='목록' onclick="location.href='./list.jsp'">
  </DIV>
  <% } %>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html> 
