<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
	String grade=(String)session.getAttribute("grade");
	String id = request.getParameter("id");
	if(id==null){
		id = (String)session.getAttribute("id");
	}
	MemberDTO dto = dao.read(id);
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function updateFile(){
	var url = "updateFileForm.jsp";
	url+="?id=<%=id%>";
	url+="&oldfile=<%=dto.getFname()%>";
	//oldfile은 fname이 겹치니깐 임의로 지정해준 이름이다.
 	location.href=url;
	
}
function updatePw(){
	var url = "updatePwForm.jsp";
	url+="?id=<%=id%>";
	location.href=url;
}
function update(){
	var url = "updateForm.jsp";
	url+="?id=<%=id%>";
	location.href=url;
}
function mlist(id){
	var url = "<%=root%>/admin/list.jsp";
	url+="?id=<%=id%>";
	url+="&col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
}

</script> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
.img1{
	width: 250px;
	height: 200px;
}
</style> 
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"><%=dto.getMname() %>회원정보</DIV>
 

  <TABLE>
    <TR>
      <Td colspan="2">
      <img class="img1" src="./storage/<%=dto.getFname() %>">
      </Td>
    </TR>
    <TR >
    <TH width="15px">아이디</TH>
      <TD width="30px"><%=dto.getId() %></TD>
    </TR>
    
    <TR>
      <TH>성명</TH>
      <TD><%=dto.getMname() %></TD>
    </TR>
    <TR>
      <TH>전화번호</TH>
      <TD><%=dto.getTel() %></TD>
    </TR>
    <TR>
      <TH>이메일</TH>
      <TD><%=dto.getEmail() %></TD>
    </TR>
    <TR>
      <TH>우편번호</TH>
      <TD><%=dto.getZipcode() %></TD>
    </TR>
    <TR>
      <TH>주소</TH>
      <TD><%=dto.getAddress1() %>
      	  <%=Utility.checkNull(dto.getAddress2()) %>
      </TD>
    </TR>
    <TR>
      <TH>직업</TH>
      <TD>
      		직업코드:<%=dto.getJob() %>
      		(<%=Utility.getCodeValue(dto.getJob()) %>)
      </TD>
    </TR>
    <TR>
      <TH>날짜</TH>
      <TD><%=dto.getMdate() %></TD>
    </TR>
    
  </TABLE>
  
  <%if(id!=null && grade.equals("A")){ %>
  <DIV class='bottom'>
    <input type='button' value='정보수정' onclick="update()">
	<input type='button' value='사진수정' onclick="updateFile()">
	<input type='button' value='패스워드변경' onclick="updatePw()">
  	<input type='button' value='목록' onclick="mlist()">  
  </DIV>
	<%}else if(id!=null && grade.equals("H")){ %>
	<DIV class='bottom'>
    <input type='button' value='정보수정' onclick="update()">
	<input type='button' value='사진수정' onclick="updateFile()">
	<input type='button' value='패스워드변경' onclick="updatePw()">
  </DIV>
 <%} %>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 