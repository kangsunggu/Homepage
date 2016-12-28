<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); 
	String root = request.getContextPath();
	/*----쿠키설정 내용시작----------------------------*/
	String c_id = "";     // ID 저장 여부를 저장하는 변수, Y, 저장되어질 변수
	String c_id_val = ""; // ID 값
	 
	Cookie[] cookies = request.getCookies(); 
	Cookie cookie=null; 
	 
	if (cookies != null){ 
	 for (int i = 0; i < cookies.length; i++) { 
	   cookie = cookies[i]; 
	 
	   if (cookie.getName().equals("c_id")){ //c_id로 저장된 아디가 있다면
	     c_id = cookie.getValue();     // Y c_id에다가 넣겠다는 의미
	   }else if(cookie.getName().equals("c_id_val")){ 
	     c_id_val = cookie.getValue(); // user1... 
	   } 
	 } 
	} 

	/*----쿠키설정 내용 끝----------------------------*/
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

</style> 
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
<br><br><br><br>
<FORM name='frm' method='POST' action='./loginProc.jsp'>
<div class="container">
<div class="row"> 
	<div class="col-lg-6 col-lg-offset-5">
로그인
  <TABLE>
    <TR>
      <TH class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span></TH>
      <TD><input type="text" class="form-control" name="id" value='<%=c_id_val %>'>
      <% 
       if (c_id.equals("Y")){  // id 저장 상태라면 
       %>   
         <input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장 
       <% 
       }else{ %> 
         <input type='checkbox' name='c_id' value='Y' > ID 저장 
       <% 
       } 
       %> 
      
      </TD>
    </TR>
    <TR>
      <TH><span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span></TH>
      <TD><input type="password" class="form-control" name="passwd"></TD>
    </TR>
  </TABLE>
    <input type='submit' value='로그인'>
    <input type='button' value='회원가입' onclick="location.href='./agreement.jsp'">
  </div>
  </div>
  </div>
</FORM>
 <br><br><br><br>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 