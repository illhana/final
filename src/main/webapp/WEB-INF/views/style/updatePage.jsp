<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	// 줄바꿈
   pageContext.setAttribute("br","\n");
   pageContext.setAttribute("cn","<br>");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon.ico 로그인 시 콘솔창에 뜨는 거 제거 -->
<link rel="icon" href="data:,">
<link rel="shortcut icon" type="image/x-icon" href="/images/logo.png">
<title>Resellium | Style</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/updatePage.css" />
<!-- Google Fonts -->
<!-- All -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Sans:ital,wght@0,500;0,600;0,700;1,800&display=swap" rel="stylesheet" />
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
    
    <div class="container p-3">
    
    <!-- 프로필 헤더 -->
      <div class="row p-0 m-0">
        <div class="col-3 p-0"></div>
        <div class="col p-0">
          <img src="/upload/${sDto.profileSysName }" class="detailProfileImg me-2"style="border: 1px solid lightgray;" />
          <span class="profileWriter">@</span>
          <span class="profileWriter">${sDto.writer }</span>
        </div>
        <div class="col-3 p-0"></div>
      </div>
      
     <form action="/style/update" method="post" enctype="multipart/form-data" id="updateFrm" >
      <input type=hidden value=${sDto.seq } name=seq class="seq">
      <!-- 게시 이미지 -->
      <div class="row text-center p-0 mt-2">
        <div class="col-3 p-0"></div>
        <div class="col stImgDiv p-0">
          <img src="/upload/${sDto.imageSysName }" class="imageUpdate" />
          <input type=hidden id="sysNameSubmit" name=oriImageSysName value="${sDto.imageSysName }">
        </div>
        <div class="col-3 p-0"></div>
      </div>
      
      <!-- 게시글 내용 -->
      <div class="row ps-1 mt-4">
        <div class="col-3 p-0"></div>
        <div class="col p-1 file">
	        <input type="file" name="imageSysName" id="styleFile" accept="image/*" onchange="setThumbnail(event);" />
		    <label for="styleFile">
		    	<img src="/icon/img.png" />
		    </label>
        </div>
        <div class="col-3 p-0"></div>
      </div>
      <div class="row ps-1" >
        <div class="col-3 p-0"></div>
<!--         <div contenteditable="true" maxlength="1000" class="col p-2 mb-2 contents"> -->
<%--         	<div>${sDto.contents }</div> --%>
<!--         </div> -->
        <div class="col p-0 mb-2 ">
<%--         	<input type=text name=contents class="contents" value="${sDto.contents }" maxlength=1000> --%>
        	<textarea name=contents class="contents" maxlength=1000 >${fn:replace(sDto.contents, cn, br)}</textarea>
        </div>
        <div class="col-3 p-0"></div>
      </div>
      
      <div class="row mt-4 mb-5">
	  	<div class="col-12 text-center my-auto">
	    	<button class="btn uploadBtn">업로드</button>
	    	<button class="btn cancelBtn" type="button">취소</button>
	    </div>
	 </div>
    </form>
    </div>

<script>

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


	
	// 업로드 할 사진 미리보기
	function setThumbnail(event){
		let input = event.target
		// 첨부파일 사이즈 체크
        var maxSize = 10 * 1024 * 1024;
        var fileSize = input.files[0].size;

        if(fileSize > maxSize){
           alert("이미지 사이즈는 10MB 이내로 등록 가능합니다.");
           $(this).val('');
           return false;
        }
        
        // 첨부파일 확장자 체크
        pathpoint = input.value.lastIndexOf('.');
        filepoint = input.value.substring(pathpoint+1,input.length);
        filetype = filepoint.toLowerCase();
        
     // 정상적인 이미지 확장자 파일인 경우
        if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
    		$(".imageUpdate").css("display","none");
    		let reader = new FileReader();
    		
    		 reader.onload = function(event) {
    			 let img = document.createElement("img");
    	          img.setAttribute("src", event.target.result);
    	          $(".stImgDiv").empty();
    	          $(".stImgDiv").append(img);
    	     };

    	     reader.readAsDataURL(event.target.files[0]);
        }else {
            alert('이미지 파일만 업로드 하실 수 있습니다.');
            $(this).val("")
               return false;
       }
       $(".contents").focus();
	}
		
	
	$(".uploadBtn").on("click",function(){
		// 글쓰기란 빈 값
		if($(".contents").val().replace(/\s|　/gi, "").length == 0){
			alert("내용을 입력해주세요.")
			$(".contents").val("");
			$(".contents").focus();
			return false;
		}
		
		// html 태그 막기
		let text = $(".contents").val();		
    	let result = String(text).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
        result = result.replaceAll(/(\n|\r\n)/g, '<br>');

		if(confirm("게시글을 수정합니다.")){
			
			/* div의 contents 내용을 input의 value에 넣어준다. */
			$(".contents").val(result)
			$("#updateFrm").submit();
		}else{
			$(".contents").focus();
			return false;
		}
		
	})
	
	$(".cancelBtn").on("click",function(){
		location.href="/style/toDetail?seq="+$(".seq").val();
	})
</script>


</body>
</html>