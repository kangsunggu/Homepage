
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%

	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	
	int no = Integer.parseInt(request.getParameter("no"));
	
	idao.upViewcnt(no);
	
	ImagesDTO dto= idao.read(no);
	
	String content= dto.getContent();
	content= content.replaceAll("\r\n","<br>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>read</title>

<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

/* div { */
/* 	text-align: center; */
/* 	margin-top: 20px; */
/* 	margin-bottom: 20px; */
/* } */

/* table { */
/* 	width: 60%; */
/* 	margin: auto; */
/* } */

/* table, th, td { */
/* 	border: 1px solid black; */
/* 	border-collapse: collapse; */
/* } */

/* th, td { */
/* 	padding: 10px; */
/* } */
#img {
	width: 200px;
}

#ftd {
	text-align: center;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function readGo(no){
	var url = "./read.jsp";
	url = url +"?no="+no;
	
	location.href=url;
}
function down(fname){
	var url = "<%=root%>/download";
	url += "?dir=/images/storage";
	url += "&filename="+fname;	
	
	location.href = url;
	
}
function update(){
	var url= "updateForm.jsp";
	url+="?no=<%=no%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+= "&nowPage=<%=nowPage%>";
	location.href=url;
}
function reply(){
	var url= "replyForm.jsp";
	url+="?no=<%=no%>";		
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+= "&nowPage=<%=nowPage%>";
	location.href=url;		
}
function idelete(){
	var url= "deleteForm.jsp";
	url+="?no=<%=no%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+= "&nowPage=<%=nowPage%>";
	url+= "&oldfile=<%=dto.getFname()%>";
		location.href = url;
	}
</script>
</head>
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
	<!-- *********************************************** -->

	<DIV class="title">조회</DIV>

	<table>
		<tr>
			<td colspan="2" id="ftd">
				<img id="img" src='<%=root%>/images/storage/<%=dto.getFname()%>'>
			</td>
		</tr>
		<TR>
			<TH>제목</TH>
			<TD><%=dto.getTitle()%></TD>
		</TR>
		<TR>
			<TH>내용</TH>
			<TD><%=dto.getContent()%></TD>
		</TR>
		<TR>
			<TH>성명</TH>
			<TD><%=dto.getWname()%></TD>
		</TR>
		<TR>
			<TH>조회수</TH>
			<TD><%=dto.getViewcnt()%></TD>
		</TR>
		<TR>
			<TH>등록날짜</TH>
			<TD><%=dto.getWdate().substring(0, 10)%></TD>
		</TR>
		<TR>
			<TH>파일</TH>
			<TD>
				<%
					if (dto.getFname() == null) {
						out.print("파일없음");
					} else {
				%>
				<a href="javascript:down('<%=dto.getFname()%>')">
				<%=dto.getFname()%>
				 <span class="glyphicon glyphicon-download-alt"></span>
				</a>
				<%
					}
				%>

			</TD>
		</TR>
	</TABLE>
	<br>
	<TABLE>
		<TR>
			<%
				List list = idao.imgRead(no);
				String[] files = (String[]) list.get(0);
				int[] noArr = (int[]) list.get(1);
				for (int i = 0; i < 5; i++) {
					if (files[i] == null) {
			%>
			<td>
				<img src="<%=root%>/images/storage/noimage.png" width="100px" height="100px">
			</td>
				<%
					} else {
							if (noArr[i] == no) {
				%>
			
			<td class="td_padding">
				<a href="javascript:readGo('<%=noArr[i]%>')"> <img class="curImg" src="<%=root%>/images/storage/<%=files[i]%>" width="100px" height="100px" border="0">
				</a>
			</td>
			<%
				} else {
			%>
			<td class="td_padding">
				<a href="javascript:readGo('<%=noArr[i]%>')"> <img src="<%=root%>/images/storage/<%=files[i]%>" width="100px" height="100px" border="0">
				</a>
			</td>
			<%
				}
					}
				}
			%>
		</TR>
	</TABLE>

	<DIV class='bottom'>
		<input type='button' value='목록' onclick="location.href='./list.jsp'">
		<input type='button' value='수정' onclick="update()">
		<input type='button' value='답변' onclick="reply()">
		<input type='button' value='삭제' onclick="idelete()">
	</DIV>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>

