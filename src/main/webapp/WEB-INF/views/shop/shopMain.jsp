<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- favicon.ico 로그인 시 콘솔창에 뜨는 거 제거 -->
	<link rel="icon" href="data:,">
	<link rel="shortcut icon" type="image/x-icon" href="/images/logo.png">
	<title>Resellium | 리셀리움</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/navbar.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/shop.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>


<!-- Google Fonts -->
<!-- All -->
<link
href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Sans:ital,wght@0,500;0,600;0,700;1,800&display=swap"
rel="stylesheet"
/>

<!-- <link
href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&family=Noto+Sans:ital,wght@1,800&display=swap"
rel="stylesheet"
/> -->

<style>

  body{ overflow-x:hidden; }

  select {width: 150px; 
    padding: .8em .5em; 
    border: 1px solid #999;
    font-family: inherit;  
    background: url('arrow.jpg') no-repeat 95% 50%; 
    border-radius: 0px; 
    -webkit-appearance: none; 
    -moz-appearance: none;
    appearance: none;
    margin-left: 1140px !important;
}

/* img{ */
/*   width: 100%; */
/*   height: 100%; */
/*   border-radius: 15px; */
/*   object-fit: cover; */
/* } */

select::-ms-expand {
    display: none;
}

  
.btn-nobg {
    border: 1px solid #d3d3d3 !important;
    background-color: none;
    padding: 7px 25px !important;
    border-radius: 12px !important;
    font-size: 15px !important;
    color: #2d2d2d ;
    font-weight:bold;
  }
  
  .bookmark:hover{
     cursor:pointer;
  }
  
  p{
     text-align:center;
  }
  a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
/*  a:hover { color: black; text-decoration: none;} */
 .pgNation:hover {  text-decoration: underline; }
 
 .pgNation{
     display:inline-block; 
    width:40px;
    font-size:20px;
 }
  .pgNation{
   
    height: 35px;
    background:#FAFAFA;
/*     text-align: center; */
    border-radius: 5px;
/*     color: #2ECCFA !important; */
    font-weight: bold;
  }
  
  .BeAf{
     display:inline-block; 
     width:40px;
     height: 35px;
    background:#FAFAFA;
     font-weight: bold;
     border-radius: 5px;
     font-size:20px;
  }
</style>
</head>
<body>
      <!-- subNav -->
    <nav class="navbar navbar-expand-md navbar-light subNav">
      <div class="container-fluid">
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
          <ul class="navbar-nav">
          <c:if test="${loginId eq 'admin1234'}">
             <li class="nav-item">
             <a class="nav-link" href="/manager/main">관리자페이지</a>
           </li>
          </c:if>
            <li class="nav-item">
              <a class="nav-link" href="/member/myProduct">관심상품</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/member/myPage">마이페이지</a>
            </li>
            <li class="nav-item">
            	<c:choose>
					<c:when test="${isLoginOk != 1 }">
						 <a class="nav-link" href="/member/loginGo">로그인</a>
						 <!-- 로그인 실패시 -->
						<c:if test="${isLoginOk == 0 }">
							<script>
								Swal.fire({
									title : "로그인 실패",
									text : "아이디 또는 비밀번호를 다시 확인해주세요.",
									icon : "info"
								}).then(function() {
									location.href = "/member/loginGo"
								})
							</script>
						</c:if>
					</c:when>
					<c:otherwise>
						<a class="nav-link" href="/member/logout">로그아웃</a>
					</c:otherwise>
            	</c:choose>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- mainNav -->
    <nav class="navbar navbar-expand-md navbar-light mainNav">
      <div class="container-fluid">
        <a class="navbar-brand logo" href="/">Resellium</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end menu">
           <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="/style/toStyleMain">STYLE</a>
            </li>
            <li class="nav-item">
              <a class="nav-link curPage" href="/product/getProductListCate?category=신발&cpage=1">SHOP</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/about">ABOUT</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/event" id="event">EVENT</a>
            </li>
          </ul>
          <div class="d-flex" style="display:inline-block">
            <input class="form-control searchInput me-1 shadow-none" type=text placeholder="Search" aria-label="Search" />
          </div>
        </div>
      </div>
    </nav>
    
    <!-- md사이즈 mainNav -->
    <nav class="navbar navbar-expand-lg navbar-light mdMainNav d-block d-md-none">
      <div class="container-fluid p-0">
        <a class="navbar-brand logo ps-3" href="/">Resellium</a>
        <button class="navbar-toggler mdNavBtn shadow-none"type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation" >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end menu mdNavMenu" id="navbarNavDropdown">
           <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link p-3 pt-5" href="/style/toStyleMain">STYLE</a>
            </li>
            <li class="nav-item">
              <a class="nav-link p-3 curPage" href="/product/getProductListCate?category=신발&cpage=1">SHOP</a>
            </li>
            <li class="nav-item">
              <a class="nav-link p-3" href="/about">ABOUT</a>
            </li>
            <li class="nav-item">
              <a class="nav-link p-3" href="/event" id="event">EVENT</a>
            </li>
            <li class="nav-item">
              <c:choose>
					<c:when test="${isLoginOk != 1 }">
						 <a class="nav-link p-3" href="/member/loginGo">로그인</a>
						 <c:if test="${isLoginOk == 0 }">
							<script>
								Swal.fire({
									title : "로그인 실패",
									text : "아이디 또는 비밀번호를 다시 확인해주세요.",
									icon : "info"
								}).then(function() {
									location.href = "/member/loginGo"
								})
							</script>
						</c:if>
					</c:when>
					<c:otherwise>
						<a class="nav-link p-3" href="/member/logout">로그아웃</a>
					</c:otherwise>
            	</c:choose>
            </li>
          </ul>
          <div class="d-flex p-3" style="display:inline-block">
            <input class="form-control searchInput searchInputMD me-1 shadow-none" type="text" placeholder="Search" aria-label="Search" />
          </div>
        </div>
      </div>
    </nav>


