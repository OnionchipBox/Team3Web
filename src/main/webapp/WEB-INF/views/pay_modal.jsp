<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="/resources/css/common/pay_modal.css">
<script>
$('#pay').on('click', function(e) {
	e.preventDefault();
	var a_payment = $("input[type=radio][name=a_payment]:checked").val();
	if($("input[type=radio][name=a_payment]:checked").is(':checked')){
		if(a_payment == '카카오페이'){
			//가맹점 식별코드
			IMP.init('TC0ONETIME');
			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '물품명', //결제창에서 보여질 이름
				amount : 물품가격(숫자), //실제 결제되는 가격
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울 강남구 도곡동',
				buyer_postcode : '123-456'
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					var actionForm =$("#pay_form");
					const a_completed = $("<input type='hidden' value='T' name='a_completed'>");
					actionForm.append(a_completed);
					console.log(actionForm);
					actionForm.find("input[name='p_id']").val($(this).attr("href"));
					actionForm.submit();
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});

		}else{
			var actionForm =$("#pay_form");
			const a_completed = $("<input type='hidden' value='F' name='a_completed'>");
			actionForm.append(a_completed);
			console.log(actionForm);
			actionForm.find("input[name='p_id']").val($(this).attr("href"));
			actionForm.submit();
		}
	}else{
		alert('결제 수단을 선택해주세요.');
	}
	
});
</script>
</head>
<body>
<!-- ********************************모달 시작****************************** -->
<table>
		<form id="pay_form" method="post" action="application_process">
			<input type="hidden" name="p_id" value="${party.p_id}"> 
			<input type="hidden" name="a_price" value="${party.p_price}"> 
			<input type="hidden" name="u_id" value=<%=session.getAttribute("loggedInUserId")%>>
			<input type="hidden" name="p_title" value="${party.p_title}">
			<h2>파티 번호</h2>
			<table class="moveReview_list">
				<tr>
					<td>${party.p_id}</td>
				</tr>
			</table>
			<h2>파티 제목</h2>
			<table>
				<tr>
					<td>${party.p_title}</td>
				</tr>
			</table>
			<h2>결제 금액</h2>
			<table>
				<tr>
					<td>${party.p_price}</td>
				</tr>
			</table>
			<h2>결제 방법 선택</h2>
			<table>	
				<tr>
					<td><label><input type="radio" name="a_payment" value="카카오페이">카카오페이
						</label> <label><input type="radio" name="a_payment" value="무통장입금">무통장입금</label></td>
				</tr>
			</table>
			<br>
			<div class="a">
				<button id="pay" class="test_btn1">신청하기</button>
			</div>
		</form>
	</table>
<!-- ****************************모달 끝 *******************************-->
<script src="/resources/js/common/pay_modal.js"></script>
<script src="/resources/js/api/kakao_payment.js"></script>
</body>
</html>