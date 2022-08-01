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
    padding: 10px !important;
    border-radius: 12px !important;
    font-size: 20px !important;
/*     color: black ; */
    margin-top: 10px;
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

    .underline{
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:1;
        
    }
    #underline:focus {
        outline: none;
        
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

    #underline{
      background-color:transparent;
      border-color:black;
      text-align:right;
      font-size: 23px;
      font-weight: bold;
      width: 95%;
    }
    #deadline{
      border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
        font-weight: bold;
        display: none;
    }
    
    #moneyalert{
        border-left-width:0; 
        border-right-width:0; 
        border-top-width:0; 
        border-bottom-width:0;
        background-color:transparent;
        width:100%;
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
                <input type="text" value="즉시 판매하기" id="uppertitle" style = "text-align:center;" disabled>
            </div>
            <div class="col col-sm col-md col-lg-3"></div>
            <div class="col col-sm col-md col-lg-3">
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-5 m-0">
                <div class="row">
                    <div class="col-6 col-sm-6 col-md-6 col-lg-6">
                       <img src="/upload/${sysNameOneImage}" style="width:95%; height:220px; object-fit:cover;">
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
                <div class="row">
                    <div class="col-6" style="text-align:center ;">
                        <span>즉시구매가</span><br>
                        <input style="text-align:center ;" type="text" value="${buyPrice}" class="won" id="buynow" disabled>
                    </div>
                    <div class="col-6" style="text-align:center ;">
                        <span>즉시판매가</span><br>
                        <input style="text-align:center ;" type="text" value="${sellPrice }" class="won" id="sellnow" disabled>
                    </div>
                </div>
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
        </div>

        <div class="row">
           
            <div class="col col-sm col-md col-lg-3">
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-3 m-0">
                <div class="row">
                    <div class="col-6" style="text-align:center ;" >
                        <button class="btn-nobg2" id="sellBid">판매 입찰</button>
                    </div>
                    <div class="col-6" style="text-align:center ;">
                        <button class="btn-nobg2" id="immeSell">즉시 판매</button>
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
                        <input type="text" value="즉시 구매가" id="choiceCondition" disabled>
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
                <input type="text" maxlength=9 class="underline" id="underline" placeholder="희망가 입력" disabled><h5 style="display: inline;">원</h5><br>
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
              <div class="row">
                <div class=col-7>
                </div>
                <div class=col-7 >
                    <input type="hidden" style="color: red;" value="" id="moneyalert" disabled>
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
              <input type="text" style="font-weight: bold;" value="2022-08-01 (+7일)에 마감" id="deadline" disabled>
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
                <button class="btn-nobg3" id="finalbtn">즉시 판매 계속 </button>
            </div>
            <div class="col col-sm col-md col-lg-3">
            </div>
        </div>
    </div>
    
    <input type="hidden" value="" id="result">

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
          
          if("${sellPrice}"=="null"){
                   $("#sellBid").trigger('click')
                   $("#sellBid").css("color","white")
                    $("#sellnow").val("-")
                   $("#immeSell").attr("disabled",true)
                    $("#immeSell").css("color","black")
                    
          }else{
             $("#immeSell").trigger("click")
             
          }
          
          
          if("${buyPrice}"=="null"){
             $("#buynow").val("-");
          }
          
          if("${sized}"=="0"){
             $("#sized").css("display","none")
          }
       })
       
       
//         $("#bid").on("click",function(){
//             $('.btn-nobg2').css("background-color","white")            
//             $(this).css("background-color","RGB(239,98,83)")
            
//         })
//         $("#purchase").on("click",function(){
//             $('.btn-nobg2').css("background-color","white")            
//             $(this).css("background-color","RGB(239,98,83)")
           
//         })

        $("#immeSell").trigger("click");
        $("#underline").val($("#sellnow").val())
       

        $("#immeSell").on("click",function(){
          $('.btn-nobg2').css("background-color","white")  
          $(this).css("background-color","#41b979")   
          
          $("#result").val("즉시판매")
          
          $("#immeSell").css("color","white")
          $("#underline").val($("#sellnow").val())
          $("#underline").attr("disabled","true")
          $("#choiceCondition").val("판매 희망가")
          $("#finalbtn").text("즉시 판매 계속")
          $("#uppertitle").val("즉시 판매하기")
          $("#deadline").css("display","none")
          $("#sellBid").css("color","black")
        })

        $("#sellBid").on("click",function(){
          $('.btn-nobg2').css("background-color","white")            
          $(this).css("background-color","#41b979") 
       
          $("#result").val("판매입찰")
          
          $("#sellBid").css("color","white")
          $("#underline").val("");
          $("#underline").removeAttr("disabled")
          $("#underline").attr("placeholder","희망가 입력")
          $("#choiceCondition").val("판매 희망가")
          $("#finalbtn").text("판매 입찰 계속")
          $("#uppertitle").val("판매 입찰하기")
          $("#deadline").css("display","block")
          $("#immeSell").css("color","black")
        })
      
     let releasePrice=${releasePrice}
     let minimumPrice=releasePrice*1
          
     minimumPrice=Math.floor(minimumPrice);
        
     $("#underline").on("keyup",function(){
           let regexp1 = /^[0-9]*$/; 
            
            if(!regexp1.test($("#underline").val())){
               alert("숫자만 가능합니다.")
               $("#underline").val("")
            }
            
            
            
            if($("#underline").val()<minimumPrice){
               $("#moneyalert").attr("type","text");
               $("#moneyalert").css("color","red");
               $("#moneyalert").val(minimumPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')+"원 이상 입력해주세요")
               
            }else{
               $("#moneyalert").attr("type","hidden")
            }
        })
        
        
        
        
        $("#finalbtn").on("click",function(){
           if($("#underline").val()!="" && $("#underline").val()>=minimumPrice){
              location.href="/product/getSellPaymentCheck?parentSeq="+${productDetail[0].seq}+"&finalPrice="+$("#underline").val()+"&sized="+${sized}+"&result="+$("#result").val()
           }else{
              alert("가격을 알맞게 입력주세요")
              return false;
           }
        })

    </script>
</body>
</html>