<div class="container">
    <div class="row">
        <div class="col-12 mt-5 m-0">
            <h2 style="text-align: center; font-weight: bold;">SHOP</h2>
        </div>
        <div class="col-12 pdDiv categoryDiv mt-5 m-0">
            CATEGORY
        </div>
        <div class="col-12 categoryDiv mt-2 m-0" style="margin: 0px; padding:0px;">
            <button class="btn-nobg " id="luxury" >명품</button>
            <button class="btn-nobg  ms-2" id="shoes" >신발</button>
            <button class="btn-nobg  ms-2" id="clothes" >의류</button>
            <button class="btn-nobg  ms-2" id="tech" >테크</button>
            <button class="btn-nobg  ms-2" id="lego" >레고</button>
        </div>
    </div>
</div>
<!-- 상품 출력 -->
<div class="container">
  <div class="row mt-5 m-0 pdListDiv">
    <div class="col-12 pdDiv categoryDiv p-1" id="productTitle">Special Detail on Toe</div>
  </div>
 <div class="row pdList">
    <c:forEach var="i" items="${productList }"  varStatus="status">
   
    <div class="col-6 col-md-3">
      <div class="row p-3">
        <div class="col-12 pdImgDiv p-0">
         <a href="/product/getProductDetail?parentSeq=${i.seq }">
             <img src="/upload/${sysNameList[status.index] }" class="p-0 m-0" />
         </a>
        </div>
        <div class="col-12 ps-1">
          <div class="row">
             <div class="col-9 pdBrand ps-4">
               <a href="/product/getProductDetail?parentSeq=${i.seq }">${i.brand}</a>
             </div>
             <div class="col-3 text-end">
              
              <img src="/icon/bookmark.png" class="bookmark mark${i.seq }" value="${i.seq }"/>
              <input type="hidden" class="input${i.seq }" value="emp">
             <c:forEach items="${wishList }" var="w">
             
                <c:if test="${w.parentSeq eq i.seq }">
                   <script>
                   $(".mark${i.seq}").attr("src","/icon/bookmark-full.png")
                   $(".input${i.seq}").val("full")
                   </script>
                   
                </c:if>
             

             </c:forEach>
             
            

            </div>
          </div>
        </div>
        <a href="/product/getProductDetail?parentSeq=${i.seq }">
           <div class="col-12 ps-1 pdName">${i.title}</div>
           <div class="col-12 ps-1 pdName">${i.name}</div>
           <div class="col-12 ps-1 pdPrice">${i.formedPrice }원</div>
           
        </a>
      </div>
    </div>
    
    </c:forEach>
 </div>

  <div class="row mt-5 m-0 text-center">
    <input type="hidden" id="shoesInput" value="4">
         <!-- Navi Page -->
      <div class="row w-100 mb-3">
         <div class="col text-center">${navi }</div><br><br><br>
      </div>
  </div>
</div>

<!-- footer -->
    <div class="container-fluid footer">
      <div class="row p-5">
        <div class="col-6">
          <div class="row">
            <div class="col-12 mb-3 m-0 cs">고객센터&nbsp;&nbsp;1588-0410</div>
            <div class="col-12 footerDatas">
              운영시간 평일 10:00 - 17:00 (토/일, 공휴일 휴무)
            </div>
            <div class="col-12 mb-3 m-0 footerDatas">
              점심시간 평일 13:00 - 14:00
            </div>
            <div class="col-12 mb-2 m-0 footerDatas">
              1:1 문의로 빠른 상담이 가능합니다.
            </div>
            <div class="col-12"><button class="faqBtn">FAQ</button></div>
          </div>
        </div>
        <div class="col-6">
          <div class="row">
            <div class="col-12 mb-3 m-0 footerDatas">이용안내</div>
            <div class="col-12 mb-3 m-0 footerDatas">공지사항</div>
            <div class="col-12 mb-3 m-0 footerDatas">회사소개</div>
          </div>
        </div>
      </div>
    </div>

  <script>
  // navibar 검색
  $(".searchInput").on("keydown",function(e){
     
     console.log($(".searchInput").val())
     if(e.keyCode==13){
        if($(".searchInput").val().replace(/\s|　/gi, "").length == 0){
           location.reload();
        }else{
           location.href="/product/getProductSearch?title="+$(".searchInput").val();
        }
     }
  })
  $(".searchInputMD").on("keydown",function(e){
     
     console.log($(".searchInputMD").val())
     if(e.keyCode==13){
        if($(".searchInputMD").val().replace(/\s|　/gi, "").length == 0){
           location.reload();
        }else{
           location.href="/product/getProductSearch?title="+$(".searchInputMD").val();
        }
     }
  })  

