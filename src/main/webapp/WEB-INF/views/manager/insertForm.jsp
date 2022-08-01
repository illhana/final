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
<title>Resellium | 리셀리움</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- dropzone -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.2/dropzone.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.2/dropzone.min.css">

<style>

   * {box-sizing:border-box;}

   body {
     font-family: 'Roboto', sans-serif;
   }
   
   .dropzone {
     background-color: ivory;
     width: 98%;
     max-width:700px;
     min-height:230px;
     margin: 1%;
     border: 5px dashed darkgrey !important;
     border-radius: 5px;
     -webkit-transition: .2s;
     transition: .2s;
   }
   
   .dropzone.dz-drag-hover {
     border: 5px solid dodgerblue !important;
   }
   
   .dz-message.needsclick img {
     width: 50px;
     display: block;
     margin: auto;
     opacity: .6;
     margin-bottom: 15px;
   }
   
   span.plus {
     display: none;
   }
   
   .dropzone.dz-started .dz-message {
   
     display: inline-block !important;
     width: 120px;
     float: right;
     border: 0px solid rgba(238, 238, 238, 0.36);
     border-radius: 30px;
     height: 120px;
     margin: 16px;
     -webkit-transition: .2s;
     transition: .2s;
   }
   
   .dropzone.dz-started .dz-message span.text {
     display: none;
   }
   
   .dropzone.dz-started .dz-message span.plus {
     display: block;
     font-size: 70px;
     color: #AAA;
     line-height: 110px;
   }
   
   .dropzone .dz-remove {
      width:70%;
      margin:0 auto;
      background-color: black;
      color:white;
      text-decoration:none;
      border-radius:10px;
      margin-top:7px;
   }
   
   .dropzone .dz-preview.dz-image-preview {
       background-color: transparent !important;
   }
   
   .dropzone .dz-message {
      margin-top:45px;
   }
   
   .dropzone .plus {
      margin-top:12px;
   }
   
   #logo { position:fixed; top:10px; left:30px; text-decoration : none; }

</style>

</head>
<body>

   <a href="/" id="logo" style="font-style:italic; font-size:2rem; font-weight:bold; color:#bebebe;">
      Resellium
   </a>

   <div class="container">
   
      <div class="row">
         <div class="col-12 col-sm-11 col-md-9 col-lg-7" style="margin:0 auto;">
         
            <div class="row">
               <div class="col-12 text-center">
                  <br><br><br>
                  <h1 style="font-weight:bold;">판매상품등록</h1>
               </div>
            </div>
            <br>
            
            <table class="table">
                 <tr>
                    <td colspan="3" height=40>
                       &nbsp;
                       <select id=categoryInput>
                          <option value=명품>명품
                          <option value=신발>신발
                          <option value=의류>의류
                          <option value=테크>테크
                          <option value=레고>레고
                       </select>
                       <span style="color:crimson;">&nbsp;* 카테고리</span>
                    </td>
                 </tr>
                 <tr>
                    <td colspan="3" height=40>
                       &nbsp;
                       <input type="text" maxlength=30 id=brandInput placeholder="브랜드명을 입력하세요.">
                    </td>
                 </tr>
                 <tr>
                     <td>
                        &nbsp;
                        <input type="text" maxlength=150 id=titleInput placeholder="글 제목을 입력하세요." style="width:90%;">
                     </td>
                 </tr>
                 <tr>
                    <td colspan=3 height=40>
                       &nbsp;
                       <input type=text maxlength=150 id=nameInput placeholder="모델명을 입력하세요.">
                    </td>
                 </tr>
                 <tr>
                    <td colspan=3 height=40>
                       &nbsp;
                       <input type=text maxlength=15 id=colorInput placeholder="색상을 입력하세요.">
                    </td>
                 </tr>
                 <tr id=priceBox>
                    <td colspan="3" height=40>
                       &nbsp;
                       <input type=text maxlength=9 id=releasePriceInput placeholder="출시가를 입력하세요."> 원
                    </td>
                 </tr>
                 <tr>
                    <td colspan="3" style="height:320px;">
                          <br>
                          <form action="/product/insert" class="dropzone" id="myDropzone" method="post" enctype="multipart/form-data">
                        <input type=hidden id="category" name="category">
                        <input type=hidden id="brand" name="brand">
                        <input type=hidden id="title" name="title">
                        <input type=hidden id="name" name="name">
                        <input type=hidden id="color" name="color">
                        <input type=hidden id="releasePrice" name="releasePrice">
