<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"  %>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>

<%
	String upDir = "/bbs/storage";
	String tempDir = "/bbs/temp";
	
	//절대경로
	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);
	
	//빈즈객체 생성
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);	

	
	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	String nowPage = upload.getParameter("nowPage");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	
	//dto에 담음
	dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno")));
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	FileItem fileItem = upload.getFileItem("filename");
	int filesize = (int)fileItem.getSize();
	String filename = null;
	if(filesize>0){ //새로운파일을 업로드 했다.
		UploadSave.deleteFile(upDir,oldfile); //기존파일을 삭제
		filename = UploadSave.saveFile(fileItem, upDir);
	}
	dto.setFilesize(filesize);
	dto.setFilename(filename);
	
	//패스워드 검증
	Map map = new HashMap();
	map.put("bbsno", dto.getBbsno());
	map.put("passwd", dto.getPasswd());
	
	boolean pflag = bdao.passCheck(map);
	//패스워드 확인이 되면 수정처리
		boolean flag = false;
	if(pflag){
		flag=bdao.update(dto);
	}
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function blist(){
	var url = "list.jsp";
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
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
<DIV class="text-center">수정처리</DIV>
 <div class ="text-center">
	<%
		if(pflag==false){
			out.print("비밀번호가 일치하지 않습니다.");
		}else if(flag){
			out.print("글을 변경하였습니다.");
		}else{
			out.print("게시판등록에 실패하였습니다.");
		}
	
	%>
 </div>

  <%
  	if(pflag==false){
  %>
  
  
  <DIV class='text-center'>
    <input type='submit' value='돌아 가기' onclick="history.back()">
    <input type='button' value='목록' onclick="blist()">
  </DIV>
<%}else{%>
 <DIV class='text-center'>
    <input type='submit' value='다시등록' onclick="location.href='createForm.jsp'">
    <input type='button' value='목록' onclick="blist()">
  </DIV>
 <%} %>
 <br><br><br>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 