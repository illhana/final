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
 
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Resellium | 리셀리엄</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/basic.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/navbar.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/home.css" />
    <!-- Google Fonts -->
    <!-- All -->
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Sans:ital,wght@0,500;0,600;0,700;1,800&display=swap"
      rel="stylesheet"
    />
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

    <!--  jQuery CDN  -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- SweetAlert CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Google Fonts -->
<!-- All -->
<link
href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Sans:ital,wght@0,500;0,600;0,700;1,800&display=swap"
rel="stylesheet"
/>
<!-- chartjs -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- <link
href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&family=Noto+Sans:ital,wght@1,800&display=swap"
rel="stylesheet"
/> -->

<style>
/* select {
    width: 110px; 
    padding: .8em .5em; 
    border: 1px solid #999;
    font-family: inherit;  
    background: url('arrow.jpg') no-repeat 95% 50%; 
    border-radius: 0px; 
    -webkit-appearance: none; 
    -moz-appearance: none;
    appearance: none;
    margin-left: 20px;
    
} */

select::-ms-expand {
    display: none;
}

.btn-nobg1 {
    border: 1px solid #d3d3d3 !important;
    background-color: RGB(239,98,83);
    padding: 7px  !important;
    border-radius: 12px !important;
    font-size: 15px !important;
    color: white !important;
    width: 49% !important;
  }
  .btn-nobg2 {
    border: 1px solid #d3d3d3 !important;
    background-color: RGB(65,185,121);
    padding: 7px  !important;
    border-radius: 12px !important;
    font-size: 15px !important;
    color: white !important;
    width: 49% !important;
   
  }
  .btn-nobg3{
    border: 1px solid #d3d3d3 !important;
    background-color: white;
    padding: 14px  !important;
    border-radius: 12px !important;
    font-size: 15px !important;
    color: #2d2d2d ;
    margin-top: 10px;
    width: 99%;

  }
  #boximage{
    width: 42px;
    height: 42px;
    
  }
  #carouselExampleFade{
    position: fixed;
  }

  .carousel-item active>img{
    width: 480px;
    height: 550px !important;
  }
  .carousel-inner,.carousel-item{
  	border-radius:15px !important;
  }
  
  #sizeChoice{
      
    border-left-width:0; 
    border-right-width:0; 
    border-top-width:0; 
    border-bottom-width:0;
    background-color:transparent;
    font-weight: bold;
    font-size: 13px;
    color:red;
    padding:0px !important;
    width:130px;
  }
  
   .boxside{
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
        font-size: 11px;
        color:#848484;
        width: 100%;
    }
    
    .productInfo{
       font-size:13px;
       color:#848484;
    }
    
    #selectSizeText{
       font-size: 14px;
        color:#848484;
        line-height: 3.5;
    }
    
    #recentTrade{
       align-left:100%;
       padding:0px !important;

    }
    #recentPrice{
       padding:0px !important;
    }
   select {
     -moz-appearance: none;
     -webkit-appearance: none;
     appearance: none;
     
     font-family: "Noto Sansf KR", sans-serif;
     font-size: 1rem;
     font-weight: 400;
     line-height: 1.7;
     
     color: #444;
     background-color: #fff;
     
      padding: .3em 0.5em .4em .6em; 
     margin: 0;
     
     border: 1px solid #aaa;
     border-radius: .5em;
     box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
   }

#productImageDiv{
}   
 
   .productImageDiv{
      width:530px;
/*       height:370px; */
   }
   .productImageDiv img{
      object-fit:cover;
   }
   .caPic{
      border-radius: 15px;
   }
   

@media (max-width: 1200px) {
   .productImageDiv{
      width:500px;
   }
}
@media (max-width: 991px) {
   .productImageDiv{
      width:630px;
   }
	.temporary {
	  display: none;
	}
	.productImageDiv{
	   position: static !important;
	}
}

