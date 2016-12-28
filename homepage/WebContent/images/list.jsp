<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
//검색============================================

String col= Utility.checkNull(request.getParameter("col"));
String word= Utility.checkNull(request.getParameter("word"));

if(col.equals("total")){
word="";
}

//paging 관련=======================================
int nowPage= 1;

if(request.getParameter("nowPage")!=null){ 
nowPage=Integer.parseInt(request.getParameter("nowPage"));
}
int recordPerPage= 5;

//DB에서 가져올 순번=====================================
int sno= ((nowPage-1)*recordPerPage)+1; 
int eno= nowPage*recordPerPage;


Map map= new HashMap();
map.put("col", col);
map.put("word", word);
map.put("sno", sno);
map.put("eno", eno);

int total=idao.total(col, word);
List<ImagesDTO> list= idao.list(map);
Iterator<ImagesDTO> iter= list.iterator();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function read(no){
var url= "read.jsp";
url+= "?no="+no;
url+= "&col=<%=col%>";
url+= "&word=<%=word%>";
url+= "&nowPage=<%=nowPage%>";

location.href=url;
}
function down(filename){
	var url = "<%=root %>/download";
	url+="?dir=/images/storage";
	url+="&filename="+filename;
	
	location.href=url;
}
</script>
<style type="text/css">
/* *{  */
/*   font-family: gulim;  */
/*   font-size: 20px;  */
/* }  */
/* .search{ */
/* width: 40%; */
/* text-align: center; */
/* margin: 3px auto; */
/* } */
/* div{ */
/* text-align: center; */
/* margin-bottom: 20px; */
/* margin-top: 20px; */
/* } */
/* table{ */
/* margin: auto; */
/* width:50% */
/* } */

/* table, th, td{ */
/*  border: 1px solid black; */
/*     	border-collapse: collapse */
/* } */
/* img#im{ */
/* 	width:250px; */
/* 	height:250px; */
/* 	margin-left: auto;  */
/* 	margin-right: auto; */
/* 	 display: block; */
 
/* } */
</style>
<link href="<%=root%>../css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->

<DIV class="container text-center">

<div class="search">
<FORM method='POST' action='./list.jsp'>
<div class="row">
<div class="col-lg-1 col-sm-offset-1">

<button type="button" class="btn btn-info " data-toggle="collapse" data-target="#demo">게시판목록</button>
    </div>
  </div>
  <div id="demo" class="collapse">
  사람들의 게시판을 볼 수 있고, 자신의 게시판을 등록하고 삭제를 할 수 있습니다.
  </div><br>

<select name="col">
<!-- 검색할 컬럼 -->
<option value="wname"
<%if(col.equals("wname")) out.print("selected='selected'"); %>>성명</option>
<option value="title"
<%if(col.equals("title")) out.print("selected='selected'"); %>>제목</option>
<option value="content"
<%if(col.equals("cotent")) out.print("selected='selected'"); %>>내용</option>
<option value="total">전체</option>
</select>

<input type="text" name="word" value="<%=word%>"> 
<input type='submit' value='검색'> 
<input type='button' value='등록' onclick="location.href='./createForm.jsp'">

</FORM>
</div>
<TABLE class="table table-bordered">
    <TR>
         <TH>번호</TH>
         <TH>사진</TH>
         <TH>제목</TH>
         <TH>성명</TH>
         <TH>조회수</TH>
         <TH>등록일</TH>       
         <TH>파일명</TH>             
    </TR> 
       <%if(list.size()==0){ //디비에 저장된 데이터가 없어서 true출력이 돼서%>
    <tr>
    	<td colspan="7">등록된 글이 없습니다</td>
    </tr>
    <%  } else{ 
    	while(iter.hasNext()){
    	ImagesDTO dto=iter.next();
    %>
    <tr>
    	<Td><%=dto.getNo() %></Td>
    	<td><img width="50px" height="50px"  id="im" src="./storage/<%=dto.getFname() %>"></td>
    	<Td>
    	<% for(int i=0; i<dto.getIndent();i++){
    	out.print("  ");
    	}
    	
    	if(dto.getIndent()>0){ %>
    	<img src="./storage/re.png" width="20px" height="20px">
    	<%} %>
    	<a href="javascript:read('<%=dto.getNo() %>')"
    	><%=dto.getTitle() %>
    	</a>
    	<% if (Utility.compareDay(dto.getWdate().substring(0, 10))){ %>
    	<img src="./storage/new.gif">
    	<% } %>
    	</Td>
    	<Td><%=dto.getWname() %></Td>
    	<Td><%=dto.getViewcnt() %></Td>
        <Td><%=dto.getWdate().substring(0,10) %></Td>    
        <Td>
        <%if(dto.getFname()==null){ 
        	out.print("파일 없음");
        }else{ %>
        	<a href="javascript:down('<%=dto.getFname() %>')">
    	<span class='glyphicon glyphicon-download-alt'></span>
    	</a>
       <% }%>
        
        </Td> 
    </tr>
 <%
     } //while 
   } //if
 %> 
    </TABLE>
    
  <DIV class='bottom'>
    <%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
  </DIV>
 </DIV>
 

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>