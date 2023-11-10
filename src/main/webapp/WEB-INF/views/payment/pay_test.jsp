<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>카카오페이 테스트</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">


<style>
#k{
	text-align:center;
	position:relative;
	top:50%;
}


</style>


</head>
<body>
<div id="k">

<button class="btn btn-secondary" id="proc_payment">결제</button>


</div>
</body>
<script>
    //카카오페이 결제
  $('#proc_payment').click(function(){
      var IMP = window.IMP;
      IMP.init('imp24673855');
      
      IMP.request_pay({
          pg: 'kakaopay.TC0ONETIME',
          pay_method: 'card',
          //우리서버에서 사용할 주문식별번호
          merchant_uid: 'merchant' + new Date().getTime(),
          
          name: 'NUBE',
          amount: 5000, //총결제금액
          buyer_email: 'wusl3954@gmail.com',
          buyer_name: 'jihyeon',
          buyer_tel: '010-3678-6474',
          buyer_addr: '서울특별시 강남구 삼성동',
          buy_postcode: '123-456'
          }, function (rsp){
            if(rsp.success){
                alert('주문이 완료되었습니다.');
                
                //결제완료 후 주문정보를 DB에 저장하고, 주문완료 페이지로 이동
                $.ajax(
                    {
                        url: '/order/${cart_id}',
                        type: 'post',
                        data: {
                            imp_uid: rsp.imp_uid,
                            merchant_uid: rsp.merchant_uid,
                            paid_amount: rsp.paid_amount,
                            apply_num: rsp.apply_num,
                            buyer_email: rsp.buyer_email,
                            buyer_name: rsp.buyer_name,
                            buyer_tel: rsp.buyer_tel,
                            buyer_addr: rsp.buyer_addr,
                            buyer_postcode: rsp.buyer_postcode,
                            total_price: totalPrice
                        }
                    }
                ).done(function(msg){
                    if(msg == 'SUCCESS'){
                        location.href = '/user/orders';
                    } else {
                        alert('주문에 실패하였습니다.');
                    }
                }).fail(function(){
                    alert('결제에 실패하였습니다.');
                });
            } else {
                alert(rsp.error_msg);
            }
          }
          )
  })
</script>

</html>