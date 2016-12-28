<%@ page contentType="text/html; charset=UTF-8" %> 


<link href="./css/style.css" rel="stylesheet" type="text/css">

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="./menu/images/img2.jpg" alt="New York" width="1000" height="500">
        <div class="carousel-caption">
          <h3></h3>
          <p></p>
        </div>      
      </div>

      <div class="item">
        <img src="./menu/images/img1.jpg" alt="Chicago" width="1000" height="500">
        <div class="carousel-caption">
          <h3></h3>
          <p></p>
        </div>      
      </div>
    
      <div class="item">
        <img src="./menu/images/img5.jpg" alt="Los Angeles" width="1000" height="500">
        <div class="carousel-caption">
          <h3></h3>
          <p></p>
        </div>      
      </div>
    </div>
    
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<!-- Container (The Band Section) -->
<div id="band" class="container text-center">
  <h3>성구사이트</h3>
  <p><em></em></p>
  <p>인사 소개글</p>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <p class="text-center"><strong>인사</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="bandmember.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p>안녕하세요</p>
        <p>저는 서울특별시 종로구 와룡동에 사는 강성구입니다.</p>
        <p>Born 1992</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>취미</strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="bandmember.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p>취미:운동과 영화감상</p>
        <p>저는 어렸을 때부터 영화를 보는 것을 좋아했고, 운동은 군대에서부터 시작하게 되었습니다.</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>미래 계획</strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="bandmember.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
        <p>자유여행</p>
        <p></p>
        <p></p>
      </div>
    </div>
  </div>
</div>



 

 