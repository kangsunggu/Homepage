<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
int no = Integer.parseInt(request.getParameter("no"));
String passwd = request.getParameter("passwd");
String oldfile = request.getParameter("oldfile");
String upDir = application.getRealPath("/images/storage");

String col = request.getParameter("col");
String word = request.getParameter("word");
String nowPage = request.getParameter("nowPage");

Map map = new HashMap();
map.put("no", no);
map.put("passwd", passwd);

boolean pflag = idao.passCheck(map);
boolean flag= false;

if(pflag){
flag=idao.delete(no);
}
if(flag){

UploadSave.deleteFile(upDir, oldfile);
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
 
<DIV class="title">처리결과</DIV>
<div class="content"></div>
 <%
 	if(pflag==false){
 	out.print("패스워드가 일치하지 않습니다.");
 	}else if(flag){
 	out.print("글을 삭제 했습니다.");
 	
 	}else{
 	out.print("글을 삭제했습니다.");
 	}
 %>

  <% if(pflag==false){ %>
  <DIV class='bottom'>
    <input type='button' value='돌아가기' onclick="history.back()">
    <input type='button' value='목록' onclick="blist()">
  </DIV>
<%}else {%>
<DIV class='bottom'>
    <input type='button' value='다시등록' onclick="location.href='createForm.jsp'">
    <input type='button' value='목록' onclick="blist()">
  </DIV>
<%} %>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 