<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="./resources/js/qna.js"></script>

<style>
#mypage {
	color:#828d94;
	text-decoration: underline;
}
#container_q {
	display: flex;
    justify-content: center;
    align-items: center;
    text-align: center; /* 수평 가운데 정렬을 위해 추가 */
    
}

#container_q{
	/* background-image: url("./resources/img/sources/img.jpeg"); */
	background-color:#fff;
	background-repeat: no-repeat;
	background-size: cover;
}


#qwrap {
	width: 90%;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative; /* 요소의 위치를 조정하기 위해 필요한 기본 속성 */
	top: 20px; /* 위로 이동할 픽셀 수를 조정하세요. 음수 값은 위로 이동, 양수 값은 아래로 이동 */
}


#qna input {
    width: 100%; /* 모든 input 요소의 너비를 100%로 설정 */
}

#qtable {
	background : transparent;
	/* border: 1px solid #ccc; 바깥 윤곽선 설정
	border-radius: 3px;  윤곽선의 둥근 모서리 설정 */
	overflow: auto; /* 내용이 넘칠 때 스크롤 표시 */
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
	/* background-color: #fff; /* 배경색 설정 */
}

#qtable th{
	background-color:#fff;
}
#qna-title {
    text-align: center; /* 제목 가운데 정렬 */
    font-size: 24px; /* 원하는 글자 크기 설정 */
    margin: 20px 0; /* 위 아래 여백 추가 */
}

#qbutton {
	float: center;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div id="container_q">
	<div id="qwrap">

		<form method="post" action="qna_write_ok"
			onsubmit="return write_check();">
<h2 class="qna-title">
			<strong>상품문의</strong>
		</h2>
<div id="qtable">
<table id="qna" style='width: 900px; table-layout: fixed; word-break: break-all; height:800'>

				<tr>
				<td id="ill">
						클레임(교환/환불/취소)관련 문의는 <a
							href="<%=request.getContextPath()%>/myQnA"><strong
							id="mypage">마이페이지 > 1:1 문의</strong></a>에서 문의 바랍니다.
				</td>
				</tr>

					<tr>
						<th>작성자</th>
						<td><input name="qid" id="qid" size="14" /></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input name="qtitle" id="qtitle" size="33" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="qpw" id="qpw" size="14" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="qcont" id="qcont" rows="8" cols="34"></textarea></td>
					</tr>

			</table>
</div>			
		
			<div id="qbutton">
			<input type="reset" class="btn btn-dark" value="취소" onclick="$('#qid').focus();" />
				<button type="button" class="btn btn-dark"
					onclick="location='qna_list?page=${page}';">목록</button>
				<input type="submit" class="btn btn-dark" value="작성하기" />
			</div>
		</form>
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