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

<style>
   
   #logo { position:fixed; top:10px; left:30px; text-decoration : none; }
   #btnBox button{ width:300px; height:50px; margin-bottom:10px; border-radius:30px; background-color:white; color:black; font-size:1.5rem; font-weight:bold; border:3px solid grey; }
   #btnBox button:hover{ background-color:black !important; color:white; }
   
   body {
      width:100vw;
      height:100vh;
      background-image: url('/image/managerMain.jpg');
      background-size: cover;
      background-position: center;
   }

</style>
</head>
<body>

   <a href="/" id="logo" style="font-style:italic; font-size:2rem; font-weight:bold; color:white;">
      Resellium
   </a>


   <div class="container">
   
      <div class="row">
      
         <div class="col-12 text-center" id="btnBox" style="height:100vh; display:flex; justify-content:center; align-items:center;">
            <fieldset style="border:10px solid white; padding:40px; width:50%; min-width:400px; min-height:540px; margin:auto;">
            <legend class="float-none w-auto" style="color:white; font-size:2.7rem; font-weight:bold; text-align:left;">&nbsp;&nbsp;ADMIN&nbsp;&nbsp;</legend>
            <br>
            <a href="/product/insertForm"><button>상품등록</button></a><br><br>
            <a href="/product/productList"><button>상품관리</button></a><br><br>
            <a href="/member/list"><button>회원관리</button></a><br><br>
            <a href="/product/getOrderList"><button>주문관리</button></a><br><br>
            </fieldset>
            
         </div>
      
      </div>
   
   </div>
   
   
   
   

</body>
</html>