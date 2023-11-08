<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<jsp:include page="../header.jsp" />
<%--관리자 메인 본문 --%>
<div id="aMain_cont">
	<div id="aBw_wrap">
		<h2 class="aBw_title">관리자 공지 작성</h2>
		<form method="post" action="admin_gongji_write_ok"
			onsubmit="return gw_check();">
			<table id="aBw_t">
				<tr>
					<th>이름</th>
					<td><input name="gname" id="gname" size="14" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input name="gtitle" id="gtitle" size="35" />
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="gpwd" id="gpwd"
						size="14" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="gcont" id="gcont" rows="9"
							cols="36"></textarea></td>
				</tr>
			</table>
			<div id="aBw_menu">
				<input type="submit" value="작성" /> <input type="reset" value="취소"
					onclick="$('#gname').focus();" /> <input type="button"
					value="목록" onclick="location='admin_gongji_list?page=${page}';" />
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