.carousel-indicators button {
	background-color:#bebebe !important;
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
        <div class="row" style="relative">
        <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-5 m-0 temporary" style="background-color:transparent;" >
        </div>
        
           <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-5 m-0 productImageDiv" id="productImageDiv" style="position:fixed">
            <div id="carouselExampleIndicators" class="carousel slide " data-bs-ride="carousel">
              <div class="carousel-indicators">
              <c:if test="${!empty sysNameDetail[0]}">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active " aria-current="true" aria-label="Slide 1"></button>
              </c:if>
              <c:if test="${!empty sysNameDetail[1]}">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2" ></button>
              </c:if>
              <c:if test="${!empty sysNameDetail[2]}"> 
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3" ></button>
              </c:if>
              </div>
              <div class="carousel-inner">
                 <c:if test="${!empty sysNameDetail[0]}">
                   <div class="carousel-item active">
                     <img src="/upload/${sysNameDetail[0]}" class="d-block w-100 caPic" alt="...">
                   </div>
                </c:if>
                <c:if test="${!empty sysNameDetail[1]}">
                <div class="carousel-item">
                     <img src="/upload/${sysNameDetail[1]}" class="d-block w-100 caPic" alt="...">
                </div>
                </c:if>
                <c:if test="${!empty sysNameDetail[2]}">
                <div class="carousel-item">
                     <img src="/upload/${sysNameDetail[2]}" class="d-block w-100 caPic" alt="...">
                </div>
                </c:if>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
           </div>
        
        
           <div class="col-12 col-sm-12 col-md-12 col-lg-6" id="productInfoDiv">
           
                <div class="row">
                    <div class="col-12 mt-5 m-0">
                        <span style="font-size:20px; font-weight:bold; text-decoration: underline;">${productDetail[0].brand }</span><br>
                        <span style="">${productDetail[0].title }</span><br>
                        <span style="color:#848484;font-size:14px;">${productDetail[0].name }</span><br>
                        
                        
                    </div>
                    <div class="col-12 mt-3 m-0" id="sizeSelect">
                       <div class="row">
                          <div class="col-2">
                              <span id="selectSizeText">사이즈</span>
                           </div>
                           <div class="col-10" style="text-align:right;">
                           <select id="selectBox">
                              <option selected>모든 사이즈</option>
                               <option>230</option>
                               <option>235</option>
                               <option>240</option>
                               <option>245</option>
                               <option>250</option>
                               <option>255</option>
                               <option>260</option>
                               <option>265</option>
                               <option>270</option>
                               <option>275</option>
                               <option>280</option>
                               <option>285</option>
                           </select>
                              
                              <input type="text" id="sizeChoice" value="*사이즈를 선택해주세요" style="text-align:right; margin:0px;" disabled>
                              
                           </div>
                           <div class="col-12">
                              <hr>
                           </div>
                        </div>
                    </div>
                    <div class="col-12 mt-3 m-0" >
                        <div class="row m-0">
                           <div class="col-6" id="recentTrade" style="font-size:15px; m-0 ">최근거래가</div>
                           <div class="col-6" id="recentPrice" style="text-align:right; font-weight: bold;"></div>
                        </div>
                    </div>
                    <div class="col-12 mt-5 m-0">
                        <button class="btn-nobg1" value=""><span id="btnSpan1">구매 | 0원 <br>즉시구매하기</span></button>
                        <button class="btn-nobg2" value=""><span id="btnSpan2">구매 | 0원 <br>즉시판매하기</span></button><br>
                        <button class="btn-nobg3" value="${productDetail[0].seq }">관심상품 등록하기</button>
                    </div>
                    <div class="col-12 mt-5 m-0" style="font-size:18px; font-weight:bold;">
                        상품정보
                    </div>
                    <div class="col-12 mt-1 m-0">
                        <hr>
                    </div>
                    <div class="col-4 mt-1 m-0" style="text-align:center;">
                        <span class="productInfo">모델번호</span><br>
                        ${productDetail[0].name }
                    </div>
                    <div class="col-4 mt-1 m-0" style="text-align:center;">
                        <span class="productInfo">컬러</span><br>
                        ${productDetail[0].color }
                    </div>
                    <div class="col-4 mt-1 m-0" style="text-align:center;">
                        <span class="productInfo">발매가</span><br>
                       ${productDetail[0].formedPrice }
                    </div>
                    <div class="col-12 mt-1 m-0">
                        <hr>
                    </div>
                    <div class="col-12 mt-2 m-0">
                        배송정보
                    </div>
                    <div class="col-12 mt-1 m-0">
                       <div class="row">
                           <div class="col-1 ps-3 pe-0 mt-1">
                              <img src="/images/box.png" id="boximage">
                           </div>
                           <div class="col-11 ">
                              <div class="row ">
                                 <div class="col-12" style="margin-left:10px;">
                                    일반배송 3000원
                                 </div>
                                 <div class="col-12" style="margin-left:10px;">
                                    <input type="text" value="검수 후 배송 5-7일 내 도착 예정" class="boxside" disabled>
                                 </div>
                              </div>
                          </div>
                       </div>
                    </div>   
                    <div class="col-12 mt-1 m-0">
                        <hr>
                    </div>
                    <div class="col-12 mt-2 m-0" style="font-size:18px; font-weight:bold;">
                        시세
                    </div>
                    <div class="col-12 mt-1 m-0">
                        <canvas id="myChart" width="580px" height="400px"></canvas>
                    </div>
                    <div class="col-12 mt-5 m-0">
                        <span style="font-size:18px; font-weight:bold;">구매 전 꼭 확인해주세요!</span>
                    </div>
                    <div class="col-12 mt-1 m-0">
                   <div class="accordion accordion-flush" id="accordionFlushExample">
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                          배송 기간 안내
                        </button>
                      </h2>
                      <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body"><code>Resellium은 최대한 빠르게 모든 상품을 배송하기 위해 노력하고 있습니다. 배송 시간은 판매자가 검수를 위하여 상품을 검수센터로 보내는 속도에 따라 차이가 있습니다.</code> 
                        <br><br>
                           
                         <span style="font-weight:bold;font-size:14px;">[빠른배송 구매]</span><br><br>
                        
                        <span style="font-size:14px;">
                        - 판매자가 보관 신청한 상품 중 검수에 합격한 상품을 Resellium의 전용 창고에 보관합니다. <br>
                        - 오늘(오후 11:59까지) 결제하면 내일 바로 출고되어 빠른 배송이 가능합니다. (연휴 및 공휴일, 천재지변, 택배사 사유 등 예외적으로 출고일이 변경될 수 있습니다.<br><br>
                        </span>
                        
                        <span style="font-weight:bold;font-size:14px;">
                        [일반 구매]
                        </span><br><br>
                        
                        <span style="font-size:14px;">
                        - 거래가 체결된 시점부터 48시간(일요일•공휴일 제외) 내에 판매자가 상품을 발송해야 하며, 통상적으로 발송 후 1-2일 내에 Resellium 검수센터에 도착합니다.<br>
                        - 검수센터에 도착한 상품은 입고 완료 후 3영업일 이내에 검수를 진행합니다. 검수 합격시 배송을 준비합니다.<br>
                        * 상품 종류 및 상태에 따라 검수 소요 시간은 상이할 수 있으며, 구매의사 확인에 해당할 경우 구매자와 상담 진행으로 인해 지연이 발생할 수 있습니다.<br><br>
                        
                        - 검수센터 출고는 매 영업일에 진행하고 있으며, 출고 마감시간은 오후 5시입니다. 출고 마감시간 이후 검수 완료건은 운송장번호는 입력되지만 다음 영업일에 출고됩니다.
                        </span>
                        </div>   
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="flush-headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                          검수 안내
                        </button>
                      </h2>
                      <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                              
                              <span style="font-weight:bold;font-size:14px;">
                              판매자의 상품이 검수센터에 도착하면 전담 검수팀이 철저한 분석과 검사로 정가품 확인을 진행합니다.
                              </span>
                              <br><br>
                              
                              <span style="font-size:14px; ">
                              - 검수센터에서는 정가품 여부를 확인하기 위하여, 지속적으로 데이터를 쌓고 분석하여 기록하고 있습니다.<br>
                              - 업계 전문가로 구성된 검수팀은 박스와 상품의 라벨에서 바느질, 접착, 소재 등 모든 것을 검수합니다.<br>
                              </span>
                              
                              <br><br>
                              
                              <span style="font-weight:bold;font-size:14px;">
                              검수 결과는 불합격•검수 보류•합격의 세가지 상태로 결과가 변경됩니다.
                              </span>
                              
                              <br><br>
                              <span style="font-size:14px;">
                              * 검수 합격: Resellium  검수택(Tag)이 부착되어 배송을 준비함<br>
                              
                              * 검수 보류: 앱에서 사진으로 상품의 상태 확인 및 구매 여부를 선택. (24시간 이후 자동 검수 합격)<br>
                              
                              * 검수 불합격: 즉시 거래가 취소되고 구매하신 금액을 환불 처리함.(환불 수단은 결제 수단과 동일)<br>
                               </span>
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="flush-headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                          구매 환불/취소/교환 안내
                        </button>
                      </h2>
                      <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">                          
                             <span style="font-weight:bold;font-size:14px;">
                             Resellium은 익명 거래를 기반으로 판매자가 판매하는 상품을 구매자가 실시간으로 구매하여 거래를 체결합니다.
                             </span>
                             <br><br>
                             <span style="font-size:14px; ">
                           - 단순 변심이나 실수에 의한 취소/교환/반품이 불가능합니다. 상품을 원하지 않으시는 경우 언제든지 Resellium에서 재판매를 하실 수 있습니다.<br>
                           - 상품 수령 후, 이상이 있는 경우 Resellium 고객센터로 문의해주시기 바랍니다.
                             </span>
                       </div>
                      </div>
                    </div>
                  </div>
                  
                    </div>
                </div>
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
        // 스크롤 높이 구하기
        var windw = this;

		$.fn.followTo = function ( pos ) {
		    var $this = this,
		        $window = $(windw);
		    
		    $window.scroll(function(e){
		        if ($window.scrollTop() > pos) {
		            $this.css({
		                position: 'absolute',
		                top:pos
		            });
		        } else {
		            $this.css({
		                position: 'fixed',
		                top:110
		            });
		        }
		    });
		};

	$('#productImageDiv').followTo(950);
        
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
        
            const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['JUNE_W01', 'JUNE_W02', 'JUNE_W03', 'JUNE_W04', 'JULY_W01', 'JULY_W02','JULY_W03'],
            datasets: [{
                label: 'price',
                data: [${productDetail[0].releasePrice }*1.1,${productDetail[0].releasePrice }*1.17 , ${productDetail[0].releasePrice }*1.12, ${productDetail[0].releasePrice }*1.2, ${productDetail[0].releasePrice }*1.16, ${productDetail[0].releasePrice }*1.1, ${productDetail[0].releasePrice }*1.15],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: false,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
    
    
    //사이트 들어오면 구매버튼이랑 판매버튼에 모든사이즈중에 최저가와 최고가를 표시해주는 함수
    $(function(){
       
    	let recentPrice= ${productDetail[0].releasePrice }*1.2
    	recentPrice=Math.floor(recentPrice)
    	$("#recentPrice").append(recentPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')+"원")
       
       
      $.ajax({
         url: "/product/getTotalMinPrice",
         data : {parentSeq :   ${productDetail[0].seq }
      }
      }).done(function(totalMinPrice){
         if(totalMinPrice!="null"){
            $("#btnSpan1").html("구매  |"+" "+totalMinPrice+"원<br>"+"<span style='font-size:1.4rem; font-weight:bold;'>즉시구매하기</span>")
            $(".btn-nobg1").attr("value",totalMinPrice)
            console.log("totalMinPrice 값 :"+totalMinPrice)
         }else{
            $("#btnSpan1").html("판매입찰이 없습니다.<br><span style='font-size:1.4rem; font-weight:bold;'>구매입찰 시작하기</span>")
            $(".btn-nobg1").attr("value",totalMinPrice)
            console.log("totalMinPrice 값 :"+totalMinPrice)
         }
      })
      
      $.ajax({
         url: "/product/getTotalMaxPrice",
         data : {parentSeq :   ${productDetail[0].seq }
      }
      }).done(function(totalMaxPrice){
         if(totalMaxPrice!="null"){
            $("#btnSpan2").html("판매  |"+" "+totalMaxPrice+"원<br>"+"<span style='font-size:1.4rem; font-weight:bold;'>즉시판매하기</span>")
            $(".btn-nobg2").attr("value",totalMaxPrice)
            console.log("maxPrice 값 :"+totalMaxPrice)
         }else{
            $("#btnSpan2").html("구매입찰이 없습니다.<br><span style='font-size:1.4rem; font-weight:bold;'>판매입찰 시작하기</span>")
            $(".btn-nobg2").attr("value",totalMaxPrice)
            console.log("totalMaxPrice 값 :"+totalMaxPrice)
         }
      })
      
      
      if("${productDetail[0].category}"!="신발"){
         $("#sizeSelect").css("display","none")
      }
      
       
       if("${productDetail[0].seq}"=="${wishSeqCheck}"){
          $(".btn-nobg3").css("background-color","black");
         $(".btn-nobg3").css("color","white");
         $(".btn-nobg3").text("관심 상품입니다.")
       }else{
         $(".btn-nobg3").css("background-color","white");
         $(".btn-nobg3").css("color","#2d2d2d");
         $(".btn-nobg3").text("관심상품 등록하기")
       }
//       $.ajax({
//          url: "/product/wishListIdCheck",
//          data : {parentSeq :   ${productDetail[0].seq }
//       }
//       }).done(function(exist){
//          if(exist=="exist"){
//             $(".btn-nobg3").css("background-color","black")
//             $(".btn-nobg3").css("color","white")
//             $(".btn-nobg3").text("관심 상품입니다.")
//          }
//          console.log(exist)
//       })
       
    });
   
    $("#selectBox").on("change",function(){

      $.ajax({
         url: "/product/getMinPrice",
         data : {sized : $("#selectBox option:selected").text(),
               parentSeq :   ${productDetail[0].seq }
         }
      }).done(function(minPrice){
         if(minPrice!="null"){
            $("#btnSpan1").html("구매  |"+" "+minPrice+"원<br>"+"<span style='font-size:1.4rem; font-weight:bold;'>즉시구매하기</span>")
            $(".btn-nobg1").attr("value",minPrice)
            console.log("minPrice 값 :"+minPrice)
         }else{
            $("#btnSpan1").html("판매입찰이 없습니다.<br><span style='font-size:1.4rem; font-weight:bold;'>구매입찰 시작하기</span>")
            $(".btn-nobg1").attr("value",minPrice)
            console.log("minPrice 값 :"+minPrice)
         }
      })
      
      $.ajax({
         url: "/product/getMaxPrice",
         data : {sized : $("#selectBox option:selected").text(),
               parentSeq :   ${productDetail[0].seq }
         }
      }).done(function(maxPrice){
         if(maxPrice!="null"){
            $("#btnSpan2").html("판매  |"+" "+maxPrice+"원<br>"+"<span style='font-size:1.4rem; font-weight:bold;'>즉시판매하기</span>")
            $(".btn-nobg2").attr("value",maxPrice)
            console.log("maxPrice 값 :"+maxPrice)
         }else{
            $("#btnSpan2").html("구매입찰이 없습니다.<br><span style='font-size:1.4rem; font-weight:bold;'>판매입찰 시작하기</span>")
            $(".btn-nobg2").attr("value",maxPrice)
            console.log("maxPrice 값 :"+maxPrice)
         }
      })
      
      if($("#selectBox option:selected").text()=="모든 사이즈" && "${productDetail[0].category}"=="신발"){
              $("#sizeChoice").attr("type","text");
         $("#sizeChoice").val("*사이즈를 선택해주세요")
         
         $.ajax({
            url: "/product/getTotalPrice",
            data : {parentSeq :   ${productDetail[0].seq }
            }
         }).done(function(totalPrice){
            if(totalPrice[0]!="null"){
               $("#btnSpan1").html("구매  |"+" "+totalPrice[0]+"원<br>"+"<span style='font-size:1.4rem; font-weight:bold;'>즉시구매하기</span>")
               $(".btn-nobg1").attr("value",totalPrice[0])
               
            }else{
               $("#btnSpan1").html("판매입찰이 없습니다.<br><span style='font-size:1.4rem; font-weight:bold;'>구매입찰 시작하기</span>")
               $(".btn-nobg1").attr("value",totalPrice[0])
            }
            
            
            
            if(totalPrice[1]!="null"){
               $("#btnSpan2").html("판매  |"+" "+totalPrice[1]+"원<br>"+"<span style='font-size:1.4rem; font-weight:bold;'>즉시판매하기</span>")
               $(".btn-nobg2").attr("value",totalPrice[1])
               
            }else{
               $("#btnSpan2").html("구매입찰이 없습니다.<br><span style='font-size:1.4rem; font-weight:bold;'>판매입찰 시작하기</span>")
               $(".btn-nobg2").attr("value",totalPrice[1])
               
            }
         })
         
         
          }else{
             $("#sizeChoice").attr("type","hidden")
          }
      
    })
    
    $(".btn-nobg1").on("click",function(){
       //category가 신발인데 사이즈 선택을 안했을 경우
       if($("#selectBox option:selected").text()=="모든 사이즈" && "${productDetail[0].category}"=="신발"){
          
          alert("사이즈를 선택해주세요.")
          return false
       }else{
          //물품이 신발이 아닌 물푸밀 경우 sized에 0 넣어서 포워딩)
          if($("#selectBox option:selected").text()=="모든 사이즈"){
             location.href="/product/getBuyCheck?parentSeq="+${productDetail[0].seq}+"&sized="+0+"&buyPrice="+$(".btn-nobg1").val()+"&sellPrice="+$(".btn-nobg2").val()+"&releasePrice="+${productDetail[0].releasePrice};   
          }else{
          //물품이 신발일 경우는 신발 사이즈 넣어주기   
             location.href="/product/getBuyCheck?parentSeq="+${productDetail[0].seq}+"&sized="+$("#selectBox option:selected").text()+"&buyPrice="+$(".btn-nobg1").val()+"&sellPrice="+$(".btn-nobg2").val()+"&releasePrice="+${productDetail[0].releasePrice};   
          }
       }
    })
    
    $(".btn-nobg2").on("click",function(){
       //category가 신발인데 사이즈 선택을 안했을 경우
       if($("#selectBox option:selected").text()=="모든 사이즈" && "${productDetail[0].category}"=="신발"){
          alert("사이즈를 선택해주세요.")
          return false
       }else{
          //신발이 아닌 물푸밀 경우 sized에 0 넣어서 포워딩)
          if($("#selectBox option:selected").text()=="모든 사이즈"){ 
             location.href="/product/getSellCheck?parentSeq="+${productDetail[0].seq}+"&sized="+0+"&buyPrice="+$(".btn-nobg1").val()+"&sellPrice="+$(".btn-nobg2").val()+"&releasePrice="+${productDetail[0].releasePrice};   
          }else{ 
          //신발일 경우는 신발 사이즈 넣어주기   
             location.href="/product/getSellCheck?parentSeq="+${productDetail[0].seq}+"&sized="+$("#selectBox option:selected").text()+"&buyPrice="+$(".btn-nobg1").val()+"&sellPrice="+$(".btn-nobg2").val()+"&releasePrice="+${productDetail[0].releasePrice};   
          }
       }
    })
    
    
    $(".btn-nobg3").on("click",function(){
       
       if($(".btn-nobg3").text()=="관심상품 등록하기"){
         $.ajax({
            url: "/product/enrollWishList",
            data : {parentSeq :   ${productDetail[0].seq }
            }
         }).done(function(scc){
            if(scc="success"){
               alert("관심상품 등록 성공")
               $(".btn-nobg3").css("background-color","black");
               $(".btn-nobg3").css("color","white");
               $(".btn-nobg3").text("관심 상품입니다.")
            }else{
               alert("관심상품 등록 실패")
            }
         })
       }
      
       if($(".btn-nobg3").text()=="관심 상품입니다."){
            $.ajax({
               url: "/product/deleteWishList",
               data:{parentSeq : ${productDetail[0].seq}
               }
            }).done(function(scc){
               if(scc="success"){
                  alert("관심상품 취소 성공")
                  $(".btn-nobg3").css("background-color","white");
                  $(".btn-nobg3").css("color","#2d2d2d");
                  $(".btn-nobg3").text("관심상품 등록하기")
               }
               
            })
       }
    })

    </script>
</body>
</html>