<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
	//--------------검색-----------------
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if(col.equals("total")){
		word="";
	}
	
	//----------------------페이지간련----------------------
	int nowPage = 1; // 현재 보고 있는 페이지
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 10; //한페이지당 보여줄 레코드 갯수
	
	//-------------DB에서 가져올 순번-------------------------
	int sno = ((nowPage-1)*recordPerPage) +1;
	int eno = nowPage * recordPerPage;
	
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	
	int total = bdao.total(col,word);
	
	//----------------------------------
	List<BbsDTO> list = bdao.list(map);
	Iterator<BbsDTO> iter = list.iterator();
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
	function read(bbsno){
		var url="read.jsp";
		url+="?bbsno="+bbsno;
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

/* .search{ */
/* 	width: 80%; */
/* 	text-align: center; */
/* 	margin: 1px auto; */
/* } */
</style> 
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
<br><br>
 
 <div class="container"> 
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
 
 <div class="">
<form method="post" 
	  action="./list.jsp"
	  class="form-horizontal">
 	
 	<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">게시판목록</button>
  <div id="demo" class="collapse">
  사람들의 게시판을 볼 수 있고, 자신의 게시판을 등록하고 삭제를 할 수 있습니다.
  </div>
 	<br>
 	
 	<select name="col"><!-- 검색할 컬럼명 -->
 		<option value="wname"
 		<%if(col.equals("wname")) out.print("selected='selected'"); %>
 		>성명</option>
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
 </div>
  <TABLE class="table table-hover">
    <TR>
      <TH>번호</TH>
      <TH>제목</TH>
      <TH>성명</TH>
      <TH>조회수</TH>
      <TH>등록일</TH>
      <TH>파일명</TH>
      
    </TR>
    <% if(list.size()==0){ %>
    <tr>
    <td colspan="8">등록된 글이 없습니다.</td>
    </tr>
    
    <% }else{ 
    	while(iter.hasNext()){
    		BbsDTO dto = iter.next();
    %>
    <tr>
    <td><%=dto.getBbsno() %></td>
    <td>
    <%
    	for(int i=0;i<dto.getIndent(); i++){
    		out.print("&nbsp;&nbsp;");
    	}
    
    	if(dto.getIndent()>0){ %>
    		<img src="./images/re.png" width="10px" height="10px">
    		<%} 
    	%>

    <a href="javascript:read('<%=dto.getBbsno() %>')">
    <%=dto.getTitle() %>
    </a>
    <% if(Utility.compareDay(dto.getWdate().substring(0,10)))	{ %>
    <img src="images/new.gif">
    <%} %>
    </td>
    <td><%=dto.getWname() %></td>
    <td><%=dto.getViewcnt() %></td>
    <td><%=dto.getWdate().substring(0, 10) %></td>
    <td>
    <% if(dto.getFilename()==null){ 
    	out.print("파일없음");
    }else{%>
    	<a href="javascript:down('<%=dto.getFilename() %>')">
    	<span class='glyphicon glyphicon-download-alt'></span>
    	</a>
    
    <%}%>
 
    </td>
    
    </tr>
    <% 
    }
   }%>
  </TABLE>
  </div>
  </div>
  </div>
  <DIV class="text-center">
    <%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
  </DIV>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 