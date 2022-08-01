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
<style>
    *{box-sizing: border-box;}
    body{background-color:#fafafa;}

    #toNext:hover{
        cursor: pointer;
    }
    
    img{
        width: 100%;
        height: 150px;
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
            <div class="col-12">
                <div class="row m-auto p-4" style="background-color:white; height:815px; max-width:700px;">
                    <div class="col-12">
                    	<div class="row">
                            <div class="col-12">
                                <h3 style="font-weight:bold; padding:0px;"><span style="color:red;">판매</span>하시기 전에 꼭 확인하세요.</h3>
                            </div>
                        </div>
                        <div class="row mt-1">
                            <div class="col-6 col-sm-6 col-md-6 col-lg-6">
                               <img src="/upload/${sysNameOneImage}" style="width:85%; height:185px; object-fit:cover; margin-left:10px;">
                           </div>
                           <div class="col-6 col-sm-6 col-md-6 col-lg-6">
                               <br><br>
                                ${productDetail[0].brand } <br>
                                ${productDetail[0].name } <br>
                             <span style="font-size: 12px; color:#6E6E6E;">${productDetail[0].title}</span><br>
                             <span style="font-weight: bold;" id="sized">${sized }</span>
                           </div>
                        <br>
                        <div class="row">
                            <div class="col-12">
                                <hr style="height:5px; background-color:green;">
                            </div>
                            <div class="col-10">
                                판매하려는 상품이 맞습니다.<br>
                                <span style="font-size:14px; color:darkgrey;">상품 이미지, 모델번호, 상품명, 사이즈를 한 번 더 확인했습니다.</span>
                            </div>
                            <div class="col-2" style="display:flex; justify-content: center; align-items: center;">
                                <input type="checkbox" class="cb" id="cb1" style="zoom:2.4;">
                            </div>
                            <div class="col-12">
                                <hr>
                            </div>
                            <div class="col-10">
                                국내/해외에서 발매한 정품·새상품입니다.<br>
                                <span style="font-size:14px; color:darkgrey;">모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품·새상품입니다. 중고품 판매는 불가능합니다.</span>
                            </div>
                            <div class="col-2" style="display:flex; justify-content: center; align-items: center;">
                                <input type="checkbox" class="cb" id="cb2" style="zoom:2.4;">
                            </div>
                            <div class="col-12">
                                <hr>
                            </div>
                            <div class="col-10">
                                박스/패키지의 상태를 확인합니다.<br>
                                <span style="font-size:14px; color:darkgrey;">박스/패키지 상태에 따른 검수 기준을 확인했습니다.</span>
                            </div>
                            <div class="col-2" style="display:flex; justify-content: center; align-items: center;">
                                <input type="checkbox" class="cb" id="cb3" style="zoom:2.4;">
                            </div>
                            <div class="col-12">
                                <hr>
                            </div>
                            <div class="col-10">
                                이중 포장하여 선불 발송합니다.<br>
                                <span style="font-size:14px; color:darkgrey;">반드시 이중 포장하여 택배 상자에 담아 선불 발송합니다. 합배송은 권장하지 않으며 이로 인한 박스/패키지 훼손은 판매자의 책임입니다.</span>
                            </div>
                            <div class="col-2" style="display:flex; justify-content: center; align-items: center;">
                                <input type="checkbox" class="cb" id="cb4" style="zoom:2.4;">
                            </div>
                            <br>
                            <div class="col-12">
                                <hr>
                            </div>
                            <div class="col-10">
                                RESELLIUM의 최신 이용정책을 모두 확인하였으며, 구매를 계속합니다.<br>
                                <span style="font-size:14px; color:darkgrey;">건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 패널티, 부정거래 등의 이용정책을 확인했습니다.</span>
                            </div>
                            <div class="col-2" style="display:flex; justify-content: center; align-items: center;">
                                <input type="checkbox" class="cb" id="cb4" style="zoom:2.4;">
                            </div>
                            <br>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-12 text-center" id="toNext" onclick="toNext()" style="width:95%; height:50px; margin:0 auto; margin-top:10px; background-color:#ebebeb; border-radius:10px; font-size:1.5rem; color:white; display:flex; justify-content: center; align-items: center;">
                                판매 계속
                            </div>
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
    
       $(function(){
         if(${sized}=="0"){
            $("#sized").css("display","none")
         }
         
         if($(".cb:checked").length == 5) {
             $("#toNext").css("background-color", "black")
         }
      })
      
      $(".cb").on("change", function(){
            if($(".cb:checked").length == 5) {
                $("#toNext").css("background-color", "black")
            } else {
                $("#toNext").css("background-color", "#ebebeb")
            }
        })

        function toNext() {
            if($(".cb:checked").length < 5) {
                alert("안내사항을 모두 체크해주세요.")
            } else {
                location.href="/product/getSellChoice?parentSeq="+${parentSeq}+"&sized="+${sized}+"&buyPrice="+${buyPrice}+"&sellPrice="+${sellPrice}+"&releasePrice="+${releasePrice};      
            }
        }

    </script>



</body>
</html>