<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>

input {
	margin-left:10px;
}

</style>
</head>
<body>
<jsp:include page="../../header.jsp" />

<h3>
1:1 문의 페이지 ui 작업 전
</h3>

<table>

<tr>
<th>문의 입력</th>
</tr>

<tr>
<td>제목<input type="text"></td>
</tr>
<tr>
<td>내용<textarea name="cont" rows="8" cols="34"></textarea></td>
</tr>
<tr>
<!-- <div class="check_wrap">
  <input type="checkbox" id="check_btn"/>
  <label for="check_btn"><span>알림 선택 유무</span></label>
</div> -->
<td>
<div class="form-check form-switch">
  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
  <label class="form-check-label" for="flexSwitchCheckDefault">알림 선택 유무</label>
</div>

<!-- <div class="form-floating">
  <textarea class="form-control" placeholder="내용을 입력하세요" id="floatingTextarea2" style="height: 100px"></textarea>
  <label for="floatingTextarea2">내용을 입력하세요</label>
</div> -->
</td>
</tr>
</table>



<jsp:include page="../../footer.jsp" />
	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script>
</body>
</html>