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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styleDetail.css" />
<!-- Google Fonts -->
<!-- All -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Sans:ital,wght@0,500;0,600;0,700;1,800&display=swap" rel="stylesheet" />
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!--  jQuery CDN  -->
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
    
    
    <!-- Detail Main -->
    <div class="container p-3">
<!--       <div class="row btnbar text-center"> -->
<!--         <div class="col-12 my-auto"> -->
<!--           <button class="btn detailMainBtn" type="button">인기</button> -->
<!--           <button class="btn detailMainBtn" type="button">최신</button> -->
<!--         </div> -->
<!--       </div> -->
	  <div class="row btnbar text-center">
        <div class="col-md-4 col-none"></div>
        <div class="col-md-4 col-12 my-auto">
          <button class="btn detailMainBtn" id="new" type="button">#최신</button>
          <button class="btn detailMainBtn" id="famous" type="button">#인기</button>
        </div>
        <div class="col-md-4 col-12 text-end my-auto">
<!--           <button class="btn btn-style toStyleWrite">스타일 올리기</button> -->
<!--           <button class="btn btn-style toMyStylePage">내 스타일</button> -->
        </div>
      </div>

      <!-- 프로필 헤더 -->
      <div class="row p-0 m-0">
        <div class="col-3 p-0"></div>
        <div class="col p-0">
          <a href="/style/toStylePage?writer=${sDto.writer }"><img src="/upload/${sDto.profileSysName }" class="detailProfileImg me-2" style="border: 1px solid lightgray;"/></a>
          <span class="profileWriter">@</span>
          <span class="profileWriter">
          	<a href="/style/toStylePage?writer=${sDto.writer }">${sDto.writer }</a>
          </span>
        </div>
        <div class="col-3 p-0"></div>
      </div>

      <!-- 게시 이미지 -->
      <div class="row text-center p-0 mt-2">
        <div class="col-3 p-0"></div>
        <div class="col stImgDiv p-0">
          <img src="/upload/${sDto.imageSysName }" />
          <input type=hidden value="${sDto.imageSysName }" name="boardImageSysName" class="imageSysName" style="border: 1px solid lightgray;"/>
        </div>
        <div class="col-3 p-0"></div>
      </div>

      <!-- 좋아요, 댓글 아이콘 -->
      <div class="row p-1">
        <div class="col-3 p-0"></div>
        
        <div class="col p-0 mt-2 icon">
        <input type=hidden value=${sDto.seq  } class=boardLikeSeq>
       	<span class="heartSpan">
       		<img class="heart-empty img profileIcon" id="empty" heart="empty" src="/icon/heart.png"/>
		</span>
		<span class="heartFullSpan">
       		<img class="heart-full img profileIcon" id="full" heart="full" style="display: none;" src="/icon/heart-full.png" />
		</span>
		
       <c:if test="${isLoginOk == 1 }">
	       	<c:if test="${likeResult == 1}">
	           <script language="javaScript">
	              $("#full").css("display", "");
	              $("#empty").css("display", "none");
	           </script>
	    	</c:if>
        </c:if>
   
         <c:if test="${sDto.likey == 0}">
           <span class="me-1 heartCount"></span>
        </c:if>
        <c:if test="${sDto.likey != 0 }">
              <span class="me-1 heartCount">${sDto.likey }</span>
        </c:if>		
 
          <img src="/icon/comment.png" class="profileIcon" />
          <c:if test="${sDto.replyCount == 0 }">
          	<span class="commentFont"></span>
          </c:if>
          <c:if test="${sDto.replyCount != 0 }">
          	<span class="commentFont">${sDto.replyCount }</span>
          </c:if>
        </div>
        
        <div class="col-3 p-0"></div>
        
      </div>

      <!-- 게시글 내용 -->
      <div class="row ps-1">
        <div class="col-3 p-0"></div>
        <div class="col p-0 mb-2 contents">${fn:replace(sDto.contents, cn, br) }</div>
        <div class="col-3 p-0"></div>
      </div>

      <div class="row ps-1">
        <div class="col-3 p-0"></div>
        <div class="col p-0 writeDate">${sDto.formedDate }</div>
        <div class="col-3 p-0"></div>
      </div>
	<input type=hidden value=${sDto.seq  } class=boardSeq>
	 <!-- loginId == writer -->
      <c:if test="${loginId eq sDto.writer }">
      	<div class="row ps-1">
	        <div class="col-3 p-0"></div>
	        <div class="col p-0 mb-4 writeDate">
	        	<div class="text-end boardBtns">
