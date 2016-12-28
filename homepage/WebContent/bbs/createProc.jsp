<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="bbs.BbsDTO"/> <%-- 객체생성--%>
<%
	//업로드용 변수 선언(폴더명)
	String upDir = "/bbs/storage";
	String tempDir="/bbs/temp";
	//절대경로 생성
	upDir = application.getRealPath(upDir); 
	tempDir = application.getRealPath(tempDir);
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	dto.setWname(UploadSave.encode(upload.getParameter("wname"))); //값을 받아서 dto에 넣어줌
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	FileItem fileItem = upload.getFileItem("filename");
	int size = (int)fileItem.getSize();
	String filename = null;
	if(size>0){
		filename = UploadSave.saveFile(fileItem, upDir);
	}
	dto.setFilesize(size);
	dto.setFilename(filename);
	
	
	
	boolean flag = bdao.create(dto);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">

function blist(){
	var url = "list.jsp";
	
	location.href=url;
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
<br><br><br><br>
 <div class="text-center">처리결과</div>
<DIV class="text-center">
 <%
 	if(flag){
 		out.print("글이 등록되었습니다.");
 	}else{
 		out.print("글등록이 실패했습니다.");
 	}
 %>
 </DIV>
 <div class="text-center">
 <input type="button" value="계속등록" class="btn btn-default" onclick="location.href='./createForm.jsp'">
 <input type="button" value="목록" class="btn btn-default" onclick="blist()">
 </div>
 
 <br><br><br>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 