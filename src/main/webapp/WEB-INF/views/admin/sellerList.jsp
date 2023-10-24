<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 전용 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
.custom-margin {
        margin-left: 10px;
    }
</style>
<script>
function ForceSellerDelete() {
    if (confirm("업체 등록 해제 처리 하시겠습니까?")) {
        document.getElementById("sellerDeleteForm").action = "<%=request.getContextPath()%>/sellerDelete";
        document.getElementById("sellerDeleteForm").submit();
        if (DeleteSuccessMessage) {
            alert(DeleteSuccessMessage);
        }
    } else {
        window.location.href = "/admin/sellerList";
    }
}

var successMessage = '${successMessage}';
if (successMessage === 'VerifyMessageOK') {
    alert("처리되었습니다");
}
</script>
</head>
<body>
<jsp:include page="../header.jsp" />

<div class="container">
    <h1 class="mt-5">판매업체 목록</h1>
    <div class="table-responsive">
    <table class="table table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>업체명</th>
                <th>사업자 등록번호</th>
                <th>업체 등록 날짜</th>
                <th>업체 코드</th>
                <th>업체 관리</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${sellerList}" var="seller">
                <tr>
                    <td>${seller.id}</td>
                    <td>${seller.sellerName}</td>
                    <td>${seller.sellerRegistrationNumber}</td>
                    <td>${seller.registrationDate}</td>
                    <td>${seller.sellerCode}</td>
                    <td>
					<!-- 판매자 관리 폼 -->
                    <form action="<%=request.getContextPath()%>/sellerDelete" method="post">
                     <input type="hidden" name="sellerId" value="${seller.id}" />
                     <input type="hidden" name="userVerify" value="${seller.verify}" />
                     <input type="hidden" name="sellerCode" value="${seller.sellerCode}" />
                    <input type="submit" value="업체 등록 해제" class="btn btn-danger" onclick="ForceSellerDelete();" />
                    </form>
                </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 페이지네이션 -->
    <ul class="pagination justify-content-center mt-4">
        <c:if test="${currentPage > 1}">
            <li class="page-item">
                <a class="page-link" href="?page=${currentPage - 1}&search=${search}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        </c:if>
        
        <c:forEach begin="1" end="${totalPages}" var="pageNo">
            <li class="page-item ${pageNo == currentPage ? 'active' : ''}">
                <a class="page-link" href="?page=${pageNo}&search=${search}">${pageNo}</a>
            </li>
        </c:forEach>
        
        <c:if test="${currentPage < totalPages}">
            <li class="page-item">
                <a class="page-link" href="?page=${currentPage + 1}&search=${search}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </c:if>
    </ul>
    <div class="row mt-4">
        <div class="col-md-6 offset-md-3">
            <form class="form-inline" action="?page=1" method="get">
                <div class="input-group">
                    <input type="text" class="form-control" name="search" placeholder="ID 또는 업체명으로 검색">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit">검색</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</div>

<jsp:include page="../footer.jsp" />
<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<script src="/shop/resources/js/script.js"></script>
</body>
</html>
