<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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



<style>

#container_r{
	display:flex;
	justify-content: center;
	align-items: center;
	min-height: 50vh;
}

#rwrap {
	width: 90%;
	position: relative; /* 요소의 위치를 조정하기 위해 필요한 기본 속성 */
	top: -60px; /* 위로 이동할 픽셀 수를 조정하세요. 음수 값은 위로 이동, 양수 값은 아래로 이동 */
	
}

#rtable {
	border-style:2px solid #000;
	overflow: auto; /* 내용이 넘칠 때 스크롤 표시 */
	table-layout: fixed;
    border-spacing: 0;
	
}

table th{
	background-color:#fff;
	border-bottom: 2px solid #9ca3a6; /* 가로 구분선 추가 및 회색 계열의 바탕색 설정 */
	padding: 15px; /* 셀 안의 내용과 내부 여백 설정 */
	text-align: center; /* 텍스트 가운데 정렬 */
}


#rmenu{
	text-align:center;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
<div id="container_r">
	<div id="rwrap">
		<h2 class="rtitle">Review</h2>
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
		
		
<!--
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
-->		



<c:choose>
    <c:when test="${sessionScope.loggedInUserRole == 'ROLE_ADMIN'}">
        <!-- 관리자가 로그인한 경우 모든 기능 사용 가능 -->
        <div id="rmenu">
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
        <!-- 관리자 외의 사용자 혹은 로그인 안 한 이용자들은 목록 버튼만 보이게
        (추후에 사용자 로그인 한 사람에게는 로그인 정보 일치하는지 확인 하고 내가 쓴 게시글만 수정할 수 있게 해보기!!) -->
        <div id="rmenu">
            <!--<input type="button" class="btn btn-dark" value="목록"
                   onclick="location='review_list?page=${page}';" />-->
                   <button type="button" class="btn btn-dark" onclick="goBack();">목록</button>  
                   
        </div>
    </c:otherwise>
</c:choose>


</div>
	
</div>

<script>
function goBack() {
    window.history.back(); // 이전 페이지로 이동
}
</script>

<jsp:include page="../footer.jsp" />
<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script>



</body>
</html>