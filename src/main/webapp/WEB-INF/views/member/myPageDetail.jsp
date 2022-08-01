<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- 카카오 API -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
#zipcode{
	width: 220px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom-color: #dcdcdc;
	margin-bottom: 15px;
}

.editable {
	width: 350px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom-color: #dcdcdc;
	margin-bottom: 15px;
}
.btnNoStyle1{
	width: 350px; 
	height: 45px; 
	background-color: #222222;
}

.btnNoStyle2{
	width: 175px; 
	height: 45px; 
	background-color: #222222;
}

body{overflow-x:hidden;}

.filebox label {
       display: inline-block;
       padding: 7px 13px;
       min-height:33.5px;
       color: white;
       background-color: black;
       cursor: pointer;
       margin-left: 9px;
          margin-right: 7px;
          margin-top: 12px;
          border-radius:4px;
          font-weight:normal;
   }

   .filebox input[type="file"] {
       position: absolute;
       width: 0;
          height: 0;
          padding: 0;
       overflow: hidden;
       border: 0;
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

<!-- mypageDatail -->
   <form action="/member/update" method=post enctype="multipart/form-data"
      id="form">
      <div class="container-menu">
         <div class="row p-5">
            <div class="col-6" style="height: auto; width: 250px;">
               <div class="row" style="margin-bottom:50px;">
                  <div class="col-12 mb-2 m-0 cs">
                     <a href="/member/myPage" style="text-decoration: none; color: black;"><h3 style="margin-bottom: 25px; font-weight: bold;">마이 페이지</h3></a>
                  </div>
                  <div class="col-12 mb-2 m-0 " style="color: #bebebe;">
                     <a href="/member/purchaseBid" style="text-decoration: none; color: black;">구매내역</a>
                  </div>
                  <div class="col-12 mb-2 m-0 " style="color: #bebebe;">
                     <a href="/member/saleBid" style="text-decoration: none; color: black;">판매내역</a>
                  </div>
                  <div class="col-12 mb-2 m-0 " style="color: #bebebe;">
                     <a href="/member/myProduct" style="text-decoration: none; color: black;">관심상품</a>
                  </div>
                  <div class="col-12 mb-2 m-0 " style="color: #bebebe;">
                     <a href="/member/myPageDetail"
                        style="text-decoration: none; color: black; font-weight: bold;">프로필정보</a>
                  </div>
               </div>
            </div>
            <div class="col-9 sm-12">
               <div class="row">
                  <h3 style="font-weight: bold;">프로필정보</h3>
                  <div class="col-12 mb-3 m-0"
                     style="width: 948px; height: 200px; min-width:400px; border-top: solid 4px black; border-bottom: solid 1px #dcdcdc;">
                     <div class="row">
                        <div class="col-12 pt-3">
                           <div class="row">
                              <div class="col-2" style="min-width:140px;">
                                 <img src="/upload/${dto.imageSysName }" style="width: 120px; height: 120px; object-fit: cover; border-radius: 50%; border: 1px solid #5f686db4;" id=img class="profileImg">
                              </div>
                              <div class="col-5" style="padding-top:30px; padding-left:20px;">
                                 <span style="font-size:2rem;">${loginId } 님</span>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-12 p-0 m-auto" id="test">
<!--                         <input type=file name=file id=file class="button" style="display: none; margin-top: 10px;" accept='image/*'> -->
                        </div>
                     </div>

                  </div>
                  <!-- 프로필 수정 -->
                  <div class="row">
                     <div class="col-12 mb-2">이름 : ${dto.name}</div>
                  </div>
                  <div class="row">
                     <div class="col-12 mb-2">전화번호</div>
                     <div class="col-12">
                        <input maxlength="13" type="text" value="${dto.phone}" name="phone" id="phone"
                           class="editable" disabled />
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-12 mb-2">이메일</div>
                     <div class="col-12">
                        <input maxlength="50" type="text" value="${dto.email }" name="email" id="email"
                           class="editable" disabled />
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-12 mb-2">우편번호</div>
                     <div class="col-12 zipcodeInput" style="display:inline-block; min-width:380px;">
                        <input maxlength="5" type="text" value="${dto.zipcode }" name="zipcode"
                           id="zipcode" class="editable" disabled />
                        <button type="button" id="search" class="btn text-white ms-3 m-0" style="display: none;
                         width: 90px; height: 42px; background-color:#222222;">찾기</button>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-12 mb-2">도로명 주소</div>
                     <div class="col-12">
                        <input maxlength="50" type="text" value="${dto.roadAddress }"
                           name="roadAddress" id="roadAddress" class="editable" disabled />
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-12 mb-2">지번 주소</div>
                     <div class="col-12">
                        <input maxlength="50" type="text" value="${dto.jibunAddress }"
                           name="jibunAddress" id="jibunAddress" class="editable" disabled />
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-12 mb-2">상세 주소</div>
                     <div class="col-12">
                        <input maxlength="50" type="text" value="${dto.specAddress }"
                           name="specAddress" id="specAddress" class="editable" disabled />
                     </div>
                  </div>
                     <div class="row">
                     <div class="col-12 mb-1">개인질문답변 : ${dto.personalAnswer}</div>
                  </div>
                  </div>
                  <div class="col-12 mt-3" id="btns" style="min-width:370px;">
                     <button type="button" id="modify" class="btn text-white btnNoStyle1">수정하기</button>
                  </div>
                  <div class="col-12 mt-3">
                     <a href="#" style="color: #222222; font-size: 1.1em;" id="memberOut">탈퇴하기</a>&nbsp;&nbsp;
                     <a href="/member/myPagePw" style="color: #222222; font-size: 1.1em;" id="pwUpdate">비밀번호 재설정</a>
                  </div>
               </div>
            </div>
         </div>
   </form>

   <script>
   
      //phone 중복검사
      $("#phone").on("blur", function(){
    	  
    	 if($("#phone").val() != "${dto.phone }") {
    		 
	         let phone = $("#phone").val()
	         
	         $.ajax({
	            url:"/member/phoneDuplCheck",
	            data:{ phone : phone.replaceAll("-", "") }
	         }).done(function(resp){
	            if(resp == 'true'){
	                  alert("이미 가입 된 번호입니다.")
	               $("#phone").val("")
	               $("#phone").focus()
	               return false
	            }
	         })
	         
    	 }
    	 
      })
      
      //email 중복검사
         $("#email").on("blur", function(){
        	 
        	if($("#email").val() != "${dto.email }") { 
        	 
	            $.ajax({
	               url:"/member/emailDuplCheck",
	               data:{ email : $("#email").val() }
	            }).done(function(resp){
	               if(resp == 'true'){
	                     alert("이미 가입 된 이메일입니다.")
	                  $("#email").val("")
	                  $("#email").focus()
	                  return false
	               }
	            })
        	}    
	            
         })   
   
      $("#modify").on("click", function() {
         
         //파일 버튼
         let td = $("<td class='td filebox'>")
          let label = "<label for='file'>프로필 이미지 등록</label>"
          let inputProfileImage = "<input type=file style='width:77px; margin:auto; margin-bottom:10px;' name='file' id='file' accept='image/*'>"
          
          td.append(label)
          td.append(inputProfileImage)
          $("#test").append(td)
          
          
         
         $(".editable").removeAttr("disabled");
           $(this).css("display", "none");

           let ok = $("<button>");
           ok.text("수정완료");
           ok.attr("class", "ok btn text-white btnNoStyle2");

           let cancel = $("<button>"); 
           cancel.text("취소");
           cancel.attr("class", "btn text-white btnNoStyle2");
           cancel.attr("type", "button");
           cancel.on("click", function () {
             location.reload();
           });
           
           $("#btns").append(ok);
           $("#btns").append("&nbsp;&nbsp;")
           $("#btns").append(cancel);

         //버튼보이게 하나
         $("#file").css("display", "")
         $("#search").css("display", "")
         
          // 카카오 지도 api
         document.getElementById("search").onclick = execDaumPostcode;
      
         function execDaumPostcode() {
            new daum.Postcode(
                  {
                     oncomplete : function(data) {
      
                        document.getElementById('zipcode').value = data.zonecode;
                        document.getElementById("roadAddress").value = data.roadAddress;
                        document.getElementById("jibunAddress").value = data.jibunAddress;
      
                     }
                  }).open();
         }
           
//          });
      
      //file 제한
      
      $("#file").on("change", function(e){
                let input = e.target

                if(input.files && input.files[0]) {
                   // 첨부파일 사이즈 체크
                   var maxSize = 5 * 1024 * 1024;
                  var fileSize = input.files[0].size;

                  if(fileSize > maxSize){
                     alert("이미지 사이즈는 5MB 이내로 등록 가능합니다.");
                     $(this).val('');
                     return false;
                  }
                   
                   // 첨부파일 확장자 체크
                   pathpoint = input.value.lastIndexOf('.');
                  filepoint = input.value.substring(pathpoint+1,input.length);
                  filetype = filepoint.toLowerCase();
                  
                  // 정상적인 이미지 확장자 파일인 경우
                  if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
                     let reader = new FileReader()
                       reader.onload = e => {
                             $(this).siblings().attr("src", e.target.result)
                             $(this).siblings().css("border", "none")
                       }

                       reader.readAsDataURL(input.files[0])

                  } else {
                     alert('이미지 파일만 업로드 하실 수 있습니다.');
                  $(this).val("")

                     return false;
                  }
                   
                }
               
            })

            
            
      //    프로필 미리보기 
         $(function() {
         $("#file").on('change', function() {
            readURL(this);
            });
         });
         function readURL(input) {
         if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function(e) {
         $('#img').attr('src', e.target.result);
                     }
         reader.readAsDataURL(input.files[0]);
            }
         }
         
      });
      
         
         
         //정규식 검사 
         $("#form").on("submit",function() {
            let phoneRegex = /^01[\d]-?\d{3,4}-?\d{4}$/;
            //let emailRegex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
            let emailRegex = /^([a-zA-Z0-9])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{3}$/;
            let zipcodeRegex = /^\d{5}$/;
            let blankPattern = /^\s+|\s+$/g;
            let blank = /\s/g;
            // 핸드폰 검사
            if ($("#phone").val() == "") {
               alert("휴대폰 번호를 입력해주세요.")
               $("#phone").focus()
               return false
            } else if (phoneRegex.test($("#phone").val()) == false) {
               alert("휴대전화번호를 형식에 맞게 입력해주세요.");
               $("#phone").val("")
               $("#phone").focus()
               return false
            }
            // 이메일 검사
            if ($("#email").val() == "") {
               alert("이메일을 입력해주세요.")
               $("#email").focus()
               return false
            } else if (emailRegex.test($("#email").val()) == false) {
               alert("이메일 형식에 맞게 입력하세요.");
               $("#email").focus()
               return false
            }

          //zip code
         if ($("#zipcode").val() == "" || $("#zipcode").val().replace(blankPattern, '') == "") {
         alert("우편번호를 입력해주세요.");
         $("#zipcode").focus();
         return false;
         }else if (zipcodeRegex.test($("#zipcode").val()) == false) {
         	alert("우편번호는 숫자 5자리로 입력해주세요.")
         	$("#zipcode").val("")
         	$("#zipcode").focus()
         	return false
         }

            if ($("#roadAddress").val() == "" || $("#roadAddress").val().replace(blankPattern, '') == "") {
               alert("도로명주소를 입력해주세요.");
               $("#roadAddress").focus();
               return false;
            }

            if ($("#jibunAddress").val() == "" || $("#jibunAddress").val().replace(blankPattern, '') == "") {
               alert("지번주소를 입력해주세요.");
               $("#jibunAddress").focus();
               return false;
            }

            if ($("#specAddress").val() == "" || $("#specAddress").val().replace(blankPattern, '') == "") {
               alert("세부주소를 입력해주세요.");
               $("#specAddress").focus();
               return false;
            }
            
            if(confirm("프로필을 수정하시겠습니까?")) {
               return true;
            } else {
               return false;
            }
            
         });
         
           
           //-제거
           let phone = $("#phone").val()
         $("#phone").val(phone.replaceAll("-", ""))
         
         $("#memberOut").on("click", function(){
            Swal.fire({
                 title: "정말 탈퇴하시겠습니까?",
                 text: "탈퇴 후에는 계정 복구가 불가능합니다.",
                 icon: 'warning',
                 showCancelButton: true,
                 confirmButtonColor: '#3085d6',
                 cancelButtonColor: '#d33',
                 confirmButtonText: "네, 탈퇴할래요",
                 cancelButtonText: "아뇨! 다시생각할래요"
               }).then((result) => {
                 if (result.isConfirmed) {
                   Swal.fire(
                     '탈퇴되었습니다',
                     '다음에 다시 만나요',
                     'success'
                   ).then(function(){
                      location.href="/member/memberOut"
                   })
                 }
               })
         })

   </script>

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
