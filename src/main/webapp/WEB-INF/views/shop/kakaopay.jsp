<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- favicon.ico 로그인 시 콘솔창에 뜨는 거 제거 -->
	<link rel="icon" href="data:,">
	<link rel="shortcut icon" type="image/x-icon" href="/images/logo.png">
	<title>Resellium | 리셀리움</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
      

      
    <script>
    
    
        IMP.init('imp58639411');
        IMP.request_pay({
        pg : 'kakao',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '주문명:결제테스트',
        amount : ${totalPay},
        buyer_email : 'iamport@siot.do',
        buyer_name: '구매자이름',
        buyer_tel : '010-1234-5678',
        buyer_addr : '서울특별시 강남구 삼성동',
        buyer_postcode : '123-456'
    }, function(rsp) {
       
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            msg+=' 구매내역으로 이동합니다.'
            location.href="/product/getSuccessBuy?result="+"${result}"+"&sized="+${sized}+"&totalPay="+${totalPay}+"&finalPrice="+${finalPrice}+"&parentSeq="+${parentSeq}
            // msg += '고유ID : ' + rsp.imp_uid;
            // msg += '상점 거래ID : ' + rsp.merchant_uid;
            // msg += '결제 금액 : ' + rsp.paid_amount;
            // msg += '카드 승인번호 : ' + rsp.apply_num;
        } else {
            var msg = '결제에 실패하였습니다.';
            msg+='메인페이지로 이동합니다.'
            location.href="/"
//             msg += '에러내용 : ' + rsp.error_msg;
        }

        alert(msg);
    });


    </script>
</body>
</html>