<!--                         <input type=hidden id="content" name="content"> -->
                                 
                        <div class="dz-message needsclick">
                           <span class="text">
                              <img src="/icon/camera.png" alt="Camera" />
                              Drop files here or click to upload.
                           </span>
                           <span class="plus">+</span>
                        </div>
                        </form>
                    </td>
                 </tr>
                 
                 <tr>
                    <td colspan="3" align=center>
                       <a href="/product/main"><input type="button" class="btn btn-primary" value='관리자메인'></a>&nbsp;
                       <input type="button" id='uploadFiles' class="btn btn-success" value='등록완료'>
                    </td>
                 </tr>
         
             </table>
                     
         </div>
      </div>
      
   </div>

   
   
   
   
   <script>
   
      Dropzone.autoDiscover = false;
      let myDropzone = new Dropzone(".dropzone", { 
         autoProcessQueue: false,
//          paramName: "list",
//          enctype: 'multipart/form-data',
         parallelUploads: 3, // Number of files process at a time (default 2)
         acceptedFiles: "image/*",
         uploadMultiple: true,
         timeout: 300000,
//          clickable: true,            // 클릭가능여부
//          thumbnailHeight: 90,        // Upload icon size
//          thumbnailWidth: 90,         // Upload icon size
         maxFiles: 3,                // 업로드 파일수
         maxFilesize: 10,            // 최대업로드용량 : 10MB
         addRemoveLinks: true,       // 삭제버튼 표시 여부
         dictRemoveFile: 'Delete',     // 삭제버튼 표시 텍스트
         init: function(){

            this.on("maxfilesexceeded", function (file) {
               alert("이미지는 최대 세 장 까지 등록하실 수 있습니다.");
                this.removeFile(file);
            });
            
            this.on("error", function (file, errorMessage) {
               console.log(errorMessage)
               this.removeFile(file)
               
               if(errorMessage == "You can't upload files of this type.") {
                  alert("이미지 파일만 업로드가 가능합니다.")
               } else if(errorMessage.includes("File is too big")) {
                  alert("최대 10MB 용량의 이미지만 업로드 가능합니다.")
               }
               
            });
            
            this.on("success", function(){
               if (this.getUploadingFiles().length === 0 && this.getQueuedFiles().length === 0) {
                    location.href="/manager/main"
                  }
            })
            
         }
         
      });

      $('#uploadFiles').on("click", function(){
    	  
    	 let blankPattern = /^\s+|\s+$/g; 
    	  
         if(myDropzone.getQueuedFiles().length == 0) {
            alert("상품이미지를 최소 한 장 등록해주세요.")
            return false
         }
         
         if($("#brandInput").val() == "" || $("#brandInput").val().replace(blankPattern, '') == "") {
             alert("브랜드명을 입력해주세요.")
             $("#brandInput").focus()
             return false
          }
         
         if($("#titleInput").val() == "" || $("#titleInput").val().replace(blankPattern, '') == "") {
             alert("글 제목을 입력해주세요.")
             $("#titleInput").focus()
             return false
          }
         
         if($("#nameInput").val() == "" || $("#nameInput").val().replace(blankPattern, '') == "") {
             alert("모델명을 입력해주세요.")
             $("#nameInput").focus()
             return false
          }
         
         if($("#colorInput").val() == "" || $("#colorInput").val().replace(blankPattern, '') == "") {
             alert("색상을 입력해주세요.")
             $("#colorInput").focus()
             return false
          }
         
         // 가격 정규표현식
         let priceRegex = /^[\d]{1,10}$/g;
         let price = $("#releasePriceInput").val()
         
         if($("#releasePriceInput").val() == "" || $("#releasePriceInput").val().replace(blankPattern, '') == "") {
            alert("출시가를 입력해주세요.")
            $("#releasePriceInput").focus()
            return false
         } else if(priceRegex.test(price) == false) {
               alert("가격을 숫자로 입력해주세요.")
               $("#releasePriceInput").val("")
               $("#releasePriceInput").focus()
               return false
           }
         
         if(confirm("상품을 등록하시겠습니까?")) {
            
            $("#category").val($("#categoryInput").val())
            $("#brand").val($("#brandInput").val())
            $("#title").val($("#titleInput").val())
            $("#name").val($("#nameInput").val())
            $("#color").val($("#colorInput").val())
            $("#releasePrice").val($("#releasePriceInput").val())
            myDropzone.processQueue()
         }
      });

      
   </script>

</body>
</html>