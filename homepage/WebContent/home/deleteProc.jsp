<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file = "/ssi/ssi.jsp" %>
<% request.setCharacterEncoding("utf-8"); %> 


<%
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	
	int memono = Integer.parseInt(request.getParameter("memono"));
	
	MemoDTO dto = new MemoDTO();
	dto.setMemono(memono);
	
	boolean flag = mdao.delete(memono);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">
function mlist(){
	var url = "list.jsp";
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	
	location.href=url;
}

</script>
<style type="text/css"> 
div{
	text-align: center;
}
</style> 
</head> 
<body> 
<jsp:include page="/menu/top2.jsp" flush="false"/>
<br><br><br><br>
<div>
	<%
		if(flag){
			out.print("메모를 삭제하였습니다.");
		}else{
			out.print("메모삭제를 실패했습니다.");
		}
	%>
	<br>
	<input type="button" value="목록" class="btn btn-default" onclick="mlist()">
</div>
<br><br><br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html> 

