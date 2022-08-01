<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resellium | Style</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/logo.png"> 
<!-- CSS External -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/myStylePage.css" />
    <!-- Google Fonts -->
    <!-- All -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Sans:ital,wght@0,500;0,600;0,700;1,800&display=swap" rel="stylesheet" />
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>

    <!--  jQuery CDN  -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- SweetAlert CDN -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
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
              <a class="nav-link curPage" href="/style/toStyleMain">STYLE</a>
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
              <a class="nav-link p-3 pt-5 curPage" href="/style/toStyleMain">STYLE</a>
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
    
    <c:if test="${isExistWriter eq 1 }">
        <script language="javaScript">
          alert("더이상 활동하지 않는 회원입니다.")
          location.href="/style/toStyleMain"
       </script>
     </c:if>
    
    <!-- list == 0 -->
    <c:if test="${fn:length(list) == 0 }">
	    <!-- 스타일 페이지 메뉴 및 프로필-->
	    <div class="container">
	      <div class="row btnbar mt-4 text-center">
	        <div class="col-12 text-end my-auto">
	
	       	<button class="btn btn-style curPageBtn" id="toStylePage">내 스타일</button>
	        
	        </div>
	      </div>
	      <div class="row text-center">
	        <div class="col-12">
	          <img src="/upload/${mDTO.imageSysName }" class="myProfileImg ms-2 me-2" style="border: 1px solid lightgray;"/>
	        </div>
	        <div class="col-12 mt-3">
	          <span class="myStyleWriter">@</span>
	          <span class="myStyleWriter mySwu"><a href="/style/toStylePage?writer=${mDTO.id }">${mDTO.id }</a></span>
	        </div>
	      </div>
	      <div class="row mt50">
	        <div class="col-12 hr"></div>
	      </div>
	      <div class="row myStyleHeader">
	        <div class="col-6 text-start m-auto ps-5">게시물&nbsp;&nbsp;${boardCount }</div>
	        <div class="col-6 text-end m-auto pe-5">
	          <button class="btn btn-style toStyleWrite">스타일 올리기</button>
	        </div>
	      </div>
	    </div>    
    </c:if>
    <!-- list > 0 -->
	<c:if test="${fn:length(list) > 0}">
    <!-- 스타일 페이지 메뉴 및 프로필-->
    <div class="container">
      <div class="row btnbar mt-4 text-center">
        <div class="col-12 text-end my-auto">

       	<c:if test="${loginId == list[0].writer }">
       		<button class="btn btn-style curPageBtn" id="toStylePage">내 스타일</button>
       	</c:if>
        
        </div>
      </div>
      <div class="row text-center">
        <div class="col-12">
          <img src="/upload/${list[0].profileSysName }" class="myProfileImg ms-2 me-2" style="border: 1px solid lightgray;"/>
        </div>
        <div class="col-12 mt-3">
          <span class="myStyleWriter">@</span>
          <span class="myStyleWriter mySwu"><a href="/style/toStylePage?writer=${list[0].writer }">${list[0].writer }</a></span>
        </div>
      </div>
      <div class="row mt50">
        <div class="col-12 hr"></div>
      </div>
      <div class="row myStyleHeader">
        <div class="col-6 text-start m-auto ps-5">게시물&nbsp;&nbsp;${boardCount }</div>
        <div class="col-6 text-end m-auto pe-5">
        	<c:if test="${loginId == list[0].writer }">
          		<button class="btn btn-style toStyleWrite">스타일 올리기</button>
       		</c:if>
        </div>
      </div>
    </div>	
	</c:if>

    <!-- Style 출력 -->
    <div class="container p-4 pt-0 stList">
    
      <div class="row mt-5 m-0">
      
      <c:forEach var="i" items="${list }" varStatus="status">
        <div class="col-6 col-lg-4">
        
          <div class="row p30">
          
            <!-- 스타일 게시글 이미지 출력 -->
            <div class="col-12 stImgDiv">
              <a href="/style/toDetail?seq=${i.seq }">
              	<img src="/upload/${i.imageSysName }" />
              </a>
            </div>
            
            <!-- 스타일 게시글 작성자 정보 출력 -->
            <div class="col-12">
              <div class="row">
              
                <div class="col-12 p-0">
                  <a href="/style/toStylePage?writer=${i.writer }"><img src="/upload/${i.profileSysName }" class="profileImg ms-2 me-2" style="border: 1px solid lightgray;"/></a>
                  <span class="styleWriter">@</span>
                  <span class="styleWriter swu"><a href="/style/toStylePage?writer=${i.writer }">${i.writer }</a></span>
                </div>
                
                <div class="col-12 mt-3 m-0">
                
                <!-- 좋아요 -->
                	<input type="hidden" value=${i.seq } class="seq">
               		<span class="heartSpan">
                       <img class="heart-empty img test" id="empty${status.count }" heart="empty" src="/icon/heart.png"/>
               		</span>
               		<span class="heartFullSpan">
                       <img class="heart-full img test" id="full${status.count }" heart="full" style="display: none;" src="/icon/heart-full.png" />
               		</span>
                  
	            	<c:if test="${isLoginOk == 1 }">
	                     <c:forEach var="j" items="${likeList }">
	                     	<c:if test="${j.parent_seq == i.seq}">
	                         <script language="javaScript">
	                            $("#full${status.count }").css("display", "");
	                            $("#empty${status.count }").css("display", "none");
	                         </script>
	                  		</c:if>
	                   </c:forEach>
	                </c:if>
	            
		            <c:if test="${i.likey == 0 }">
		                  <span class="me-1 heartCount"></span>
		            </c:if>
		            <c:if test="${i.likey != 0 }">
		                  <span class="me-1 heartCount">${i.likey }</span>
		            </c:if>
                  
             <!-- 댓글 -->     
                  <span class="commentSpan">
                    <img src="/icon/comment.png" />
                  </span>
                  
                  <c:if test="${i.replyCount == 0 }">
		          	<span class="commentCount"></span>
		          </c:if>
		          <c:if test="${i.replyCount != 0 }">
		          	<span class="commentCount"> ${i.replyCount } </span>
		          </c:if>
                  
                </div>
                
                <div class="col-12 contents">
                	<a href="/style/toDetail?seq=${i.seq }">${i.contents }</a>
                </div>
                
              </div>
            </div>
            
          </div>
          
        </div>
       </c:forEach>
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
    
    window.onpageshow = function(event) {
        if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
        // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
           location.reload();
             }
        }
    
    if("${error }" == "error") {
    	alert("더 이상 활동하지 않는 회원입니다.")
    	location.href="/style/toStyleMain"
    }
    
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
    
    $("#toStylePage").on("click",function(){
    	location.href="/style/toStylePage"
    })
    $(".toStyleWrite").on("click",function(){
    	location.href="/style/toStyleWrite"
    })
    
        // 좋아요
      $(".heartSpan").on("click", function(){
         let seq = $(this).siblings(".seq").val();
         if(${isLoginOk != 1 }){
            alert("로그인 후 사용가능한 기능입니다.");
            location.reload();
         }else{
            $.ajax({
               url:"/style/StyleLike",
               data: {seq: seq, id:"${loginId}" },
               success: function(resp){
                  if(resp == 1){
//                       alert("좋아요 등록");
                      location.reload();
                      }
                  }
               })
            }
         })
         
         $(".heartFullSpan").on("click", function(){
            let seq = $(this).siblings(".seq").val();

            $.ajax({
               url:"/style/StyleLike",
               data: {seq: seq, id:"${loginId}" },
               success: function(resp){
               if(resp == 0){
//                    alert("좋아요 취소");
                   location.reload();
                   }
               }
            })
         })
    </script>
</body>
</html>