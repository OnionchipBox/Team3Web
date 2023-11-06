<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
#container_q {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 50vh;
}
table th{
	background-color:#fff;
}
</style>
</head>
<body>
<jsp:include page="../../header.jsp" />
<div id="container_q">
<form method="get" action="myQnA_list">
   <h1>1:1 문의 내역 총 ${listcount}건</h1>
    <table>
        <tr>
        	<th>번호</th>
            <th>제목</th>
            <th>문의 날짜</th>
            <!-- 다른 열들 추가 -->
        </tr>      
        <c:if test="${!empty myQnAList}">
        <c:forEach var="q" items="${myQnAList}">
     	<tr>
        	<td>${q.qnano}</td>
            <td>${q.qtitle}</td>
            <td>${q.qdate}</td>
        </tr>
        </c:forEach>
        </c:if>

    </table>
    
     <c:if test="${empty myQnAList}">
     		<h4>문의 내역이 없습니다.</h4>
     </c:if>
    
</form>
<input type="submit" class="btn btn-dark" onclick="location='myQnA';" value="문의하기" />
</div>


<jsp:include page="../../footer.jsp" />
	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>