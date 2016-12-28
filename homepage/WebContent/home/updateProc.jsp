<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>

<jsp:useBean id="dto" class="memo.MemoDTO"/>
<jsp:setProperty property="*" name="dto"/>

<% 
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	
	boolean flag = mdao.update(dto);
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

</style> 
</head> 
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<br><br><br><br>
<div class="text-center">
<%
	 if(flag){
		out.print("수정이 성공하였습니다.");
	}else{
		out.print("수정이 실패하였습니다.");
	}

%> 
<br>
<input type="button" value="목록" class="btn btn-default" onclick="mlist()">
</div>
<br><br><br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body> 
</html> 