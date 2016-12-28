<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<% 	
	String col=request.getParameter("col");
	String word=request.getParameter("word");
	String nowPage=request.getParameter("nowPage");
	
	int memono = Integer.parseInt(request.getParameter("memono"));

	/*조회수 증가*/
	mdao.upViewcnt(memono);
	/*조회수 증가 끝 */
	
	/*조회 */
	MemoDTO dto = mdao.read(memono);
	/*조회 끝*/
	String content = null;
	if(dto!=null){
		content = dto.getContent();
		content = content.replaceAll("\r\n", "<br>");
	}
	
%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link href="../css/style.css" rel="stylesheet" type="text/css">
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
 
<script type="text/javascript">
	function mcreate(){
		var url="createForm.jsp";
		url+="?col=<%=col%>";
		url+="&word=<%=word%>";
		url+="&nowPage=<%=nowPage%>";
		
		
		location.href=url;
		
	}
	function mupdate(memono){
		var url="updateForm.jsp";
		url+="?memono="+memono; //?앞에는 url 뒤에는 파라메터
		url+="&col=<%=col%>";
		url+="&word=<%=word%>";
		url+="&nowPage=<%=nowPage%>";
		
		location.href=url;
		
	}
	function mdelete(memono){
		var url="deleteForm.jsp";
		url+="?memono="+memono;
		url+="&col=<%=col%>";
		url+="&word=<%=word%>";
		url+="&nowPage=<%=nowPage%>";
		
		location.href=url;  //함수를 받아서 deleteForm.jsp로 memono의 값을 보낸다.
		
	}
	function mlist(){
		var url="list.jsp";
		url+="?col=<%=col%>";
		url+="&word=<%=word%>";
		url+="&nowPage=<%=nowPage%>";
		location.href=url;
		
	}
</script>
<link href="<%=root %>/css/style.css" rel="stylesheet" type="text/css">

</head> 
<body> 
<!-- ---------------------------------------------------- -->
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- ---------------------------------------------------- -->


<div class="container"> 
<div class="text-center title">조회</div>
<hr width="30%;">
<table class="table-read">
	<tr>
		<th>제목</th>
		<td><%=dto.getTitle() %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><%=content %></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=dto.getViewcnt() %></td>
	</tr>
	<tr>
		<th>등록</th>
		<td><%=dto.getWdate() %></td>
	</tr>
	
</table>
</div>

<div class="div-read">
	<input class="btn btn-default" type="button" value="등록" onclick="mcreate('')">
	<input class="btn btn-default" type="button" value="수정" onclick="mupdate('<%=dto.getMemono() %>')">
	<input class="btn btn-default" type="button" value="삭제" onclick="mdelete('<%=dto.getMemono() %>')">
	<input class="btn btn-default" type="button" value="목록" onclick="mlist('')">
</div>
<br><br><br>
<!-- ---------------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp"/>
<!-- ---------------------------------------------------- -->

</body> 
</html> 
