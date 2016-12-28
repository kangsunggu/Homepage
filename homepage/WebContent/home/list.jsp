<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
//--------------검색-----------------
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")){
		word="";
	}
	//페이지관련-------------------------
	int nowPage = 1; //현재페이지(변경가능해야함)
	if(request.getParameter("nowPage")!=null){//널이 아닌때 보내줬다 
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	
	int recordPerPage = 10; //한페이지당 보여줄 레코드 갯수
	
	//DB에서 읽어올 시작 순번(sno)과 끝순번(eno) 생성
	int sno = ((nowPage-1)*recordPerPage) +1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	//----------------------------------

	List<MemoDTO> list = mdao.list(map);// DAO에서 가지고 온 데이터를 뿌려준다.
	int total = mdao.total(col,word);


%>

<!DOCTYPE html> 
<html> 
<head> 
<style type="text/css">
.img {
	width: 200px;
	height: 200px;
}
</style>
<meta charset="UTF-8">
 <title></title> 
<script type="text/javascript">
function read(memono){
	var url = "read.jsp";
	url+="?memono=" + memono;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	
	location.href=url;
	
}
</script>


<link href="../css/style.css" rel="stylesheet" type="text/css">

</head>
 
<body> 
<!-- ---------------------------------------------------- -->
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- ---------------------------------------------------- -->
<br><br>
<div class="container"> 
<div class="row">
<div class="col-lg-1"></div>
<div class="col-lg-10">
            
<form method="post" 
	  action="./list.jsp"
	  class="form-horizontal">
 	<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">게시판목록</button>
  <div id="demo" class="collapse">
  사람들의 게시판을 볼 수 있고, 자신의 게시판을 등록하고 삭제를 할 수 있습니다.
  </div>
  <br>
 	<select name="col"><!-- 검색할 컬럼명 -->
 		<option value="title"
 		<%if(col.equals("title")) out.print("selected='selected'"); %>
 		>제목</option>
 		<option value="content"
 		<%if(col.equals("content")) out.print("selected='selected'"); %>
 		>내용</option>
 		<option value="total">전체출력</option>
 	</select>
 	<input type="text" name="word" value="<%=word %>"><!-- 검색어 -->
 	<input type="submit" value="검색">
 	<input type='button' value='등록' onclick="location.href='./createForm.jsp'">
 	</form>  
  <table class="table table-striped">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>날짜</th>
		<th>조회수</th>
		
	</tr>
<%
	if(list.size()==0){
%>
	<tr>
		<td colspan="4">등록된 정보가 없습니다.</td>
	</tr>
<%
	}else{
		for(int i=0; i<list.size(); i++){
			MemoDTO dto=list.get(i);
			%>
			<tr>
				<td><%=dto.getMemono() %></td>
				<td><a href="javascript:read('<%=dto.getMemono() %>')"><%=dto.getTitle() %></a></td>
				<td><%=dto.getWdate() %></td>
				<td><%=dto.getViewcnt() %></td>
			</tr>
<% }//for-end
} // if-end
%>

</table>
</div>
</div>
</div>


<div>
<%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>

</div>
<br><br><br>
<!-- ---------------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp"/>
<!-- ---------------------------------------------------- -->

</body> 
</html> 
