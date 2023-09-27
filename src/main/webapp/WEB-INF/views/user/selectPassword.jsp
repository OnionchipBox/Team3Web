<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<jsp:include page="../header.jsp" />
    <h1>비밀번호 찾기</h1>
    <form action="/shop/selectPassword" method="post">
        <div>
            <label for="inputId">아이디:</label>
            <input type="text" id="inputId" name="id" required>
        </div>
        <div>
            <label for="inputName">이름:</label>
            <input type="text" id="inputName" name="name" required>
        </div>
        <div>
            <label for="inputPhone">전화번호:</label>
            <input type="text" id="inputPhone" name="phone" required>
        </div>
        <div>
            <button type="submit">비밀번호 찾기</button>
        </div>
    </form>
    <a href="/shop/login" class="btn btn-default"><button class="btn btn-default" id="back_to_myPage">로그인으로 돌아가기</button></a>
    <br><br><br>
	<jsp:include page="../footer.jsp" />
	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
</body>
</html>