<%-- 		          	<input type=hidden value=${sDto.seq  } class=boardSeq> --%>
		            <button class="btn boardModifyBtn">수정</button>
		            <button class="btn boardDeleteBtn">삭제</button>
		        </div>
	        </div>
	        <div class="col-3 p-0"></div>
      	</div>
      </c:if>
     <!-- loginId == admin1234 --> 
      <c:if test="${loginId eq 'admin1234' }">
      	<div class="row ps-1">
	        <div class="col-3 p-0"></div>
	        <div class="col p-0 mb-4 writeDate">
	        	<div class="text-end boardBtns">
<%-- 	        		<input type=hidden value=${sDto.seq  } class=boardSeq-admin> --%>
		            <button class="btn boardDeleteAdmin">삭제</button>
		        </div>
	        </div>
	        <div class="col-3 p-0"></div>
      	</div>
      </c:if>

	
      <!-- 댓글 입력 -->
      <div class="row ps-1 mt-4">
        <div class="col-3 p-0"></div>
        <div class="col p-0 mb-4 replyInput">
        
        
        <form action="/style/replyInsert" id="replyInsert" method="post">
        	<input type=hidden name="parent_seq" value="${sDto.seq }"/>
        	<input type=hidden name="writer" class="replyInputWriter" value="${mDto.id }"/>
        	<input type=hidden name="imageSysName" value="${mDto.imageSysName }"/>
          <c:if test="${mDto.imageSysName == null  }">	
          	<img src="/upload/default_profile.png" style="object-fit:cover; border:1px solid lightgray;" />
          </c:if>
          <c:if test="${mDto.imageSysName != null  }">	
          	<img src="/upload/${mDto.imageSysName }" style="object-fit:cover; border:1px solid lightgray" />
          </c:if>
          
          <!-- Writer가 Member에 존재하는가 -->
       	<input type="text" name="reply" placeholder="댓글을 남겨보세요." class="reply replyArea" maxlength=150 />
      	<div class="replyBtn" style="display:none;">등록</div>
          <hr style="margin-top: 40px; background-color: lightgray; height: 5px"/>
        </form>
        
        
        </div>
        <div class="col-3 p-0"></div>
      </div>

      <!-- 댓글 출력 -->
      <c:forEach var="i" items="${replyList }">
      <c:choose>
      	<c:when test="${mDto.id eq i.writer }">
      		<div class="row ps-1 mb-3 replyRow">
		        <div class="col-3 p-0"></div>
		        <div class="col p-0 mb-4 replyInput replyDiv">
		          <a href="/style/toStylePage?writer=${i.writer }"><img src="/upload/${i.profileSysName }" style="object-fit:cover; border::1px solid lightgray;"/></a>
		          <div class="replyInfo">
		            <div class="writer">
		            	<a href="/style/toStylePage?writer=${i.writer }">${i.writer }</a>
		            </div>
		            <div class="writeDate">${i.formedDate }</div>
		          </div>
		          <div class="reply">${i.contents }</div>
		          <textarea class="replyTextarea" maxlength=300 style="display:none;">${i.contents }</textarea>
