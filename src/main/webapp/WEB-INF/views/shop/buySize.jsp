<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon.ico 로그인 시 콘솔창에 뜨는 거 제거 -->
<link rel="icon" href="data:,">
<link rel="shortcut icon" type="image/x-icon" href="/images/logo.png">
<title>Resellium | 리셀리움</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- Bootstrap -->
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
rel="stylesheet"
/>
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
     *{box-sizing: border-box;}
    body{background-color:#fafafa;}

    #toNext:hover{
        cursor: pointer;
    }
    img{
        width: 100%;
        height: 200px;
    }

    .sizeBtn{
        background-color: #ffffff;
        width: 100%;
        height: 50px;
        border-color: #E6E6E6;
        border-radius: 12px;
        font-size: 15px;
    }

    .priceSpan{
        font-size: 12px;
        margin: 0px;
    }
  
/* .btn-nobg { */
/*     border: 1px solid #d3d3d3 !important; */
/*     background-color: none; */
/*     padding: 7px 25px !important; */
/*     border-radius: 12px !important; */
/*     font-size: 15px !important; */
/*     color: #2d2d2d ; */
/*   } */
  
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
            <div class="col-12">
                <div class="row m-auto mt-5 p-4" style="background-color:white; height:700px; max-width:700px;">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-12" style="text-align: center;">
                                <h3 style="font-weight:bold; padding:0px;"><span style="color:black">구매하기</span></h2>
                            </div>
                        </div>
                        <br><br>
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-6 col-sm-6 col-md-6 col-lg-6">
                                        <img src="/upload/${sysNameOneImage}">
                                    </div>
                                    <div class="col-6 col-sm-6 col-md-6 col-lg-6">
                                        <br><br>
                                        ${productDetail[0].brand } <br>
                                         ${productDetail[0].name } <br>
                                        <br>
                                        <span style="font-size: 12px;">${productDetail[0].title }</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-12">
                                <hr style="height:5px; background-color:#D8D8D8;">
                            </div>
                        
                        <div class="row mt-3 m-0">
                          <c:forEach var="price" items="priceList" >
                            <div class="col-4" style="text-align: center;">
                                 <button class="sizeBtn" value="230">230<br><span class="priceSpan">${price}</span></button>
                            </div>
                          </c:forEach>
                            <div class="col-4" style="text-align: center;">
                                <button class="sizeBtn" value="235">235<br><span class="priceSpan">${buy_bid.price}(min)</span></button>
                            </div>
                            <div class="col-4" style="text-align: center;">
                                <button class="sizeBtn" value="240">240<br><span class="priceSpan">${buy_bid.price}(min)</span></button>
                            </div>
                        </div>
                        <div class="row mt-3 m-0">
                            <div class="col-4" style="text-align: center;">
                                <button class="sizeBtn" value="245">245<br><span class="priceSpan">${buy_bid.price}(min)</span></button>
                            </div>
                            <div class="col-4" style="text-align: center;">
                                <button class="sizeBtn" value="250">250<br><span class="priceSpan">${buy_bid.price}(min)</span></button>
                            </div>
                            <div class="col-4" style="text-align: center;">
                                <button class="sizeBtn" value="255">255<br><span class="priceSpan">${buy_bid.price}(min)</span></button>
                            </div>
                        </div>
                        <div class="row mt-3 m-0">
                            <div class="col-4" style="text-align: center;">
                                <button class="sizeBtn" value="260">260<br><span class="priceSpan">${buy_bid.price}(min)</span></button>
                            </div>
                            <div class="col-4" style="text-align: center;">
                                <button class="sizeBtn" value="265">265<br><span class="priceSpan">${buy_bid.price}(min)</span></button>
                            </div>
                            <div class="col-4" style="text-align: center;">
                                <button class="sizeBtn" value="270">270<br><span class="priceSpan">${buy_bid.price}(min)</span></button>
                            </div>
                        </div>
                        <div class="row mt-3 m-0">
                            <div class="col-4" style="text-align: center;">
                                <button class="sizeBtn" value="275">275<br><span class="priceSpan">${buy_bid.price}(min)</span></button>
                            </div>
                            <div class="col-4" style="text-align: center;">
                                <button class="sizeBtn" value="280">280<br><span class="priceSpan">구매입찰</span></button>
                            </div>
                            <div class="col-4" style="text-align: center;">
                                <button class="sizeBtn" value="285">285<br><span class="priceSpan">${buy_bid.price}(min)</span></button>
                            </div>
                        </div>
                        <br>

                        <div class="row mt-3 m-0">
                            <div class="col-12 text-center" id="toNext"  style="width:95%; height:50px; margin:0 auto; background-color:#ebebeb; border-radius:10px; font-size:1.5rem; color:white; display:flex; justify-content: center; align-items: center;">
                                구매 계속
                            </div>
                            <input type="hidden" id="inputSize" value="">
                        </div>
                        

                    	</div>
                	</div>
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
        $(".sizeBtn").on("click",function(){
            $(".sizeBtn").css("border-color","#E6E6E6")
            $(this).css("border-color","black");
            $("#inputSize").val($(this).val());
            $("#toNext").css("background-color","black")
            $("#toNext").css("color","white")
        })

        if($(".priceSpan").text()!="구매입찰"){
            $(".priceSpan").css("color","red")
        }else if($(".priceSpan").text()=="구매입찰"){
            $(".priceSpan").css("color","black")
        }

       

        $("#toNext").on("click",function(){
            if($("#inputSize").val()==""){
                alert("사이즈를 하나 이상 클릭해주세요")
                return false;
            }
            location.href="/product/getBuyCheck";
        })



    </script>
</body>
</html>