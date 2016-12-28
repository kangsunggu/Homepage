<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi.jsp" %>
<% 
	String id = request.getParameter("id");

	boolean flag = dao.duplicateId(id);
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function use(){
	//중복확인을 거쳐 사용을 누를때 그 아이디 값이 회원가입 아뒤로 값이 저장되는것
	opener.frm.id.value='<%=id%>';
	window.close(); //값이 저장되고 창이 꺼진다. 
}


</script> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 15px; 
} 
.h1{
  font-size: 15px;
  text-align: center;      
  margin: 20px auto; 
}
</style> 
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="h1">아이디 중복확인</DIV>
 <div class="content">
 입력된 ID:<%=id %><br><br>
 <%
 	if(flag){
 		out.print("중복된 아이디 입니다. 다시 입력하세요.<br><br>");
 	}else{
 		out.print("사용가능한 아이디입니다.<br><br>");
 		out.print("<input type='button' value='사용' onclick='use()'>");	
 		}
 %>
 
 
 </div>
 
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href='id_form.jsp'">
    <input type='button' value='닫기' onclick='window.close()'>
  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 