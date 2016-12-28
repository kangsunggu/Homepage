<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%
	String root = request.getContextPath();
	String id=(String)session.getAttribute("id");
	String grade=(String)session.getAttribute("grade");
	System.out.println("id: "+id);
	System.out.println("grade: "+grade);
	
	String str=null;
	if(id!=null){
		str = id+"님!";
	}else{
		str="";
	}
%>
<!DOCTYPE html> 
<html> 
<head> 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title></title> 
<script>
$(document).ready(function(){
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip(); 
  
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {

      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
})





</script>
<link href="../css/style.css" rel="stylesheet" type="text/css">

</head> 

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">

        <li><a href="<%=root%>/index.jsp">홈</a></li>
        <li><a href="<%=root%>/home/list.jsp">게시판</a></li>
        <li><a href="<%=root%>/bbs/list.jsp">bbs게시판</a></li>
        <li><a href="<%=root%>/images/list.jsp">이미지게시판</a></li>
        
        <%if(id==null){%>
  		<li><a href="<%=root%>/member/agreement.jsp" >회원가입</a></li>
        <li><a href="<%=root%>/member/loginForm.jsp">로그인</a></li>
        <%}else if(id!=null && grade.equals("H")){ %>
        <li><a href="<%=root%>/member/logout.jsp">로그아웃</a></li>
        <%} %>
        <%if(id!=null && grade.equals("A")){ %>
        <li><a href="<%=root%>/admin/list.jsp">회원목록</a></li>
        <li><a href="<%=root%>/member/logout.jsp">로그아웃</a></li>
        <%} %>
        <li><a href="<%=root%>/member/read.jsp"><%=str %></a></li>
        
       </ul>
    </div>
  </div>
</nav>

