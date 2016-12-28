<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	
	bdao.upViewcnt(bbsno);
	
	BbsDTO dto = bdao.read(bbsno);
	
	String content = dto.getContent();
	content = content.replaceAll("\r\n","<br>");
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
function bupdate(){
	var url = "updateForm.jsp";
	url+="?bbsno=<%=bbsno%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	
	location.href=url; // 이동하는 것 수정누르는 순간 이동한다

}
function bdelete(){
	var url = "deleteForm.jsp";
	url+="?bbsno=<%=bbsno%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	url+="&oldfile=<%=dto.getFilename()%>";
	
	location.href=url; // 이동하는 것 삭제누르는 순간 이동한다
}
function breply(){
	var url = "replyForm.jsp";
	url+="?bbsno=<%=bbsno%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
	
}

function down(filename){
	var url = "<%=root %>/download";
	url+="?dir=/bbs/storage";
	url+="&filename="+filename;
	
	location.href=url;
}
</script>
<style type="text/css"> 
.div-read{
	margin: 0 auto;
	text-align: center;
}
.table-read{
	font-size: 20px;
	margin: 0 auto;
	text-align: center;
}

.title{
	font-size: 50px;
	font-family: inherit;
}
</style> 
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
<div class="container">
<div class="text-center title">조회</div>
<hr style="width: 30%; height: 2px;" >

 

  <TABLE class="table-read">
    <TR>
      <TH>제목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><%=dto.getContent() %></TD>
    </TR>
    <TR>
      <TH>성명</TH>
      <TD><%=dto.getWname() %></TD>
    </TR>
    <TR>
      <TH>조회수</TH>
      <TD><%=dto.getViewcnt() %></TD>
    </TR>
    <TR>
      <TH>등록</TH>
      <TD><%=dto.getWdate().substring(0, 10) %></TD>
    </TR>
    <TR>
      <TH>파일명</TH>
      <TD>
        <%if(dto.getFilename()==null){
      	out.print("파일없음");
      
      }else{%>
      <%=dto.getFilename() %>(<%=dto.getFilesize()/1024 %>KB)
      <a href="javascript:down('<%=dto.getFilename() %>')">
      <span class="glyphicon glyphicon-download-alt"></span>
    	</a>
    <%} %>  
    </TD>
  
    </TR>
    
    
    
   </TABLE>
   </div>
  <DIV class="div-read">
    <input type='button' class="btn btn-default" value='등록' onclick="location.href='./createForm.jsp'">
    <input type='button' class="btn btn-default" value='목록' onclick="blist()">
    <input type='button' class="btn btn-default" value='수정' onclick="bupdate()">
    <input type='button' class="btn btn-default" value='삭제' onclick="bdelete()">
    <input type='button' class="btn btn-default" value='답변' onclick="breply()">
  </DIV>

<br><br><br>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 