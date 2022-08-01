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

<style>
    span{
        align: center;
    }

    img{
        width: 100%;
        height: 150px;
    }



    .checked{
        width: 20px;
        height: 15px;
        margin-left: 80%;
        /* display: inline-block; */
    }

    .btn-nobg2{
    border: 1px solid #d3d3d3 !important;
    background-color: white;
    padding: 14px !important;
    border-radius: 12px !important;
    font-size: 20px !important;
    color: #2d2d2d ;
    margin-top: 3px;
    width:100%;
    }

    .btn-nobg3{
    border: 1px solid #d3d3d3 !important;
    background-color:black !important;
    padding: 14px !important;
    border-radius: 12px !important;
    font-size: 20px !important;
    margin-top: 10px;
    width:100%;
    color:white;
    }


    .won{
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
    }

    #choiceCondition{
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
        font-weight: bold;
        font-size: 18px;
    }
    #choiceCondition:focus{
      outline: none;
    }
    #uppertitle{
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
        font-weight: bold;
        font-size: 25px;
    }

    


    .address{
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
        font-weight: bold;
        font-size: 18px;

    }
    span{
        font-size: 13px;
        color:#848484;
    }
    #box{
        width: 40px;
        height: 40px;
        margin-right: 1%;
    }
    .boxside{
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
        font-size: 14px;
        color:#848484;
        width: 100%;
    }

    #finalinfo{
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
        font-weight: bold;
        font-size: 18px;
    }
    #finalpay{
        margin-top: 4%;
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
        font-weight: bold;
        font-size: 15px;
    }
    #totalPay{
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
        font-weight: bold;
        font-size: 20px;
        color:#31b46e;
    }
    .etc{
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
        font-size:15px;
    }
    .prices{
        /* margin-left: 100%; */
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
        font-size:14px;
    }
    .payway{
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
        font-weight: bold;
        font-size: 20px;
    }

    #kakaopay{
        width: 70px;
        height: 30px;
        border-radius: 70%;
    }
    
    #sellBtn:hover{
       background-color:black;
       color:white;
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
            <div class="col col-sm col-md col-lg-3"></div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-5 m-0" style="text-align: center;">
                <input type="text" value="주문/정산" id="uppertitle" style = "text-align:center;" disabled>
            </div>
            <div class="col col-sm col-md col-lg-3"></div>
            <div class="col col-sm col-md col-lg-3">
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-5 m-0">
                <div class="row">
                    <div class="col-6 col-sm-6 col-md-6 col-lg-6">
                       <img src="/upload/${sysNameOneImage}" style="object-fit:cover;">
                   </div>
                   <div class="col-6 col-sm-6 col-md-6 col-lg-6">
                       <br><br>
                        ${productDetail[0].brand} <br>
                        ${productDetail[0].name} <br>
                      <span style="font-size: 12px; color:#6E6E6E;">${productDetail[0].title}</span><br>
                      <span style="font-weight: bold;" id="sized">${sized }</span>
                   </div>
                </div>
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
        </div>
        
        <div class="row">
            <div class="col col-sm col-md col-lg-3">
                
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6">
                <hr>
            </div>
            <div class="col col-sm col-md col-lg-3">
                
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-1 m-0">
               <input type="text" value="반송주소" class="address" disabled>
                   
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
        </div>

        <div class="row">
           
            <div class="col  col-sm col-md col-lg-3">
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-3 m-0">
                <div class="row">
                    <div class="col-2">
                        <span>받는 분</span> <br>
                        <span>연락처</span> <br>
                        <span>배송 주소</span>
                    </div>
                    <div class="col-10">
                        ${personalInfo[0].name}<br>
                        ${personalInfo[0].phone}<br>
                        ${personalInfo[0].roadAddress}
                    </div>
                    
                </div>
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
        </div>

        <div class="row">
            <div class="col col-sm col-md col-lg-3">
                
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6">
                <hr>
            </div>
            <div class="col col-sm col-md col-lg-3">
                
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-1 m-0">
                <div class="row">
                    <div class="col-2">
                        <input type="text" value="발송 방법" id="choiceCondition" style="margin-bottom: 10%;" disabled>
                    </div>
                    <div class="col-10">
                        
                    </div>
                </div>
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
        </div>

        <div class="row">
            <div class="col col-sm col-md col-lg-3">
                
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6">
                <div class="row">
                    <div class="col-1">
                        <img src="/images/box.png" id="box">
                    </div>
                    <div class="col-11">
                        <b5>택배발송 선불</b5><br>
                        <input type="text" value="착불 발송 시 정산금액에서 차감" class="boxside" disabled>
                    </div>
                </div>
            </div>
            <div class="col col-sm col-md col-lg-3">
                
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-1 m-0">
                <div class="row">
                    <div class="col-10">
                       
                    </div>
                    <div class="col-2">
                        
                    </div>
                </div>
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
        </div>
        <div class="row" >
         
          <div class="col col-sm col-md col-lg-3">
          </div>
          <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-3 m-0" >
             
          </div>
          <div class="col col-sm col-md col-lg-3">
          </div>
      </div>
        <div class="row">
            <div class="col col-sm col-md col-lg-3">
                
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6">
                <hr>
            </div>
            <div class="col col-sm col-md col-lg-3">
                
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-1 m-0">
                <div class="row">
                    
                    <div class="col-12">
                        <input type="text" value="최종 주문 정보" id="finalinfo"   disabled><br>
                        <input type="text" value="정산금액" id="finalpay" ><br>
                        <input type="text" value="" class="text-end w-100" id="totalPay" disabled>
                        <hr>
                     </div>
                     
                </div>
                
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
        </div>
        <div class="row">
            <div class="col col-sm col-md col-lg-3">
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-1 m-0">
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6">
                                <input type="text" class="etc" value="" id="choiceOfTwo" disabled><br>
                                <input type="text" class="etc" value="검수비" disabled><br>
                                <input type="text" class="etc" value="수수료" disabled><br>
                                <input type="text" class="etc" value="배송비" disabled>
                            </div>
                            <div class="col-6">
                                <input type="text" class="prices  text-end w-100" style="font-weight:bold;"id="finalPrice"value="" disabled><br>
                                <input type="text" class="prices  text-end w-100" value="무료" disabled><br>
                                <input type="text" class="prices  text-end w-100" id="commission" value="무료" disabled><br>
                                <input type="text" class="prices  text-end w-100" value="선불 ・ 판매자 부담" disabled>
                            </div>
                        </div>    
                    </div>
                    <div class="col-12">
                       <hr>
                    </div>
                </div>
            </div>
            <div class="col col-sm col-md col-lg-3">
              
            </div>
        </div>
        
        <div class="row">
            <div class="col col-sm col-md col-lg-3">
               
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-2 m-0">
                <div class="row">
                   <div class="col-11">
                         거래가 체결되면 일요일・공휴일을 제외하고 48시간 내에 Resellium으로 발송을 완료한 후,발송 정보를 정확히 입력해야 합니다.<br>
                         <span style="font-size:14px; color:darkgrey;">착불 배송 시 판매 금액에서 차감 정산하며,미정산 시 별도 고지없이 해당 금액을 결제 시도할 수 있습니다.</span>
                    </div>
                    <div class="col-1" style="display:flex; justify-content: center; align-items: center;">
                         <input type="checkbox" class="cb" style="zoom:2;">
                    </div>
                     <div class="col-12">
                            <hr>
                     </div>
                     <div class="col-11">
                          송장 번호 미기재・오입력 시 입고가 진행되지 않으며,발송 후 5일(일요일・공휴일 제외)내 미도착은 허위 정보 입력으로 간주하여 미입고 패널티를 부과합니다.<br>
                          <span style="font-size:14px; color:darkgrey;">앱 알림 해제,알림톡 차단,전화번호 변경 후 미등록 시에는 거래진행 상태 알림을 받을 수 없으며 이로 인한 거래 실패는 판매자의 책임입니다.</span>
                     </div>
                     <div class="col-1" style="display:flex; justify-content: center; align-items: center;">
                        <input type="checkbox" class="cb" style="zoom:2;">
                     </div>
                     <div class="col-12">
                            <hr>
                     </div>
                      <div class="col-11">
                          검수 기준과 패널티 및 이용 정책을 다시 한번 확인하였습니다.<br>
                          <span style="font-size:14px; color:darkgrey;">이용정책 위반시,판매 금액의 최대 15.0%의 패널티가 부과됩니다.패널티 회피 시 이후 거래가 제한되며 별도 고지없이 해당 금액을 결제 시도할 수 있습니다.</span>
                     </div>
                     <div class="col-1" style="display:flex; justify-content: center; align-items: center;">
                        <input type="checkbox" class="cb" style="zoom:2;">
                     </div>
                     <div class="col-12">
                            <hr>
                     </div>
                     <div class="col-11">
                          판매 조건을 모두 확인하였으며,입찰 진행에 동의합니다.<br>
                          <span style="font-size:14px; color:darkgrey;"></span>
                     </div>
                     <div class="col-1" style="display:flex; justify-content: center; align-items: center;">
                        <input type="checkbox" class="cb" style="zoom:2;">
                     </div>
                     
                </div>
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
        
        </div>
        
        <div class="row mt-3">
            <div class="col col-sm col-md col-lg-3">
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-2 m-0">
                <input type="text" value="정산금액" class="payway"   disabled><br>
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
        </div>
        <div class="row">
            <div class="col col-sm col-md col-lg-3">
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-3 m-0">
                <button class="btn-nobg2" id="sellBtn"></button>
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
        </div>
        <br><br><br>
    </div>
    
    
    <input type="hidden" value="" id="finalmoney">
    <input type="hidden" value="" id="totalmoney">
    
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
    
       $("#sellBtn").on("click",function(){
       
           if($(".cb:checked").length < 4) {
                 alert("안내사항을 모두 체크해주세요.")
                 return false
           } 
           if($("#sellBtn").text()=="판매 입찰하기"){
              if(confirm("판매입찰 하시겠습니까?")){
                 alert("마이페이지로 이동합니다.")
                location.href="/product/getSuccessSell?parentSeq="+${parentSeq}+"&sized="+${sized}+"&totalPay="+$("#totalmoney").val()+"&result="+"${result}"+"&finalPrice="+$("#finalmoney").val();
              }
           }else{
              if(confirm("바로판매 하시겠습니까?")){
                 alert("마이페이지로 이동합니다.")
                location.href="/product/getSuccessSell?parentSeq="+${parentSeq}+"&sized="+${sized}+"&totalPay="+$("#totalmoney").val()+"&result="+"${result}"+"&finalPrice="+$("#finalmoney").val();
              }
           }
       })
       
       $(function(){
          let finalPrice=${finalPrice}
          
          
//           $("#commission").val(commission.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')+"원")
          $("#finalPrice").val(finalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')+"원")
          
          $("#finalmoney").val(finalPrice);
          
           let totalFinalPay=finalPrice
           $("#totalPay").val(totalFinalPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')+"원")
           
           $("#totalmoney").val(totalFinalPay)
           
           if("${result}"=="판매입찰"){
              $("#choiceOfTwo").val("판매희망가")
              $("#sellBtn").text("판매 입찰하기")
           }else{
              $("#choiceOfTwo").val("즉시판매가")
              $("#sellBtn").text("바로 판매하기")
           }
           
           
          if("${sized}"=="0"){
             $("#sized").css("display","none")
          }
          
          $(".cb").on("change", function(){
              if($(".cb:checked").length == 4) {
                  $("#sellBtn").css("background-color", "black")
                  $("#sellBtn").css("color","#ffffff")
              } else {
                  $("#sellBtn").css("background-color", "#ffffff")
                  $("#sellBtn").css("color","black")
              }
          })
       })
       
    </script>
</body>
</html>