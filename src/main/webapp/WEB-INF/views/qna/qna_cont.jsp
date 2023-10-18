<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA내용보기</title>

	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
<jsp:include page="../header.jsp" />


	<div id="q_wrap">
		<h2 class="q_title">QnA</h2>
		<table id="q_t">
			<tr>
				<th>제목</th>
				<td>${q.qtitle}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${qna_cont}</td>
			</tr>
		</table>
		<div id="q_menu">
			<input type="button" value="답변"
				class="btn btn-dark" onclick="location='qna_cont?qnano=${q.qnano}&page=${page}&state=reply';" />
			<input type="button" value="수정"
				class="btn btn-dark" onclick="location='qna_cont?qnano=${q.qnano}&page=${page}&state=edit';" />
			<input type="button" value="삭제"
				class="btn btn-dark" onclick="location='qna_cont?qnano=${q.qnano}&page=${page}&state=del';" />
			<input type="button" value="목록"
				class="btn btn-dark" onclick="location='qna_list?page=${page}';" />
		</div>
		
	
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>