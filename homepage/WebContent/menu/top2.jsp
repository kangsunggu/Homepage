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
  <script type="text/javascript" src="<%=root %>/menu/httpRequest.js"></script>
    <script type="text/javascript">
    var checkFirst = false;
    var lastKeyword = '';
    var loopSendKeyword= false; // 억지로 만든것 
function startSuggest(){
if(checkFirst == false){
//0.5초 후에 sendKeyword() 함수를 실행

setTimeout("sendKeyword();",500);

loopSendKeyword = true;
}
checkFirst = true;
    }
    //요청 전송
    function sendKeyword() {
        // log("키가 눌렸습니다.");
        if(loopSendKeyword == false) return; //false일때 리턴되서 빠져 나온다
        var keyword = document.search.keyword.value; //입력된 값을 가지고 간다
        if (keyword == '') { //비어있다면
             lastKeyword = ''; //값이없으면
            hide('suggest');  // suggest DIV 태그 감추기
        } else if (keyword != lastKeyword) { // 새로운 키워드 입력 여부 검사
            lastKeyword = keyword; // 새로운 키를 전역변수로 저장
            // 한글이나 특수문자를 UTF-8문자셋으로 변경
            var params = "keyword="+encodeURIComponent(keyword);
            // 요청 전송, 서블릿 주소 지정
            sendRequest("<%=root%>/team", params, response, 'post');
        }
        setTimeout("sendKeyword();",500); //0.5초마다 읽어드린다
    }
 
    // 결과 출력
    function response() {
        if (httpRequest.readyState == 4) {
            if (httpRequest.status == 200) {
            
                // 응답 문자열 추출
                var resultText = httpRequest.responseText;
                
                //  3|자바001,자바002,자바003
                var result = resultText.split('|');
                
                // 갯수, 문자열을 정수로 변환
                var count = parseInt(result[0]);
                
                var keywordList = null;
                
                if (count > 0) {
                    // ,를 구분한 1차원 배열 생성
                    keywordList = result[1].split('#');
                    
                    var html = '';
                    html += "등록된 침 목록(선택하세요.)<br>";
 
                  //  alert('keywordList.length: ' + keywordList.length);
                    for (var i = 0 ; i < keywordList.length ; i++) {
                    
                        //log("keywordList[i]: " + keywordList[i]); 
 
                        // 특수 문자 표현: " --> \", \ --> \\            
                        html += "<a href=\"javascript:select('"+keywordList[i]+"')\">"+keywordList[i]+"</a><br>";
                        // alert(html);
                    }
                    
                    // 목록을 출력할 DIV 태그
                    var listView = document.getElementById('suggestList');
                    
                    // DIV 태그 값 저장
                    listView.innerHTML = html;
                    
                    // 목록을 가지고 있는 DIV 태그 출력
                    show('suggest');
                } else {
                    hide('suggest');
                }
            } else {
                alert("에러 발생: "+req.status);
            }
        }
    }
    
    //검색된 함목을 클릭하면 검색어를 keyword 태그에 출력하고
    //검색 목록은 숨겨 버립니다.
    function select(selectedKeyword) {
        document.search.keyword.value = selectedKeyword;
        
        loopSendKeyword = false;
        checkFirst=false;
        
        hide('suggest');
    }
 
    function frmSend(f){
        f.submit();
    }        
    
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
        <li>
        <form name="search" action="./suggest_proc.jsp" method="post">
<input type="text" name="keyword" id="keyword" 
        onkeydown="startSuggest()" size="70"/>
<input type="button" value="검색" onclick="javascript:frmSend(this.form);"/>
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<!-- 서버로부터 검색된 목록 출력 -->
<div id="suggest" style="display:none; postion: absolute; left: 0px; top: 30px; color:#000000; background:#EAEAEA; width:500px">
    <div id="suggestList"></div>
</div>
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
        </form>
        </li>
       </ul>
    </div>
  </div>
</nav>

