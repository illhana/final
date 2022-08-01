<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- favicon.ico 로그인 시 콘솔창에 뜨는 거 제거 -->
<link rel="icon" href="data:,">
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- favicon.ico 로그인 시 콘솔창에 뜨는 거 제거 -->
<link rel="icon" href="data:,">
<link rel="shortcut icon" type="image/x-icon" href="/images/logo.png">
<title>Resellium | 리셀리움</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css?ver=1" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/navbar.css?ver=1" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/home.css?ver=1" />
<!-- Google Fonts -->
<!-- All -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Sans:ital,wght@0,500;0,600;0,700;1,800&display=swap"
	rel="stylesheet" />
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<!--  jQuery CDN  -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	body{overflow-x:hidden;}
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
              <a class="nav-link" href="/product/getProductListCate?category=신발&cpage=1">SHOP</a>
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
              <a class="nav-link p-3" href="/product/getProductListCate?category=신발&cpage=1">SHOP</a>
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

<!-- purchaseEnd -->
      <div class="container-menu">
         <div class="row p-5">
            <div class="col-6" style="height: auto; width: 250px;">
               <div class="row" style="margin-bottom: 50px;">
                  <div class="col-12 mb-2 m-0 " style="color: #bebebe;">
                     <a href="/member/purchaseBid"
                        style="text-decoration: none; color: black;">구매내역</a>
                  </div>
                  <div class="col-12 mb-2 m-0 " style="color: #bebebe;">
                     <a href="/member/saleBid" style="text-decoration: none; color: black;">판매내역</a>
                  </div>
                  <div class="col-12 mb-2 m-0 " style="color: #bebebe;">
                     <a href="/member/myProduct"
                        style="text-decoration: none; color: black; font-weight: bold;">관심상품</a>
                  </div>
                  <div class="col-12 mb-2 m-0 " style="color: #bebebe;">
                     <a href="/member/myPageDetail"
                        style="text-decoration: none; color: black;">프로필정보</a>
                  </div>
               </div>
            </div>
            <div class="col-9 sm-12">
               <div class="row">
                  <h3 style="font-weight: bold;">관심상품</h3>
                  <div class="col-12 mb-3 m-0"
                     style="width: 948px; height: 10px; min-width: 400px; border-top: solid 4px black;">
                  </div>
                  <c:forEach var="i" items="${wList }" varStatus="status">
                  <div class="row p-0 m-auto">
                     <div class="col-12" style="width: 948px; height: 150px; min-width: 400px; border: solid 1px #dcdcdc;">
                        <a style="text-decoration: none; color: black;" href="/product/getProductDetail?parentSeq=${wList[status.index].parentSeq }">
                        <div class="row">
                           <div class="col-2" style="min-width: 150px;">
                              <img src="/upload/${sList[status.index] }"
                                 style="width: 120px; height: 120px; object-fit: cover; margin-top: 15px;">
                           </div>
                           <div class="col-6" style="margin-top: 15px; min-width: 235px;">
                              <span style="font-weight: bold;">${pList[status.index].brand }</span><br> <span>
                                 ${pList[status.index].title }</span><br> <span>${pList[status.index].name }</span>
                           </div>
                        </div>
                        </a>
                     </div>
                  </div>
                  </c:forEach>
               </div>
            </div>
         </div>

   <!-- footer -->
   <div class="container-fluid footer">
      <div class="row p-5">
         <div class="col-6">
            <div class="row">
               <div class="col-12 mb-3 m-0 cs">고객센터&nbsp;&nbsp;1588-0410</div>
               <div class="col-12 footerDatas">운영시간 평일 10:00 - 17:00 (토/일,
                  공휴일 휴무)</div>
               <div class="col-12 mb-3 m-0 footerDatas">점심시간 평일 13:00 -
                  14:00</div>
               <div class="col-12 mb-2 m-0 footerDatas">1:1 문의로 빠른 상담이
                  가능합니다.</div>
               <div class="col-12">
                  <button class="faqBtn btn">FAQ</button>
               </div>
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
//       console.log("${fn:length(pList) }")
   let countEnd = "${fn:length(pList) }";
   $("#countEnd").text(countEnd)
   
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
   </script>
</body>
</html>
