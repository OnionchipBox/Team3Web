<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404에러 - 페이지를 찾을 수 없음</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
        body {
            background-color: #f8f9fa;
        }
        .error-container {
            text-align: center;
            margin: 100px auto;
            max-width: 600px;
        }
        .error-icon {
            font-size: 100px;
            color: #dc3545; /* 빨간색 */
        }
        .error-heading {
            font-size: 36px;
            color: #343a40; /* 검은색 */
        }
        .error-message {
            font-size: 18px;
            color: #6c757d; /* 회색 */
        }
</style>
</head>
<body>
<jsp:include page="../header.jsp" />

<div class="error-container">
        <i class="bi bi-exclamation-triangle error-icon"></i>
        <h1 class="error-heading">404 에러 - 페이지를 찾을 수 없음</h1>
        <p class="error-message">죄송합니다, 요청하신 페이지를 찾을 수 없습니다. 이 페이지가 삭제되었거나 이동되었을 수 있습니다.</p>
</div>

<br><br><br>
	<jsp:include page="../footer.jsp" />
	
	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script>
</body>
</html>