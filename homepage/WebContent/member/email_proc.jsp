<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi.jsp" %>
<% 
	String email = request.getParameter("email");

	boolean flag = dao.duplicateEmail(email);
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function use(){
	opener.frm.email.value='<%=email%>';
	window.close();
	
}

</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">이메일 중복확인</DIV>
 <div class="content">
 입력된 ID:<%=email %><br><br>
 <%
 	if(flag){
 		out.print("중복된 이메일입니다. 다시 입력하세요.<br><br>");
 	}else{
 		out.print("사용가능한 이메일입니다.<br><br>");
 		out.print("<input type='button' value='사용' onclick='use()'>");	
 		}
 %>
 
 
 </div>
 
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href='email_form.jsp'">
    <input type='button' value='닫기' onclick='window.close()'>
  </DIV>

 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 