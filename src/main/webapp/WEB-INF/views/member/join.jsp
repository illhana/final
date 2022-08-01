<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- favicon.ico 로그인 시 콘솔창에 뜨는 거 제거 -->
<link rel="icon" href="data:,">
<link rel="shortcut icon" type="image/x-icon" href="/images/logo.png">
<title>Resellium | 리셀리움</title>
<!-- CSS External -->
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css?ver=1" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/navbar.css?ver=1" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/home.css?ver=1" />
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/joinForm.css?ver=1" />
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
<!-- SweetAlert CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- 카카오 API -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

	<!-- 회원가입  -->
	<div class="container mt-5 text-center">
		<div class="row mt-5">
			<div class="col mb-4">
				<h3 style="font-weight: bold">회원가입</h3>
			</div>
		</div>
		<form action="/member/signUp" method="post" id="form">
			<div class="row text-center">
				<div class="col-12 mb-2">
					<h6 align="left" style="width: 350px; margin:auto;">아이디</h6><br>
					<input maxlength="15" type="text" name="id" id="id" class="inputFormId" />
					<button type="button" id="duplCheck" class="btn text-white ms-3 m-0" style="width: 90px; height: 42px; background-color:#222222;">중복검사</button>
				</div>
				<div class="col-12 mb-2">
					<h6 align="left" style="width: 350px; margin:auto;">비밀번호</h6><br>
					<input maxlength="16" type="password" name="pw" id="pw" class="inputForm"/>
				</div>
				<div class="col-12 mb-2">
					<h6 align="left" style="width: 350px; margin:auto;">비밀번호확인</h6><br>
					<input maxlength="16" type="password" name="pwCheck" id="pwCheck" class="inputForm"/>
					 <div><span id="pwBox"></span></div>
				</div>
				<div class="col-12 mb-2">
					<h6  align="left" style="width: 350px; margin:auto;">이름</h6><br>
					<input maxlength="5" type="text" name="name" id="name" class="inputForm"/>
				</div>
				<div class="col-12 mb-2">
					<h6 align="left" style="width: 350px; margin:auto;">연락처</h6><br>
					<input maxlength="13" type="text" name="phone" id="phone" class="inputForm"/>
				</div>
				<div class="col-12 mb-2">
					<h6 align="left" style="width: 350px; margin:auto;">이메일</h6><br>
					<input maxlength="50" type="text" name="email" id="email" class="inputForm"/>
				</div>
				<div class="col-12 mb-2">
					<h6 align="left" style="width: 350px; margin:auto;">우편번호</h6><br>
					<input maxlength="5" type="text" name="zipcode" id="zipcode" class="inputFormId"/>
					<button type="button" id="search" class="btn text-white ms-3 m-0" style="width: 90px; height: 42px; background-color:#222222;" >찾기</button>
				</div>
				<div class="col-12 mb-2">
					<h6 align="left" style="width: 350px; margin:auto;">도로명주소</h6><br>
					<input maxlength="50" type="text" name="roadAddress" id="roadAddress" class="inputForm"/>
				</div>
				<div class="col-12 mb-2">
					<h6 align="left" style="width: 350px; margin:auto;">지번주소</h6><br>
					<input maxlength="50" type="text" name="jibunAddress" id="jibunAddress" class="inputForm"/>
				</div>
				<div class="col-12 mb-2">
					<h6 align="left" style="width: 350px; margin:auto;">상세주소</h6><br>
					<input maxlength="50" type="text" name="specAddress" id="specAddress" class="inputForm"/>
				</div>
				<div class="col-12 mb-2">
					<h6 align="left" style="width: 350px; margin:auto;">나의 보물 1호는?</h6><br>
					<input maxlength="50" type="text" name="personalAnswer" id="personalAnswer" class="inputForm"/>
				</div>
				<div class="col-12 mt-3 mb-4 login-action">
					<div class="row loginOption">
						<div class="col-12">
							<input type="submit" value="가입하기" id="signUp" class="btn text-white" style="width: 350px; height: 45px; background-color:#222222;">
						</div>
					</div>
				</div>
			</div>
		</form>
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
	
	let isDuplCheckDone = 0;
	// 아이디 중복검사
	$("#duplCheck").on("click", function(){
		let idRegex = /^[a-z][a-z\d_]{5,13}$/g;
		
		if($("#id").val() == "") {
			alert("아이디를 입력해주세요.")
			$("#id").focus()
			return false
		} else if(idRegex.test($("#id").val()) == false) {
			alert("아이디는 6~14자의 소문자, 숫자, '_' 만 사용 가능하며 숫자와 '_' 는 첫 글자로 올 수 없습니다.")
			$("#id").val("")
			$("#id").focus()
			return false
		}
		
		$.ajax({
			url: "/member/idDuplCheck",
			data : {id : $("#id").val()},
		}).done(function(resp){
			if(resp == 'true') {
				alert("이미 존재하는 아이디입니다.")
				$("#id").val("")
				$("#id").focus()
				
			} else {
				if(confirm("사용가능한 아이디입니다. 사용하시려면 확인을 눌러주세요.")) {
					$("#pw").focus()
					isDuplCheckDone = $("#id").val();
				} else {
					$("#id").val("")
					$("#id").focus()
				}
			}
		})
		
	})
	
	// 패스워드 일치 확인
		$("#pwCheck").on("input", function(){
			if($("#pwCheck").val() != "") {
				if($("#pw").val() == $(this).val()) {
					$("#pwBox").text("패스워드가 일치합니다.").css("color", "dodgerblue")
					isPwCheckDone = 1
				} else {
					$("#pwBox").text("패스워드가 일치하지 않습니다.").css("color", "red")
					isPwCheckDone = 0
				}
			} else {
	        	$("#pwBox").text("")
	        }
		})
		
		$("#pw").on("input", function(){
	        if($("#pwCheck").val() != "") {
		        if($("#pwCheck").val() == $(this).val()) {
		           $("#pwBox").text("패스워드가 일치합니다.").css("color", "dodgerblue")
		           isPwCheckDone = 1
		        } else {
		           $("#pwBox").text("패스워드가 일치하지 않습니다.").css("color", "crimson")
		           isPwCheckDone = 0
		        }
	        } else {
	        	$("#pwBox").text("")
	        }
      	})
      	
      //phone 중복검사
            $("#phone").on("blur", function(){
               $.ajax({
                  url:"/member/phoneDuplCheck",
                  data:{ phone : $("#phone").val() }
               }).done(function(resp){
                  if(resp == 'true'){
                      alert("이미 가입 된 번호입니다.")
                     $("#phone").val("")
                     $("#phone").focus()
                     return false
                  }
               })
            })
            
      //email 중복검사
            $("#email").on("blur", function(){
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
            })   	
      	