//       $(".releasePrice").text($(".releasePrice").text().replace(/\B(?=(\d{3})+(?!\d))/g,',')+"원") 
       
       $(function(){
          if("${category}" !="null" ){
             if($("#luxury").text()=="${category}"){
                  $("#luxury").css("background-color","#FFE0DC");
                  $("#luxury").css("color","#f15746");
                  $("#luxury").css("font-weight","bold");
                  $("#productTitle").text("Luxury");
             }else if($("#shoes").text()=="${category}"){
                   $("#shoes").css("background-color","#FFE0DC");
                   $("#shoes").css("color","#f15746");
                   $("#shoes").css("font-weight","bold");
                   $("#productTitle").text("Shoes")
             }else if($("#clothes").text()=="${category}"){
                   $("#clothes").css("background-color","#FFE0DC");
                   $("#clothes").css("color","#f15746");
                   $("#clothes").css("font-weight","bold");
                   $("#productTitle").text("clothes")
             }else if($("#tech").text()=="${category}"){
                   $("#tech").css("background-color","#FFE0DC");
                   $("#tech").css("color","#f15746");
                   $("#tech").css("font-weight","bold");
                   $("#productTitle").text("Tech")
             }else if($("#lego").text()=="${category}"){
                   $("#lego").css("background-color","#FFE0DC");
                   $("#lego").css("color","#f15746");
                   $("#lego").css("font-weight","bold");
                   $("#productTitle").text("Lego")
             }
          }
          
          if("${category}" =="all"){
             $(".categoryDiv").css("display","none");
          }
       })

     
    
         $("#luxury").on("click",function(){
         $(".btn-nobg").css("background-color","#f0f0f0")
         
       $(".btn-nobg").css("color","black")  
        $(this).css("background-color","#FFE0DC");
        $(this).css("color","#f15746");
        $(this).css("font-weight","bold");
        
        location.href="/product/getProductListCate?category="+$(this).text()+"&cpage=1";

       })
       
       $("#shoes").on("click",function(){
       $(".btn-nobg").css("background-color","#f0f0f0")
       
       $(".btn-nobg").css("color","black")  
        $(this).css("background-color","#FFE0DC");
        $(this).css("color","#f15746");
        $(this).css("font-weight","bold");
        
        location.href="/product/getProductListCate?category="+$(this).text()+"&cpage=1";
       })
       
       $("#clothes").on("click",function(){
       $(".btn-nobg").css("background-color","#f0f0f0")
       
       $(".btn-nobg").css("color","black")  
       $(this).css("background-color","#FFE0DC");
        $(this).css("color","#f15746");
        $(this).css("font-weight","bold");
        
        location.href="/product/getProductListCate?category="+$(this).text()+"&cpage=1";
       })
       
       $("#tech").on("click",function(){
       $(".btn-nobg").css("background-color","#f0f0f0")  
       
       $(".btn-nobg").css("color","black")  
        $(this).css("background-color","#FFE0DC");
        $(this).css("color","#f15746");
        $(this).css("font-weight","bold");
        
        location.href="/product/getProductListCate?category="+$(this).text()+"&cpage=1";
       })
       
       $("#lego").on("click",function(){  
       $(".btn-nobg").css("background-color","#f0f0f0")  
       
       $(".btn-nobg").css("color","black")  
        $(this).css("background-color","#FFE0DC");
        $(this).css("color","#f15746");
        $(this).css("font-weight","bold");
        
        location.href="/product/getProductListCate?category="+$(this).text()+"&cpage=1";
       })
       
       $(".bookmark").on("click",function(){
          
//           console.log("val값"+$(this).attr("value"))
//            console.log("형제 input val값"+$(this).siblings("input").val())
          if($(this).siblings("input").val()=="emp"){
               $.ajax({
               url: "/product/enrollWishList",
               data : {parentSeq :   $(this).attr("value") }
               
            }).done(function(scc){
               if(scc="success"){
                  location.reload();
               }else{
                  alert("관심상품 등록 실패")
               }
            })

          }
          
         
          if($(this).siblings("input").val()=="full"){
                $.ajax({
                  url: "/product/deleteWishList",
                  data : {parentSeq :   $(this).attr("value") }
                  
               }).done(function(scc){
                  if(scc="success"){
                     location.reload();
                  }else{
                     alert("관심상품 해제 실패")
                  }
               })
          }
//          location.href="/product/enrollWishList?parentSeq="+$(this).val();
      })
      
      
      window.onpageshow = function(event) {
         if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
         // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
            location.reload();
              }
         }

  </script>
</body>
</html>