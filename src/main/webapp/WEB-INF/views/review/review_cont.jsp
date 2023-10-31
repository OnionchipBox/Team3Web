<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
<div id="bsC_wrap">
		<h2 class="rtitle">내용보기</h2>
		<table id="rtable">
			<tr>
				<th>제목</th>
				<td>${r.retitle}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${review_cont}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${r.rehit}</td>
			</tr>
			<c:if test="${!empty r.refile}">
				<%--첨부파일이 있는경우--%>
				<tr>
					<th>첨부이미지</th>
					<%=request.getContextPath()%>
					<td><img src="./resources/imgUpload/${r.refile}" width="130"
						height="100" alt="이미지"/></td>
				</tr>
			</c:if>
		</table>
		
		

		<div id="bsC_menu">
			<input type="button" class="btn btn-dark" value="답변"
				onclick="location='review_cont?reno=${r.reno}&page=${page}&state=reply';" />
			<input type="button" class="btn btn-dark" value="수정"
				onclick="location='review_cont?reno=${r.reno}&page=${page}&state=edit';" />
			<input type="button" class="btn btn-dark" value="삭제"
				onclick="location='review_cont?reno=${r.reno}&page=${page}&state=del';" />
			<input type="button" class="btn btn-dark" value="목록"
				onclick="location='review_list?page=${page}';" />
		</div>
	</div>

	<!-- 
	<c:choose>
    <c:when test="${not empty sessionScope.user}">
        <!-- 사용자가 로그인한 경우 
        <div id="bsC_menu">
            <input type="button" class="btn btn-dark" value="답변"
                   onclick="location='review_cont?reno=${r.reno}&page=${page}&state=reply';" />
            <input type="button" class="btn btn-dark" value="수정"
                   onclick="location='review_cont?reno=${r.reno}&page=${page}&state=edit';" />
            <input type="button" class="btn btn-dark" value="삭제"
                   onclick="location='review_cont?reno=${r.reno}&page=${page}&state=del';" />
            <input type="button" class="btn btn-dark" value="목록"
                   onclick="location='review_list?page=${page}';" />
        </div>
    </c:when>
    <c:otherwise>
        <!-- 사용자가 로그인하지 않은 경우 
        <!-- 버튼을 숨김 
        <!-- 아무 내용도 출력하지 않으므로 버튼이 표시되지 않습니다. 
    </c:otherwise>
</c:choose>
 -->	
	


<hr>
<jsp:include page="../footer.jsp" />
<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script>



</body>
</html>