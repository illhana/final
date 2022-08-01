<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
   pageContext.setAttribute("br","<br />");
   pageContext.setAttribute("cn","\n");
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styleMain.css" />
<!-- Google Fonts -->
<!-- All -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Sans:ital,wght@0,500;0,600;0,700;1,800&display=swap" rel="stylesheet" />
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!--  jQuery CDN  -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
	.newMessage:hover{
		cursor:pointer;
		background-color:black !important;
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

    <!-- 스타일 페이지 메뉴 -->
    <div class="container">
      <div class="row mt-4">
        <div class="col-12">
          <div class="row">
            <div class="col-12 text-center style">STYLE</div>
            <!-- <div class="col-4"></div> -->
          </div>
        </div>
      </div>
      <div class="row btnbar text-center">
        <div class="col-md-4 col-none"></div>
        <div class="col-md-4 col-12 my-auto">
          <button class="btn detailMainBtn" type="button" id="current" >#최신</button>
          <button class="btn detailMainBtn" type="button" id="famous">#인기</button>
        </div>
        <div class="col-md-4 col-12 text-end my-auto">
        <c:choose>
	        <c:when test="${loginId == 'admin1234' }"></c:when>
	        <c:otherwise>
	          <button class="btn btn-style toStyleWrite">스타일 올리기</button>
	          <button class="btn btn-style toMyStylePage">내 스타일</button>
	        </c:otherwise>
        </c:choose>
        </div>
      </div>
    </div>

    <!-- 배너&멀티채팅 -->
    <div class="container">
      <div class="row">
        <div class="col-12 col-md-7 banner">
          <img src="/images/styleBanner_02.gif" />
        </div>
        <!-- 채팅 -->
        <div class="col-12 col-md-5 chatDiv">
          <div class="col-12 chatResult"></div>
          <div class="col-12 fileDiv">
            <input type="file" name="file" id="file" accept="image/*" style="display: none" />
            <label class="fileBtn" for="file" >
            	&nbsp;&nbsp;
            	<img style="width: 25px; height: 25px" src="/icon/clip.png" class="pb-1" />
            </label>
          </div>
          <div class="col-12 chatInputDiv">
<!--             <div contenteditable="true" class="chatInput" maxlength="10"></div> -->
<!-- 			<input type=text class=chatInput maxlength=300 placeholder="회원들과 스타일을 공유하고 대화를 나눠보세요."> -->
			<textarea class=chatInput maxlength=300 placeholder="회원들과 스타일을 공유하고 대화를 나눠보세요." style="resize: none;"></textarea>
			
          </div>
        </div>
      </div>
    </div>

    <!-- Style 출력(최신순) -->
    <div class="container p-0 current" id="currentCon">
      <div class="row mt-5 m-0 stList">
      
      <c:forEach var = "i" items = "${list }" varStatus="status">
        <div class="col-6 col-lg-3 md-Mb">
          <div class="row p-2">
            <!-- 스타일 게시글 이미지 출력 -->
            <div class="col-12 stImgDiv">
            	<a href="/style/toDetail?seq=${i.seq }">
            		<img src="/upload/${i.imageSysName }" />
            	</a>
            </div>
            <!-- 스타일 게시글 작성자 정보 출력 -->
            <div class="col-12 mt-3 m-0">
              <div class="row">
              
                <div class="col-12 p-0">
                  <a href="/style/toStylePage?writer=${i.writer }"><img src="/upload/${i.profileSysName }" class="profileImg ms-2 me-2" style="border:1px solid lightgray;" /></a>
                  <span class="styleWriter">@</span>
                  <span class="styleWriter swu">
                   <a href="/style/toStylePage?writer=${i.writer }">${i.writer }</a>
                  </span>
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
                  <a href="/style/toDetail?seq=${i.seq }">${fn:replace(i.contents , cn, br) }</a>
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
    
    let alarmExist = 0
    
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
    
    
 	// 멀티채팅
	let ws = new WebSocket("ws://218.144.199.10/chat");

	ws.onopen = function(list){
			$.ajax({
				url:"/chat/onOpen",
				type: "POST",
				dataType: "json"
			}).done(function(list){
				for(let i = 0; i < list.length; i++){
						let br = $("<br>");
						// msg 텍스트 출력
						if(list[i].contents != null){
							// 보낸 메세지
							if(list[i].writer == "${loginId}"){
								$(".chatResult").append("<div style='text-align:right;'><span class='writeDate'>"+list[i].formedDate+"</span><span class='fromMe' style='text-align:left; background-color:#FEE233; word-break:break-all; margin-left:5px;'>" + list[i].contents + "</span>");
								$(".chatResult").scrollTop($(".chatResult").prop("scrollHeight"));
							// 받은 메세지
							}else{
								$(".msg").css("background-color","white")
								$(".chatResult").append("<div class='test' style='text-align:left;'><div style='margin-bottom:5px;'> <img src='/upload/" + list[i].profileSysName + "' style='width:42px; height:42px; border-radius:50%; border:1px solid #f4f4f4; vertical-align:middle; object-fit:cover;'>&nbsp;"+ list[i].writer+"</div><span class='msg' style='text-align:left; background-color:white; word-break:break-all; margin-right:5px;'>" + list[i].contents + "</span><span class='writeDate'>" + list[i].formedDate);
							
								$(".chatResult").scrollTop($(".chatResult").prop("scrollHeight"));
							}
						// msg 이미지 출력
						}else{
							// 보낸 메세지
							if(list[i].writer == "${loginId}"){
								let div = $("<div style='text-align:right;'></div>")
								let date = $("<span class='writeDate'>"+list[i].formedDate+"</span>")
								let img = $("<img class='msgImg' onclick='imageClick(this.src)' style='width:200px; height:200px; text-align:left; margin-left:5px; border:1px solid lightgray; object-fit:cover;' src=/upload/"+encodeURI(list[i].imageSysName)+">")
								
								div.append(date)
								div.append(img)
								$(".chatResult").append(div)
								$(".chatResult").scrollTop($(".chatResult").prop("scrollHeight"));
							// 받은 메세지
							}else{
								let div = $("<div style='text-align:left;'></div>")
								
								let writer = $("<div style='margin-bottom:5px;'><img src='/upload/" + list[i].profileSysName + "' style='width:42px; height:42px; border-radius:50%; border:1px solid #f4f4f4; vertical-align:middle; object-fit:cover;'>&nbsp;"+ list[i].writer+"</div>")
								let img = $("<img class='msgImg' onclick='imageClick(this.src)' style='width:200px; height:200px; text-align:left; margin-left:5px; border:1px solid lightgray; object-fit:cover;' src=/upload/"+encodeURI(list[i].imageSysName)+">")
								let date = $("<span class='writeDate'>"+list[i].formedDate+"</span>")
								
								div.append(writer)
								div.append(img)
								div.append(date)
								$(".chatResult").append(div)
							
								$(".chatResult").scrollTop($(".chatResult").prop("scrollHeight"));
							}
						}
						$(".chatResult").append(br);
					}
			})
		}
		
	ws.onmessage = function(e){ 
		let data = JSON.parse(e.data);
		
	if(data.writer == "${loginId}"){
		if(data.imageSysName != null){
			
			let div = $("<div class='chatMsgDiv' style='text-align:right;'></div>")
			let date = $("<span class='writeDate'>"+data.formedDate+"</span>")
			let img = $("<img class='msgImg' onclick='imageClick(this.src)' style='width:200px; height:200px; object-fit:cover; margin-left:5px; border::1px solid lightgray' src=/upload/"+encodeURI(data.imageSysName)+">")
			
			
			div.append(date)
			div.append(img)
			$(".chatResult").append(div)
		}else if(data.contents != null){
				$(".chatResult").append("<div style='text-align:right;'><span class='writeDate'>"+data.formedDate+"</span><span class='fromMe' style='text-align:left; background-color:#FEE233; word-break:break-all; margin-left:5px;'>"+data.contents+"</span>");
			}
		let br = $("<br>");
		$(".chatResult").append(br);
		$(".chatResult").scrollTop($(".chatResult").prop("scrollHeight"));
		
	}else{
		
		if(data.imageSysName != null){
			
			let div = $("<div style='text-align:left;'></div>")
			
			let writer = $("<div style='margin-bottom:5px;'><img src='/upload/" + data.profileSysName + "' style='width:42px; height:42px; border-radius:50%; border:1px solid #f4f4f4; vertical-align:middle; object-fit:cover;'>&nbsp;"+ data.writer+"</div>")
			let img = $("<img class='msgImg' onclick='imageClick(this.src)' style='width:200px; height:200px; text-align:left; margin-left:5px; border:1px solid lightgray; object-fit:cover;' src=/upload/"+encodeURI(data.imageSysName)+">")
			let date = $("<span class='writeDate'>"+data.formedDate+"</span>")
			
			div.append(writer)
			div.append(img)
			div.append(date)
			$(".chatResult").append(div)
			
			}else if(data.contents != null){
				$(".msg").css("background-color","white")
				$(".chatResult").append("<div class='test' style='text-align:left;'><div style='margin-bottom:5px;'> <img src='/upload/" + data.profileSysName + "' style='width:42px; height:42px; border-radius:50%; border:1x solid #f4f4f4; vertical-align:middle; object-fit:cover;'>&nbsp;"+ data.writer+"</div><span class='msg' style='text-align:left; background-color:white; word-break:break-all; margin-right:5px;'>" + data.contents + "</span><span class='writeDate'>" + data.formedDate);
//						$(".chatResult").append("<div style='text-align:left;'><span class='writeDate'>"+data.formedDate+"</span><span class='fromMe' style='text-align:left; background-color:#FEE233; word-break:break-all; margin-left:5px;'>"+data.contents+"</span>");
			}
		
		let br = $("<br>");
		$(".chatResult").append(br);

		let scrollTop = $(".chatResult").scrollTop();
        let innerHeight = $(".chatResult").innerHeight();
        let scrollHeight = $(".chatResult").prop('scrollHeight');
        
        if (scrollTop + innerHeight + 280 >= scrollHeight) {
        	$(".chatResult").scrollTop($(".chatResult").prop("scrollHeight"));
        } else if(alarmExist == 0) {
        	let alarm = $("<div class='newMessage' style='position:relative; width:100%; border-radius:0px; margin:0 auto; text-align:center; height:30px; margin-top:-70px; background-color:ivory; line-height:27px;'>새로운 메세지가 있습니다.</div>")
        	$(".fileDiv").append(alarm)
        	alarmExist = 1
        	
        	$(".newMessage").on("click", function(){
        		$(".chatResult").scrollTop($(".chatResult").prop("scrollHeight"));
        		$(this).remove()
        		alarmExist = 0
        	})
        	
        	$(".chatResult").on("scroll", function(){
        		if($(".chatResult").scrollTop() + $(".chatResult").innerHeight() + 100 >= $(".chatResult").prop('scrollHeight')) {
        			$(".newMessage").remove()
        			alarmExist = 0
        		}
                
        	})
        	
        }

	}
}
		
		$(".chatInput").on("keydown",function(e){
			
			if(e.keyCode == 13){
				
				if($(".chatInput").val().replace(/\s|　/gi, "").length == 0){
	    			alert("내용을 입력해주세요.")
	    			$(".chatInput").val("");
	    			$(".chatInput").focus();
	    			return false;
	    		}
				
				if (!e.shiftKey){
					 e.preventDefault();
				
				let text = $(".chatInput").val();
				let result = String(text).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
				result = result.replaceAll(/(\n|\r\n)/g, '<br>');
				
				$(".chatInput").val("");
				
				ws.send(result);
				}
			}

		})
		
		// 로그인 안했으면 채팅 사용X
		$(".chatInputDiv").on("click",function(){
			if(${isLoginOk != 1 }){
				alert("로그인 후 사용가능한 기능입니다.")
				location.reload();
			}
				
		})
		$("#file").on("click",function(){
			if(${isLoginOk != 1 }){
				alert("로그인 후 사용가능한 기능입니다.")
				location.reload();
			}else{
				return true;
			}
		})
		
		// 채팅방 이미지 올리기
		$("#file").on("change", function(e){
			
			let input = e.target

            if(input.files && input.files[0]) {
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
            	  
            	const formData = new FormData();
				const file = $("#file").get(0).files[0];
				formData.append('file',file);
					
			    console.log($(this))
					
				$.ajax({
					type: "POST",
			        enctype: 'multipart/form-data',
			              url: "/chat/upload",
			              data: formData,
			              processData: false,
			              contentType: false,
			              cache: false
					}).done(function(sysName){
					     ws.send("{=}"+sysName)
					     $("#file").val("")
					     
					   })

              } else {
                 alert('이미지 파일만 업로드 하실 수 있습니다.');
              $(this).val("")
                 return false;
              }
               
            }
		})
		
		// 채팅방 사진 클릭시 팝업창 띄우기
		function imageClick(url){
			  var img = new Image();

			  img.src=url;

			  img.onload = function(){
				  // 이미지 너비&높이, 비율
	 			  var width = img.width;
	 			  var height = img.height;
	 			  var ratio = width/height
	 			  var result = ratio*700
	 			  
	 			  // 팝업창 가운데 띄우기
	 			  var popupX = (window.screen.width / 2) - (result / 2);
	 			  var popupY= (window.screen.height /2) - (700 / 2);
	 			  

	 			  var OpenWindow=window.open("", "_blank", "width="+result+", height=700,  left="+ popupX +", top="+ popupY + ", screenX="+ popupX + ", screenY= "+ popupY+", menubars=no, scrollbars=auto");

	 			  OpenWindow.document.write("<title>Resellium | Style</title><style>body{margin:0px; overflow-x:hidden; overflow-y:hidden;}</style><img src='"+url+"' style='height:700px'>");
		      }
		}
		
		   // 최신순으로
	  	$("#current").on("click",function(){
			location.href="/style/newStyle"
	  	})
	  // 인기순으로
	  	$("#famous").on("click",function(){
			location.href="/style/famousStyle"
	  	})
	   
	   	// 좋아요 & 좋아요 취소
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
//	                      alert("좋아요 등록");
	                    location.reload();
//	                	$('#famousCon').load(location.href+ '#famousCon');
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
//	                   alert("좋아요 취소");
	                 location.reload();
//	                  $('#famousCon').load(location.href+ '#famousCon');
	                 }
	             }
	          })
	       })
			
		// 스타일 올리기
	    $(".toStyleWrite").on("click",function(){
	    	if(${isLoginOk != 1 }){
	    		if(confirm("로그인 후 사용가능한 기능입니다.")){
	    			location.href="/member/loginGo"
	    		}
	    	}else{
	    		location.href="/style/toStyleWrite"
	    	}
	    })
	    
	    // 내 스타일
    	$(".toMyStylePage").on("click",function(){
    		if(${isLoginOk != 1 }){
	    		if(confirm("로그인 후 사용가능한 기능입니다.")){
	    			location.href="/member/loginGo"
	    		}
	    	}else{
	    		location.href="/style/toStylePage";
	    	}
    	})
    </script>
  </body>
</body>
</html>