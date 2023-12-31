<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 공지내용</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
table th{

	background-color:#fff;
}

#container{
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 60vh;
}

#gwrap{
	margin-bottom:50px;
}

#gbutton{
	text-align:center;
}


</style>


</head>
<body>
<jsp:include page="../header.jsp" />

<div id="container">
	<div id="gwrap">
		<h2 class="gtitle">공지내용</h2>
		<table id="gtable">
			<tr>
				<th>제목</th>
				<td>${g.gtitle}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${gcont}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${g.ghit}</td>
			</tr>
		</table>
		<div id="gmenu">
			<input type="button" id="gbutton" class="btn btn-dark" value="공지목록" onclick="location='gongji_list';" />
		</div>
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