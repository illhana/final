<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.4/r-2.2.9/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.4/r-2.2.9/datatables.min.js"></script>

<style>
   body,html{ margin:0; padding:0; }
   a{ text-decoration : none; color:skyblue; font-size:1.4rem; font-weight:bold;}
   table tr td{ overflow:hidden; text-overflow:ellipsis; white-space:nowrap; max-width:200px;}
   #logo { position:fixed; top:10px; left:30px; text-decoration : none; }
</style>
</head>
<body>

   <a href="/" id="logo" style="font-style:italic; font-size:2rem; font-weight:bold; color:#bebebe;">
      Resellium
   </a>

   <div class="container-fluid">

      
      <div class="row">
         <div class="col-12 text-center">
            <br><br><br>
            <h1 style="font-weight:bold;">주문관리</h1>
         </div>
      </div>
      
      <br>
   
      <div class="row">
         <div class="col-12">
            <table id="myTable" class="display nowrap" style="width:100%">
                 <thead>
                     <tr>
                         <th>주문번호</th>
                         <th>게시글번호</th>
                         <th>제목</th>
                         <th>결제금액</th>
                         <th>사이즈</th>
                         <th>카테고리</th>
                         <th>구매자아이디</th>
                         <th>구매자이름</th>
                         <th>구매자번호</th>
                         <th>구매자주소</th>
                         <th>판매자아이디</th>
                         <th>판매자이름</th>
                         <th>판매자번호</th>
                         <th>거래날짜</th>
                     </tr>
                 </thead>
                 <tbody>
                     <c:forEach var="i" items="${orderList }">
                        <tr>
                           <td>${i.seq }
                           <td>${i.parentSeq }
                           <td><a href="/product/getProductDetail?parentSeq=${i.parentSeq }">${i.title }</a>
                           <td>${i.price }
                           <td>${i.sized }
                           <td>${i.category }
                           <td>${i.buyerId }
                           <td>${i.buyerName }
                           <td>${i.buyerPhone }
                           <td>${i.jibunAddress }
                           <td>${i.sellerId }
                           <th>${i.sellerName }
                           <td>${i.sellerPhone }
                           <td>${i.joinDate }
                        </tr>
                     </c:forEach>
                 </tbody>
<!--                  <tfoot> -->
<!--                      <tr> -->
<!--                          <th>번호</th> -->
<!--                          <th>제목</th> -->
<!--                          <th>카테고리</th> -->
<!--                          <th>브랜드</th> -->
<!--                          <th>모델명</th> -->
<!--                          <th>수정 / 삭제</th> -->
<!--                      </tr> -->
<!--                  </tfoot> -->
             </table>
             <div style="text-align:center; padding-top:20px;">
	     	 	<button class="btn btn-success" onclick="location.href='/manager/main'">관리자메인</button>
         	 </div>
          </div>
       </div>
   
   </div>
   
   
   <script>
   
      $(document).ready( function () {
          $('#myTable').DataTable({
              responsive : true,
              order : [[0, "desc"]],
              lengthChange: false
          });
      } );
      
      $(".deleteBtn").on("click", function(){
         if(confirm("해당 상품을 삭제하시겠습니까?")) {
            let seq = $(this).attr("seq")
            location.href="/product/delete?seq=" + seq
         }
      })
      
   </script>

</body>
</html>