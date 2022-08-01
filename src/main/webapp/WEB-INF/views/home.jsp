<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
  	<!-- favicon.ico 로그인 시 콘솔창에 뜨는 거 제거 -->
  	<link rel="icon" href="data:,">
  	<link rel="shortcut icon" type="image/x-icon" href="/images/logo.png">
  	
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- favicon.ico 로그인 시 콘솔창에 뜨는 거 제거 -->
	<link rel="icon" href="data:,">
	<link rel="shortcut icon" type="image/x-icon" href="/images/logo.png">
	<title>Resellium | 리셀리움</title>
    <!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/navbar.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/home.css" />
    <!-- Google Fonts -->
    <!-- All -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Sans:ital,wght@0,500;0,600;0,700;1,800&display=swap" rel="stylesheet" />
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!--  jQuery CDN  -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- SweetAlert CDN -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
 .bookmark:hover{
    cursor:pointer;
 }
 
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}

</style>
  </head>
  <body>
  
      <!-- subNav -->
    <nav class="navbar navbar-expand-md navbar-light subNav">
      <div class="container-fluid">
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
          <ul class="navbar-nav">
          <c:if test="${loginId eq 'admin1234' || loginId eq 'admin12345' || loginId eq 'admin123456'}">
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
					  <c:if test="${isLoginOk == 2 }">
	                     <script>
	                        alert("이용약관에 위배되어 이용정지된 계정입니다. 관리자에게 문의하세요. Tel: 02-123-4567 / Email: admin@resellium.com")
	                        location.href = "/member/logout"
	                     </script>
	                  </c:if>
	                  <c:if test="${isLoginOk == 3 }">
	                     <script>
	                        alert("이미 탈퇴된 회원입니다.")
	                        location.href = "/member/logout"
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
           <ul class="navbar-nav pt-4">
	         <c:if test="${loginId eq 'admin1234' || loginId eq 'admin12345' || loginId eq 'admin123456'}">
	         	<li class="nav-item">
	            	<a class="nav-link p-3" href="/manager/main">관리자페이지</a>
	         	</li>
	         </c:if>
            <li class="nav-item">
              <a class="nav-link p-3" href="/style/toStyleMain">STYLE</a>
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

    
    
    <!-- Carousel -->
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2" ></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"aria-label="Slide 3" ></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"aria-label="Slide 4" ></button>
      </div>
      <div class="carousel-inner"> -->
        <div class="carousel-item active">
          <img src="/images/mainBanner_01.png" class="d-block w-100" />
        </div>
        <div class="carousel-item">
          <img src="/images/mainBanner_02.png" class="d-block w-100" />
        </div>
        <div class="carousel-item">
          <img src="/images/mainBanner_03.png" class="d-block w-100" />
        </div>
        <div class="carousel-item">
          <img src="/images/mainBanner_04.png" class="d-block w-100" />
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next" >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>

    <!-- 카테고리 -->
    <div class="container">
      <div class="row pCategoryDiv mt-3 m-0">
        <div class="col pCategory text-center">
           <a href="/product/getProductListCate?category=명품&cpage=1" style="width:100%; height:100%;">
                <img src="/icon/brand.png"/>
                <p  align="center" class="pCategoryName mt-1 pb-0">명품</p>
           </a>  
        </div>

        <div class="col-4 col-md pCategory text-center">
           <a href="/product/getProductListCate?category=신발&cpage=1" style="width:100%; height:100%;">
                <img src="/icon/shoes.png" />
                <p align="center" class="pCategoryName mt-1">신발</p>
             </a>
        </div>

        <div class="col-4 col-md pCategory text-center">
           <a href="/product/getProductListCate?category=의류&cpage=1" style="width:100%; height:100%;">
                <img src="/icon/clothes.png" />
                <p align="center" class="pCategoryName mt-1">의류</p>
             </a>
        </div>

        <div class="col-4 col-md pCategory text-center">
             <a href="/product/getProductListCate?category=테크&cpage=1" style="width:100%; height:100%;">
                <img src="/icon/tech.png" />
                <p align="center" class="pCategoryName mt-1">테크</p>
             </a>
        </div>

        <div class="col-4 col-md pCategory text-center">
           <a href="/product/getProductListCate?category=레고&cpage=1" style="width:100%; height:100%;">
                <img src="/icon/lego.png" />
                <p align="center" class="pCategoryName mt-1">레고</p>
             </a>
        </div>
      </div>
    </div>

    <!-- Style 출력 -->
    <div class="container">
      <div class="row mt-5 m-0 stListDiv">
        <div class="col-12 stDiv p-1 pageTitle">STYLE</div>
      </div>
      <div class="row stList">
      <c:forEach var="i" items="${styleList }" begin="0" end="3">
        <div class="col-6 col-lg-3">
          <div class="row p-2">
            <div class="col-12 stImgDiv">
              <a href="/style/toDetail?seq=${i.seq }">
              	<img src="/upload/${i.imageSysName }" />
              </a>
            </div>
            <div class="col-12">
              <div class="row">
                <div class="col-12 p-0">
                  <a href="/style/toStylePage?writer=${i.writer }"><img src="/upload/${i.profileSysName }" class="profileImg ms-2 me-2" style="border: 1px solid lightgray;"/></a>
                  <span class="styleWriter">@</span>
                  <span class="styleWriter">
                  	<a href="/style/toStylePage?writer=${i.writer }">${i.writer }</a>
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
      
      </div>
      <div class="row mt-5 m-0 text-center">
        <div class="col-12">
        	<a href="/style/toStyleMain">
        		<button class="btn btn-nobg">더보기</button>
        	</a>
        </div>
      </div>
    </div>


   <!-- 상품 출력 - 명품 카테고리 -->
    <div class="container">
      <div class="row mt-5 m-0 pdListDiv">
        <div class="col-12 pdDiv p-1 pageTitle">Brand Product</div>
      </div>
      <div class="row pdList">
         
         <c:forEach var="b" items="${brandList }" begin="0" end="3" step="1" varStatus="status">
         
        <div class="col-6 col-lg-3">
          <div class="row p-2">
            <div class="col-12 b-pdImgDiv">
              <a href="/product/getProductDetail?parentSeq=${b.seq }">
                <img src="/upload/${brandImageList[status.index] }" class="p-0 m-0" />
             </a>
            </div>
            <div class="col-12 ps-1">
              <div class="row">
                <div class="col-9 ps-4 pdBrand">${b.brand}</div>
                <div class="col-3 text-end">
                <c:if test="${loginId ne null }">
                  <img src="/icon/bookmark.png" class="bookmark mark${b.seq }" value="${b.seq }" />
                  <input type="hidden" class="input${b.seq }" value="emp" >
                  <c:forEach items="${wishList }" var="w">
             
                <c:if test="${w.parentSeq eq b.seq }">
                   <script>
                   $(".mark${b.seq}").attr("src","/icon/bookmark-full.png")
                   $(".input${b.seq}").val("full")
                   </script>
                   
                </c:if>
             

             </c:forEach>
                  </c:if>
                </div>
              </div>
            </div>
            <div class="col-12 ps-3 pdName">${b.title }</div>
            <div class="col-12 ps-3 pdPrice">${b.formedPrice }</div>
          </div>
        </div>
        </c:forEach>
       
      </div>
      <div class="row mt-5 m-0 text-center">
        <div class="col-12"></div>
      </div>
    </div>

    <!-- 상품 출력 - 신발 카테고리 -->
    
    <div class="container">
      <div class="row mt-5 m-0 pdListDiv">
        <div class="col-12 pdDiv p-1 pageTitle">Shoes Product</div>
      </div>
      <div class="row pdList">
         
         <c:forEach var="s" items="${shoesList }" begin="0" end="3" step="1" varStatus="status">
         
        <div class="col-6 col-lg-3">
          <div class="row p-2">
            <div class="col-12 b-pdImgDiv">
              <a href="/product/getProductDetail?parentSeq=${s.seq }">
                <img src="/upload/${shoesImageList[status.index] }" class="p-0 m-0" />
             </a>
            </div>
            <div class="col-12 ps-1">
              <div class="row">
                <div class="col-9 ps-4 pdBrand">${s.brand}</div>
                <div class="col-3 text-end">
                  <c:if test="${loginId ne null }">
                  <img src="/icon/bookmark.png" class="bookmark mark${s.seq }" value="${s.seq }" />
                  <input type="hidden" class="input${s.seq }" value="emp">
                  <c:forEach items="${wishList }" var="w">
             
                <c:if test="${w.parentSeq eq s.seq }">
                   <script>
                   $(".mark${s.seq}").attr("src","/icon/bookmark-full.png")
                   $(".input${s.seq}").val("full")
                   </script>
                   
                </c:if>
                

                </c:forEach>
                </c:if>
                </div>
              </div>
            </div>
            <div class="col-12 ps-3 pdName">${s.title }</div>
            <div class="col-12 ps-3 pdPrice">${s.formedPrice }</div>
          </div>
        </div>
        </c:forEach>
       
      </div>
      <div class="row mt-5 m-0 text-center">
        <div class="col-12"></div>
      </div>
    </div>

    <!-- 상품 출력 - 의류 카테고리 -->
    
   <div class="container">
      <div class="row mt-5 m-0 pdListDiv">
        <div class="col-12 pdDiv p-1 pageTitle">Clothes Product</div>
      </div>
      <div class="row pdList">
         
         <c:forEach var="c" items="${clothesList }" begin="0" end="3" step="1" varStatus="status">
         
        <div class="col-6 col-lg-3">
          <div class="row p-2">
            <div class="col-12 b-pdImgDiv">
              <a href="/product/getProductDetail?parentSeq=${c.seq }">
                <img src="/upload/${clothesImageList[status.index] }" class="p-0 m-0" />
             </a>
            </div>
            <div class="col-12 ps-1">
              <div class="row">
                <div class="col-9 ps-4 pdBrand">${c.brand}</div>
                <div class="col-3 text-end">
                <c:if test="${loginId ne null }">
                  <img src="/icon/bookmark.png" class="bookmark mark${c.seq }" value="${c.seq }" />
                  <input type="hidden" class="input${c.seq }" value="emp">
                  <c:forEach items="${wishList }" var="w">
             
                <c:if test="${w.parentSeq eq c.seq }">
                   <script>
                   $(".mark${c.seq}").attr("src","/icon/bookmark-full.png")
                   $(".input${c.seq}").val("full")
                   </script>
                   
                </c:if>
             

             </c:forEach>
             </c:if>
                </div>
              </div>
            </div>
            <div class="col-12 ps-3 pdName">${c.title }</div>
            <div class="col-12 ps-3 pdPrice">${c.formedPrice }</div>
          </div>
        </div>
        </c:forEach>
       
      </div>
      <div class="row mt-5 m-0 text-center">
        <div class="col-12"></div>
      </div>
    </div>
    
    
    
    
    
    
	<!-- Carousel -->
    <div id="carouselExampleIndicatorsMD" class="carousel slide" data-bs-ride="carousel" >
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicatorsMD" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" ></button>
        <button type="button" data-bs-target="#carouselExampleIndicatorsMD" data-bs-slide-to="1" aria-label="Slide 2" ></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="/images/mainBanner_05.png" class="d-block w-100" />
        </div>
        <div class="carousel-item">
          <img src="/images/mainBanner_06.png" class="d-block w-100" />
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicatorsMD" data-bs-slide="prev" >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicatorsMD" data-bs-slide="next" >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>

     <!-- 상품 출력 - 테크 카테고리 -->
    
   <div class="container">
      <div class="row mt-5 m-0 pdListDiv">
        <div class="col-12 pdDiv p-1 pageTitle">Tech Product</div>
      </div>
      <div class="row pdList">
         
         <c:forEach var="t" items="${techList }" begin="0" end="3" step="1" varStatus="status">
         
        <div class="col-6 col-lg-3">
          <div class="row p-2">
            <div class="col-12 b-pdImgDiv">
              <a href="/product/getProductDetail?parentSeq=${t.seq }">
                <img src="/upload/${techImageList[status.index] }" class="p-0 m-0" />
             </a>
            </div>
            <div class="col-12 ps-1">
              <div class="row">
                <div class="col-9 ps-4 pdBrand">${t.brand}</div>
                <div class="col-3 text-end">
                <c:if test="${loginId ne null }">
                  <img src="/icon/bookmark.png" class="bookmark mark${t.seq }" value="${t.seq }" />
                  <input type="hidden" class="input${t.seq }" value="emp">
                  <c:forEach items="${wishList }" var="w">
             
                <c:if test="${w.parentSeq eq t.seq }">
                   <script>
                   $(".mark${t.seq}").attr("src","/icon/bookmark-full.png")
                   $(".input${t.seq}").val("full")
                   </script>
                   
                </c:if>
             

             </c:forEach>
             </c:if>
                </div>
              </div>
            </div>
            <div class="col-12 ps-3 pdName">${t.title }</div>
            <div class="col-12 ps-3 pdPrice">${t.formedPrice }</div>
          </div>
        </div>
        </c:forEach>
       
      </div>
      <div class="row mt-5 m-0 text-center">
        <div class="col-12"></div>
      </div>
    </div>
    
    

    <!-- 상품 출력 - 레고 카테고리 -->
    
   <div class="container">
      <div class="row mt-5 m-0 pdListDiv">
        <div class="col-12 pdDiv p-1 pageTitle">Lego Product</div>
      </div>
      <div class="row pdList">
         
         <c:forEach var="l" items="${legoList }" begin="0" end="3" step="1" varStatus="status">
         
        <div class="col-6 col-lg-3">
          <div class="row p-2">
            <div class="col-12 b-pdImgDiv">
              <a href="/product/getProductDetail?parentSeq=${l.seq }">
                <img src="/upload/${legoImageList[status.index] }" class="p-0 m-0" />
             </a>
            </div>
            <div class="col-12 ps-1">
              <div class="row">
                <div class="col-9 ps-4 pdBrand">${l.brand}</div>
                <div class="col-3 text-end">
                <c:if test="${loginId ne null }">
                  <img src="/icon/bookmark.png" class="bookmark mark${l.seq }"  value="${l.seq }"/>
                  <input type="hidden" class="input${l.seq }" value="emp">
                  <c:forEach items="${wishList }" var="w">
             
                <c:if test="${w.parentSeq eq l.seq }">
                   <script>
                   $(".mark${l.seq}").attr("src","/icon/bookmark-full.png")
                   $(".input${l.seq}").val("full")
                   </script>
                   
                </c:if>
             

             </c:forEach>
             </c:if>
                </div>
              </div>
            </div>
            <div class="col-12 ps-3 pdName">${l.title }</div>
            <div class="col-12 ps-3 pdPrice">${l.formedPrice}</div>
          </div>
        </div>
        </c:forEach>
       
      </div>
      <div class="row mt-5 m-0 text-center">
        <div class="col-12"></div>
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
            <div class="col-12"><button class="faqBtn btn">FAQ</button></div>
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
      
     $(".bookmark").on("click",function(){
         
//          console.log("val값"+$(this).attr("value"))
//           console.log("형제 input val값"+$(this).siblings("input").val())
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
//           location.href="/product/enrollWishList?parentSeq="+$(this).val();
        })
        
        
   // navibar 검색
     $(".searchInput").on("keydown",function(e){
        
        if(e.keyCode==13){
           if($(".searchInput").val().replace(/\s|　/gi, "").length == 0){
              location.reload();
           }else{
              location.href="/product/getProductSearch?title="+$(".searchInput").val();
           }
        }
     })
     $(".searchInputMD").on("keydown",function(e){
        
        if(e.keyCode==13){
           if($(".searchInputMD").val().replace(/\s|　/gi, "").length == 0){
              location.reload();
           }else{
              location.href="/product/getProductSearch?title="+$(".searchInputMD").val();
           }
        }
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