<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team3Web</title>
		<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style>
/* 로그인 폼을 감싸는 컨테이너 */
.login-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 20px;
    max-width: 400px; /* 최대 너비 설정 */
    margin: 70px auto 0; /* 상단 여백 추가 */ 
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
    background-color: white; /* 배경색 추가 */
}
/* 로그인 폼 내부 요소들의 스타일 */
.login-form {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.login-form label {
    font-size: 16px;
    font-weight: bold;
}

.input-group input {
    padding: 10px;
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 14px;
    margin-bottom:15px;
}


.login-form button {
    margin-top: 20px;
    padding: 12px 24px;
    font-size: 16px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

.login-form p {
    margin-top: 10px;
    font-size: 14px;
}

/* 로그인 하위 링크 스타일 */
.login-sub {
    display: flex;
    justify-content: space-between;
    margin-top: 15px;
    text-align:center;
    
}

.login-sub-item {
    list-style: none;
}

.login-link {
    color: #777777; /* 회색으로 변경 */
    text-decoration: none;
    font-size: 14px;
}

.login-sub-divider {
	color: #777777;
    margin: 0 10px;
    font-weight: bold;
}

/* 입력 칸과 레이블을 묶는 그룹 스타일 */
.input-group {
	display: flex;
	flex-direction: row;
	align-items: center;
	margin-bottom: 10px;
}

.input-group label {
	margin-right: 10px;
	font-weight:bold;
	margin-bottom:5px;
}

.input-group input {
	padding: 5px;
}

.login-form button {
	margin-top: 10px;
	padding: 10px 20px;
	font-size: 16px;
	/* 로그인 버튼을 가운데 정렬 */
	display: block;
	margin: 0 auto;
	/* 로그인 버튼 테두리 제거 */
	border: none;
	
}

/* 로그인api 버튼 
.btn-icon {
    height: 52px;
    width: 270px;
    margin-right: 5px;
    vertical-align: middle;
}*/

/* 하나의 큰 입력 칸 스타일 */
.large-input {
	padding: 5px;
	width: 300px; /* 큰 입력 칸의 너비 조절 */
}


.login-container h2{
	font-style:italic;
	letter-spacing: 20px;
	font-family:fantasy;
	text-align:center;
    font-size: 50px;
    font-weight: bold;
    color: #000;
    margin-bottom: 20px;
}
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
input[type="submit"]{
	font-family: 'NanumSquareNeo-Variable';
	width: 100%;
	font-weight:bold;
	cursor:pointer;
    color: #fff;
    font-size: 20px;
    background-color: #000;
    margin-top: 30px;
    margin-bottom: 20px;
    border:none;
    text-align:center;
    border-radius:5px;
    padding:5px;
	
}

.login-sub{
	
	text-align:center;
	padding:10px;
	
}
.login-sub a{
	color:inherit;
	text-decoration: none;
	padding-right:10px;
	padding-right:15px;
}
.login-sub a:hover{

	text-decoration:underline;
}

.login-button a{
	width: 100%;
	border:1px solid lightgray;
	margin-top:10px;
}

</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="login-container">
		<h2>NUBE</h2>
		<h5>비밀번호 변경</h5>
		 <form action="<%=request.getContextPath()%>/updatePw" method="post">
            <!-- 로그인 폼 내용 -->
                <div class="input-group">
                    <label for="pw">비밀번호:</label> 
                    <input type="password" id="password" name="password" placeholder="비밀번호를 입력하거라" required>
                </div>
                <div class="input-group">
                    <label for="pw">비밀번호 확인:</label> 
                    <input type="password" id="password2" name="password2" placeholder="다시 입력하거라" required>
                </div>
                <input type="submit" value="확인"><hr>   
        </form>
	</div>
	<br><br><br>
	<jsp:include page="../footer.jsp" />
	
	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script>
	<script>
        function validateForm() {
            var password1 = document.getElementById("password").value;
            var password2 = document.getElementById("password2").value;

            if (password1 !== password2) {
                alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>