// 유효성 검사
      $("#form").on("submit", function(e){
         let idRegex = /^[a-z][a-z\d_]{5,13}$/;
         let pwRegex = /.{8,16}/;
         let nameRegex = /^[가-힣]{2,5}$/;
         let phoneRegex = /^01[\d]-?\d{3,4}-?\d{4}$/;
//          let emailRegex = /^[a-zA-Z0-9+-\_.]+[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
         let emailRegex = /^([a-zA-Z0-9])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{3}$/;
         let zipcodeRegex = /^\d{5}$/;
         let blankPattern = /^\s+|\s+$/g;
         let blank = /\s/g;
         
         // 아이디 검사
         if ($("#id").val() == "") {
                alert("아이디를 입력해주세요.")
                $("#id").focus()
                return false
            } else if (idRegex.test($("#id").val()) == false) {
                alert("아이디는 6~14자의 소문자, 숫자, '_' 만 사용 가능하며 숫자와 '_' 는 첫 글자로 올 수 없습니다.")
                $("#id").val("")
                $("#id").focus()
                return false
            
         // 패스워드 검사
         }else if ($("#pw").val() == "") {
                alert("비밀번호를 입력해주세요.")
                $("#pw").focus()
                return false
         }else if ($("#pw").val().match(blank) || $("#pw").val().replace(blankPattern, '') == "") {
                alert("비밀번호에는 공백을 사용하실 수 없습니다.")
                $("#pw").focus()
                return false
            } else if (pwRegex.test($("#pw").val()) == false) {
                alert("PW는 8~16자로 구성되어야 합니다.")
                $("#pw").val("")
                $("pw_check").val("");
                $("#pw").focus()
                return false
                
             // 비번 일치 체크
            }  else if ($("#pw").val() != $("#pwCheck").val()) {
                alert("pw가 일치하지 않습니다. 다시입력해주세요.")
                $("#pw").val("")
                $("#pwCheck").val("")
                $("#result").val("")
                $("#pw").focus()
                return false
                
         // 이름 검사
            }else if ($("#name").val() == "") {
                alert("이름을 입력해주세요.")
                $("#name").focus()
                return false
            } else if (nameRegex.test($("#name").val()) == false) {
               alert("이름은 한글 2~5자로 입력해주세요.");
                $("#name").val("")
                $("#name").focus()
                return false
            
         // 핸드폰 검사
            }else if ($("#phone").val() == "") {
                alert("휴대폰 번호를 입력해주세요.")
                $("#phone").focus()
                return false
            } else if (phoneRegex.test($("#phone").val()) == false) {
               alert("휴대전화번호를 형식에 맞게 입력해주세요.");
                $("#phone").val("")
                $("#phone").focus()
                return false
            
         // 이메일 검사
            }else if ($("#email").val() == "") {
                alert("이메일을 입력해주세요.")
                $("#email").focus()
                return false
            }else if (emailRegex.test($("#email").val()) == false) {
               alert("이메일 형식에 맞게 입력하세요.");
                $("#email").val("")
                $("#email").focus()
                return false
            //zip code
            }else if ($("#zipcode").val() == "" || $("#zipcode").val().replace(blankPattern, '') == "") {
            alert("주소를 입력해주세요.");
            $("#zipcode").focus();
            return false;
            }else if (zipcodeRegex.test($("#zipcode").val()) == false) {
            	alert("우편번호는 숫자 5자리로 입력해주세요.")
            	$("#zipcode").val("")
            	$("#zipcode").focus()
            	return false
            
         }else if ($("#roadAddress").val() == "" || $("#roadAddress").val().replace(blankPattern, '') == "") {
               alert("도로명주소를 입력해주세요.")
               $("#roadAddress").focus()
               return false
            }else if ($("#jibunAddress").val() == "" || $("#jibunAddress").val().replace(blankPattern, '') == "") {
               alert("지번주소를 입력해주세요.")
               $("#jibunAddress").focus()
               return false
            } else if ($("#specAddress").val() == "" || $("#specAddress").val().replace(blankPattern, '') == "") {
               alert("상세주소를 입력해주세요.")
               $("#specAddress").focus()
               return false
            // 개인질문답변
            } else if ($("#personalAnswer").val() == "" || $("#personalAnswer").val().replace(blankPattern, '') == "") {
               alert("개인질문답변을 입력해주세요.")
               $("#personalAnswer").focus()
               return false
               
            // 중복체크 했는지 확인
            } else if (isDuplCheckDone == 0 || isDuplCheckDone != $("#id").val()) {
               alert("아이디 중복체크를 해주세요.")
               return false
               
            // 가입완료
            } else {
            e.preventDefault()
             
             Swal.fire({
                title : "Welcome!",
                text : "회원가입이 완료되었습니다!",
                icon : "success"
             }).then(function(){
            	 let phone = $("#phone").val()
                 $("#phone").val(phone.replaceAll("-", ""))
            	 
                 document.getElementById("form").submit()
             })
            }
      });
	</script>
</body>
</html>
