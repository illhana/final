<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styleWrite.css" />
<!-- Google Fonts -->
<!-- All -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Sans:ital,wght@0,500;0,600;0,700;1,800&display=swap" rel="stylesheet" />
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- dropzone -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.2/dropzone.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.2/dropzone.min.css">


<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>

.dropzone * {
	text-align:center;
}

.dz-image img {
	width:670px;
	height:auto;
	object-fit:cover;
}

.dropzone {
	border : 2px solid lightgray;
	border-radius:21px;
	overflow:hidden;
}
.dz-preview {
	background-color:transparent !important;
	position:relative;
}
.dz-remove{
	z-index:1000;
	position:absolute;
	bottom:10px;
	left:50%;
	transform:translate(-50%);
	text-decoration:none;
	padding: 5px 7px !important;
	width:90px !important;
}
.dz-remove:hover{
	text-decoration:none;
}

.dz-thumbnail img { width: 100%; height:100%;}

.dropzone .dz-preview .dz-image {
	width: auto !important;
	height: auto !important;
}

.dz-preview, .dz-image-preview{
	width:100% !important;
	margin:0px !important;
}

.dropzone .dz-preview .dz-image img{
	max-width: 100%;
	max-height: 100%;
}

.dz-progress{
	display:none;
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
    
<!--     <form  action="/style/insert" method="post" enctype="multipart/form-data" class="dropzone"> -->
    
<!-- 		<div class="container mt-4 p-3"> -->
<!-- 	      <div class="row"> -->
<!-- 	        <div class="col-lg-3 col-md-1"></div> -->
<!-- 	        <div class="col-lg-6 col-md-10 draganddrop p-0 p-2 text-center needsclick dz-message"> -->
<!-- 	        	<img style="width:150px; height:150px;" class="mt-2" src="/icon/draganddrop.png"> -->
<!-- 	        	<p>업로드할 사진을 드래그하세요.</p> -->
<!-- 	        </div> -->
<!-- 			</div> -->
<!-- 		</div>    	 -->
    
<!--     </form> -->

    <!-- 글쓰기 -->
		<div class="container-fulid p-1" style="background-color:#f5f5f5;">
		<div class="container">
		<div class="p-0 m-0 pb-2" >
	      <div class="row">
	        <div class="col-lg-3 col-md-1"></div>
	        
	        <div class="col-lg-6 col-md-10 p-0 text-center dropzoneDiv mt-5 mb-4">
			<!-- 드래그앤드롭 -->
			<form action="/style/dropInsert" method="post" enctype="multipart/form-data" class="dropzone p-0" id="myDropzone">
	        	<div class="dz-message needsclick">
	        	<img style="width:150px; height:150px;" class="mt-2" src="/icon/draganddrop.png">
	        	<p>업로드할 사진을 드래그하거나 아이콘을 클릭하세요.</p>
	        	</div>
	        <input hidden type=file name="file" id="file" onchange="test(event);">
	       
	        <input type=hidden name=contents id=contents-input> 
			</form>
	        
	        </div>
	        
	        <div class="col-lg-6 col-md-10 image p-0 mb-4 mt-5" style="display:none">
	        </div>
	        <div class="col-lg-3 col-md-1"></div>
	      </div>
	      <form  action="/style/insert" method="post" enctype="multipart/form-data" class="p-0" id="insertForm">
	      <div class="row mt-3">
	        <div class="col-lg-3 col-md-1"></div>
	        <div class="col-lg-6 col-md-10 file p-1 ps-2">
	          <input type="file" name="styleFile" id="styleFile" accept="image/*" onchange="setThumbnail(event);" />
	          <label for="styleFile">
	            <img src="/icon/img.png" />
	          </label>
	        </div>
	        <div class="col-lg-3 col-md-1"></div>
	      </div>
	      <div class="row">
	        <div class="col-lg-3 col-md-1"></div>
	        <div class="col-lg-6 col-md-10 p-0">
<!-- 	          <div contenteditable="true" maxlength="5" class="contents" onpaste="myFunction(event)"></div> -->
<!-- 	        	<input type=text class="contentsInput contents" name="contents" maxlength=1000> -->
	        	<textarea class="contentsInput contents" id="contents" name="contents" maxlength=1000></textarea>
	        </div>
	        <div class="col-lg-3 col-md-1"></div>
	      </div>
	      </form>
	      <div class="row mt-4 mb-5">
	        <div class="col-12 text-center my-auto">
	          <button class="btn uploadBtn">업로드</button>
	        </div>
	      </div>
	      
	      	<div class="col-lg-2 col-md-1 "></div>
	      	</div>
	      	</div>
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
    
    Dropzone.autoDiscover = false;
    let myDropzone = new Dropzone(".dropzone", { 
       autoProcessQueue: false,
//        paramName: "list",
//        enctype: 'multipart/form-data',
       parallelUploads: 3, // Number of files process at a time (default 2)
       acceptedFiles: "image/*",
       uploadMultiple: false,
       timeout: 300000,
//        clickable: true,            // 클릭가능여부
       thumbnailHeight: null,        // Upload icon size
       thumbnailWidth: null,         // Upload icon size
       maxFiles: 1,                // 업로드 파일수
       maxFilesize: 10,            // 최대업로드용량 : 10MB
       addRemoveLinks: true,       // 삭제버튼 표시 여부
       dictRemoveFile: 'Delete',     // 삭제버튼 표시 텍스트
       init: function(){

    	   this.on("thumbnail", function(file, dataUrl) {
//                $('.dz-image').last().find('img').css({"width": "600px", "height": "600px", "object-fit": "cover"});
           });
    	   
           this.on("maxfilesexceeded", function (file) {
               alert("한 장만 업로드 할 수 있습니다.");
                this.removeFile(file);
            });
    	   
          this.on("error", function (file, errorMessage) {
             this.removeFile(file)
             
             if(errorMessage == "You can't upload files of this type.") {
                alert("이미지 파일만 업로드 할 수 있습니다.")
             } else if(errorMessage.includes("File is too big")) {
                alert("이미지 사이즈는 10MB 이내로 등록할 수 있습니다.")
             }
             
          });
          
          this.on("success", function(){
             if (this.getUploadingFiles().length === 0 && this.getQueuedFiles().length === 0) {
          	   location.href = "/style/toStyleMain"
                }
          })
          
       }
       
    });
    
    
   // 업로드 할 사진 미리보기
   	function setThumbnail(event){
	   
   		Dropzone.forElement("#myDropzone").removeAllFiles(true);
	   
   		let input = event.target

        if(input.files && input.files[0]) {
           // 첨부파일 사이즈 체크
           var maxSize = 10 * 1024 * 1024;
           var fileSize = input.files[0].size;

           if(fileSize > maxSize){
              alert("이미지 사이즈는 10MB 이내로 등록할 수 있습니다.");
              $(this).val('');
              return false;
           }
           
           // 첨부파일 확장자 체크
           pathpoint = input.value.lastIndexOf('.');
           filepoint = input.value.substring(pathpoint+1,input.length);
           filetype = filepoint.toLowerCase();
           
        // 정상적인 이미지 확장자 파일인 경우
           if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
        	   	$(".dropzoneDiv").css("display","none")
       			$(".image").css("display","block")
       		
       			let reader = new FileReader();
       		
       		 	reader.onload = function(event) {
       	          let img = document.createElement("img");
//        	          let src = event.target[0].result
       	          img.setAttribute("src", event.target.result);
       	          $(".image").empty();
       	          $(".image").append(img);
       	     	};

       	    	reader.readAsDataURL(event.target.files[0]);
           }else {
               alert('이미지 파일만 업로드 할 수 있습니다.');
               $(this).val("")
                  return false;
          }
   		}
   		$(".contents").focus();
    }		
    
    // form 가기 전 파일 선택 확인 및 업로드 확인
    	$(".uploadBtn").on("click",function(){
    		
     		if($(".contents").val().replace(/\s|　/gi, "").length == 0){
     			alert("내용을 입력해주세요.")
     			$(".contents").val("");
     			$(".contents").focus();
     			return false;
     		}
    		
     		// 드래그앤드롭 or 일반 파일 선택 구분
     		let file = $("#styleFile").get(0).files[0]
     		
            if(myDropzone.getQueuedFiles().length == 0 && file == null) {
                alert("업로드 할 사진을 한 장 골라주세요.")
                return false
             }
             
    		if(confirm("스타일 게시글을 업로드합니다.")){
	    		var contents = document.querySelector('textarea');
	    		
	    		// html 태그 막기
	    		let text = $(".contents").val();		
	        	let result = String(text).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
	            result = result.replaceAll(/(\n|\r\n)/g, '<br>');	    	    
	    		
	    		
	     		if(myDropzone.getQueuedFiles().length != 0 && file == null) {
// 	    		$("#contents-input").val(contents.value.replace("\r\n", '<br>'))
	    		$("#contents-input").val(result)
	     			myDropzone.processQueue()
	     		
	     		}else if(file != null && myDropzone.getQueuedFiles().length == 0 ){
// 	     			contents = contents.value.replace("\r\n", '<br>');
       	    		$(".contents").val(result)
	     			
	     			$("#insertForm").submit();
	       		 }
    		}else{
    			$(".contents").focus();
    			return false;
    		}
    	})

    </script>
</body>
</html>