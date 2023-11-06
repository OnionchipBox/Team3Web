<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
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
    <h1>아이디 찾기</h1>
    <form action="/shop/selectId" method="post">
        <div>
            <label for="inputName">이름:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div>
            <label for="inputPhone">전화번호:</label>
            <input type="text" id="phone" name="phone" required>
        </div>
        <div>
            <button type="submit" value="check">아이디 찾기</button>
        </div>

		<c:if test="${check == 1}">
			<script>
				opener.document.findform.name.value = "";
				opener.document.findform.phone.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>
		<c:if test="${check == 0 }">
		<label>찾으시는 아이디는' ${id}' 입니다.</label>
		<div class="form-label-group">
				<input class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" value="비밀번호 찾기" onclick="closethewindow()">
			</div>
		</c:if>
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
	<script>
		function closethewindow(){
			window.location.href = "/shop/selectPassword";
		}
	</script>
</body>
</html>