<!-- 		          <input type=hidden class="replyUpdate" name="replyUpdate"> -->
		          <div class="text-end btns">
		          	<input type=hidden value=${i.seq } class=replySeq>
		            <button class="btn replyModifyBtn">수정</button>
		            <button class="btn replyDeleteBtn">삭제</button>
		          </div>
		        </div>
		        <div class="col-3 p-0"></div>
		      </div>
      	</c:when>
      	<c:otherwise>
      		<div class="row ps-1 mb-3">
		        <div class="col-3 p-0"></div>
		        <div class="col p-0 mb-4 replyInput replyDiv">
		          <a href="/style/toStylePage?writer=${i.writer }"><img src="/upload/${i.profileSysName }" style="object-fit:cover; border:1px solid lightgray" /></a>
		          <div class="replyInfo">
		            <div class="writer">
		            	<a href="/style/toStylePage?writer=${i.writer }">${i.writer }</a>
		            </div>
		            <div class="writeDate">${i.formedDate }</div>
		          </div>
		          <div class="reply">${i.contents }</div>
		        </div>
		        <div class="col-3 p-0"></div>
		      </div>
      	</c:otherwise>
      </c:choose>
      </c:forEach>
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
    	alert("존재하지 않는 게시글입니다.")
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
    
    // 최신순으로
  	$("#new").on("click",function(){
		location.href="/style/newStyle"
  	})
  // 인기순으로
  	$("#famous").on("click",function(){
		location.href="/style/famousStyle"
  	})
  	
    // 게시글
    	// 삭제
    	$(".boardDeleteBtn").on("click",function(){
    		if(confirm("게시글을 삭제하시겠습니까?\n삭제한 게시글은 복구가 불가능합니다.")){
    			$.ajax({
    				url:"/style/delete",
    				data:{seq:$(".boardSeq").val(), imageSysName:$(".imageSysName").val()}
    			}).done(function(resp){
    				if(resp == 1){
    					location.href="/style/toStyleMain"
    				}
    			})
    		}else{
				return false;
			}
    	})
    	
    	// 수정
    	$(".boardModifyBtn").on("click",function(){
    		if(confirm("게시글을 수정하시겠습니까?")){
    			location.href="/style/toUpdatePage?seq="+$(".boardSeq").val();
    		}else{
				return false;
			}
    	})
    	
    	// 관리자 게시글 삭제
    	$(".boardDeleteAdmin").on("click",function(){
			if(confirm("해당 게시글을 관리자 권한으로 삭제합니다.")){
				$.ajax({
					url:"/style/delete",
					data:{seq:$(".boardSeq").val(), imageSysName:$(".imageSysName").val()}
				}).done(function(resp){
					if(resp == 1){
						location.href="/style/toStyleMain"
					}
				})
			}else{
				return false;
			}
    	})

    	
	// 좋아요
    $(".heartSpan").on("click", function(){
       let seq = $(this).siblings(".boardLikeSeq").val();
       if(${isLoginOk != 1 }){
          alert("로그인 후 사용가능한 기능입니다.");
          location.reload();
       }else{
          $.ajax({
             url:"/style/StyleLike",
             data: {seq: seq, id:"${loginId}" },
             success: function(resp){
                if(resp == 1){
//                      alert("좋아요 등록");
                    location.reload();
                    }
                }
             })
          }
       })
       
       $(".heartFullSpan").on("click", function(){
          let seq = $(this).siblings(".boardLikeSeq").val();

          $.ajax({
             url:"/style/StyleLike",
             data: {seq: seq, id:"${loginId}" },
             success: function(resp){
             if(resp == 0){
//                   alert("좋아요 취소");
                 location.reload();
                 }
             }
          })
       })    	

    
    
    // 댓글
    
    	$(".replyArea").on("keydown",function(e){

    		if(e.keyCode==13){
	    		if(e.shiftKey){
	    			e.preventDefault();
	    		}
	    		
	    		return false;
    		}
    		

    	})
    	
    	$(".replyArea").on("keyup",function(e){
    		if($(".replyArea").val() != "") {
    			$(".replyBtn").css("display","")
    		} else {
    			$(".replyBtn").css("display","none")
    		}
    		
    	})
    	
    	$(".replyArea").on("click",function(){
    		if($(".replyInputWriter").val() == "" ){
    			if(confirm("로그인 후 사용가능한 기능입니다.")){
    				location.href="/member/loginGo"
    			}else{
					return false;
				}
    		}
    	})
    	
    	$(".replyBtn").on("click",function(){
    		if($(".replyInputWriter").val() == "" ){
    			if(confirm("로그인 후 사용가능한 기능입니다.")){
    				location.href="/member/loginGo"
    			}else{
					return false;
				}
    		}else{
    			if($(".replyArea").val().replace(/\s|　/gi, "").length != 0){
	    			if(confirm("댓글을 등록합니다.")){
		        		// html 태그 막기
		        		let text = $(".reply").val();		
		            	let result = String(text).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
		    			$(".reply").val(result)
//	 	    			$("#replyInsert").submit();
		    			$("#replyInsert").submit();	    				
	    			}else{
	    				$(".reply").focus();
	    				return false;
	    			}
	    		}else{
	    			alert("댓글을 입력해주세요.")
	    			$(".reply").val("")
	    			$(".reply").focus();
	    			$(".replyBtn").css("display","none")
	    		}
    		}
    	})
    	
    	$(".replyDeleteBtn").on("click",function(){
    		if(confirm("댓글을 삭제하시겠습니까?")){
    			$.ajax({
        			url:"/style/replyDelete",
        			data:{seq:$(this).siblings(".replySeq").val(), parent_seq:$(".boardSeq").val()}
        		}).done(function(resp){
        			if(resp==1){
        				location.reload();
        			}
        		})
    		}else{
    			return false;
    		}
    	})
    	
    	$(".replyTextarea").on("keydown",function(e){
    		if(e.shiftKey && e.keyCode==13 || e.keyCode==13){
    			e.preventDefault();
    		}
    	})
    	
    	$(".replyModifyBtn").on("click",function(){
    		
    		// $(this) 이외의 것들
    		$(this).parent().closest(".replyRow").siblings().find(".reply").css("display","")
    		$(this).parent().closest(".replyRow").siblings().find(".replyTextarea").css("display","none")
    		$(this).parent().closest(".replyRow").siblings().find(".replyDeleteBtn").css("display","")
    		$(this).parent().closest(".replyRow").siblings().find(".replyModifyBtn").css("display","")
    		$(this).parent().closest(".replyRow").siblings().find(".replyOkBtn").css("display","none")
    		$(this).parent().closest(".replyRow").siblings().find(".replyCancelBtn").css("display","none")
    		
    		$(this).css("display","none");
    		$(this).siblings(".replyDeleteBtn").css("display","none");
    		$(this).parent().siblings(".reply").css("display","none");
    		
//     		let replyInput = $(this).parent().siblings(".replyUpdate");
    		let replyDiv = $(this).parent().siblings(".replyTextarea");
//     		replyDiv.attr("contenteditable","true");
    		replyDiv.css("display","")
    		replyDiv.css("padding","10px")
    		replyDiv.focus();
    		
    		let okBtn = $("<button>");
    		okBtn.text("등록");
    		okBtn.addClass("btn replyOkBtn")
    		
    		let cancelBtn = $("<button>");
    		cancelBtn.text("취소");
    		cancelBtn.addClass("btn replyCancelBtn")
    		cancelBtn.attr("type","button");
    		
    		$(this).parent().append(okBtn);
    		$(this).parent().append(cancelBtn);
    		
    		okBtn.on("click",function(){
    			
    			if($(".replyTextarea").val().replace(/\s|　/gi, "").length != 0) {
    				
	    			if(confirm("댓글을 수정하시겠습니까?")){
	    	    		// html 태그 막기
	    	    		let text = replyDiv.val();		
	    	        	let result = String(text).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
	    				
	        			$.ajax({
	        				url:"/style/replyUpdate",
	        				data:{seq:$(this).siblings(".replySeq").val(), replyUpdate:result}
	        			}).done(function(resp){
	        				location.reload();
	        			})
	    			}else{
	    				replyDiv.focus();
	    				return false;
	    			}
    			
    			} else {
    				alert("댓글을 입력해주세요.")
    				$(".replyTextarea").val("")
	    			$(".replyTextarea").focus();
    			}
    			
    		})
    		
    		
    		cancelBtn.on("click",function(){
    			location.reload();	
    		})
    	})
    	
    </script>
    
    
</body>
</html>