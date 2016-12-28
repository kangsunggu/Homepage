<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<% 
//업로드용 변수 선언(폴더명)
	String upDir = "/member/storage";
	String tempDir="/member/temp";
	//절대경로
	upDir = application.getRealPath(upDir); 
	tempDir = application.getRealPath(tempDir);
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	//form의 값을 받는다. 한글처리
	String id = UploadSave.encode(upload.getParameter("id"));
	String email = UploadSave.encode(upload.getParameter("email"));
	
	String str = "";
	if(dao.duplicateId(id)){
		str="중복된 아이디입니다.";
	}else if(dao.duplicateEmail(email)){
		str="중복된 이메일입니다.";
	}else{
		//createProc.jsp로 이동
		request.setAttribute("upload", upload);
%> 
<jsp:forward page="/member/createProc.jsp"/>


<%
return;
}
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"></DIV>
 <div class= "content">
 	<%=str %> 
  
  
  <DIV class='bottom'>
    <input type='submit' value='다시시도' onclick="history.back()">
  </DIV>
 </div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 