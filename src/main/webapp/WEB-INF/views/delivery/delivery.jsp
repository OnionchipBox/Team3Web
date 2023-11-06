<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage주문/배송조회</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
@font-face {
	font-family: 'PartialSansKR-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/PartialSansKR-Regular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80dvh;
}

#cont_my {
	
}

.dtable {
	position:relative;
	bottom :60px;
	margin-top: 30px;
	width: 1100px;
	padding: 10px;
	text-align: center;
	border-collapse: collapse;
	border-spacing: 25px 25px;
	border: 1px solid #fff;
	border-radius: 10px;
	box-shadow: -6px -6px 14px rgba(255, 255, 255, .7), 6px 6px 10px
		rgba(0, 0, 0, .15);
}

.dtable th {
	border-bottom: 2px solid #9ca3a6;
}

.dtable th, td {
	background-color: #fff;
}

#joomoon {
	position:relative;
	bottom:100px;
	text-align: center;
	margin: 5px;
	font-weight: bold;
}

a {
	text-decoration: none;
	color: inherit;
}

a:hover {
	color: gray;
}


#nube {
	text-align: center;
	font-size: 30px;
	margin: 0;
	font-style: italic;
	font-family: 'PartialSansKR-Regular';
	letter-spacing: 7px;
}
</style>
<body>
	<jsp:include page="../header.jsp" />
	<!-- https://www.daleseo.com/css-centering/ 배치 관련 css  -->
	<!-- c:if 써서 배송중일 때 배송조회 버튼 나오게 하기 / 버튼 눌렀을 때 모달창에 송장번호 입력하는 폼 띄우거나 배송조회쪽으로 돌리기 -->
	<!-- ajax 사용해서 처음엔 히든으로 숨겼다가 주문 번호 클릭하면 상세 내역 조회 폼 나오게 하기  -->
	<!-- 상품 썸네일 이미지 들어가도 괜찮을 듯 !  -->
	<!-- 주문한 제품이 여러개 일 때 000외 0개 상품 명시 -->
	<!-- 상태가 배송중으로 변경되면 ! 배송조회 버튼 보이게 할 때 조회결과 .. -->
	<script>
	$(function(){
	    $('#detail01').click(function() {
	        $.ajax({
	            url: '/shop/detailnaeyong', // 서버에서 상세 내역을 제공하는 URL
	            dataType: 'html',
	            success: function(data) {
	                $('#result01').html(data); // 상세 내역을 detailCont에 표시
	            }
	        });
	        return false; // 기본 링크 동작 방지
	    });
	});
</script>
	<div class="wrapper">
		<div id="cont_my">
			<!--<h2 id="nube">&nbsp;NUBE</h2>-->

			<h3 id="joomoon">주문/배송 조회</h3>
			<table class="dtable">
				<tr>
					<th>주문 번호</th>
					<th>주문일</th>
					<th>상품명</th>
					<th>결제금액(원)</th>
					<th>주문 상태</th>
				</tr>
				<tr>
					<td><a id="detail01" href="#">11123-24141</a></td>
					<td>2023/01/01</td>
					<td>아디다스 츄리닝 세트</td>
					<td>100,000</td>
					<td>상품 준비중</td>
				</tr>
				<tr>
					<td><a id="detail02">23956-82142</a></td>
					<td>2023/01/01</td>
					<td>컨버스 블랙</td>
					<td>99,900</td>
					<td>배송중</td>
				</tr>
				<tr>
					<td><a href="#">37832-19125</a></td>
					<td>2023/01/01</td>
					<td>크록스</td>
					<td>69,900</td>
					<td>배송 완료</td>
				</tr>
			</table>

	<input type="button" class="btn btn-dark" onclick="location='delivery_check';" value="배송조회">
<!-- 상세내역확인 영역 detailnaeyong.jsp -->
    <span id="result01">
    </span>
	
	
	
	
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script>


</body>
</html>