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
function ForceProductDelete() {
    if (confirm("삭제 처리 하시겠습니까?")) {
        document.getElementById("productDeleteForm").action = "<%=request.getContextPath()%>/productDelete";
        document.getElementById("productDeleteForm").submit();
        if (DeleteSuccessMessage) {
            alert(DeleteSuccessMessage);
        }
    } else {
        window.location.href = "/admin/productList";
    }
}

function ForceProductDeleteAll() {
    if (confirm("0번값 제품 전체 삭제 처리 하시겠습니까?")) {
        document.getElementById("productDeleteForm").action = "<%=request.getContextPath()%>/productDeleteAll";
        document.getElementById("productDeleteForm").submit();
        if (DeleteSuccessMessage) {
            alert(DeleteSuccessMessage);
        }
    } else {
        window.location.href = "/admin/productList";
    }
}

</script>
</head>
<body>
<jsp:include page="../header.jsp" />

<div class="container">
    <h1 class="mt-5">제품 목록</h1>
    <div class="table-responsive">
    <form action="<%=request.getContextPath()%>/productDeleteAll" method="post">
    <input type="hidden" name="sellerCode" value="0" />
    <input type="submit" value="0번값 제품 삭제" class="btn btn-danger" onclick="ForceProductDeleteAll();" />
    </form>
    <table class="table table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <th>제품ID</th>
                <th>제품명</th>
                <th>가격</th>
                <th>수량</th>
                <th>PCODE</th>
                <th>카테고리</th>
                <th>판매자 코드</th>
                <th>제품 관리</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${productList}" var="product">
                <tr>
                    <td>${product.productId}</td>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>${product.stock}</td>
                    <td>${product.pcode}</td>
                    <td>${product.category}</td>
                    <td>${product.sellerCode}</td>
                    <td>
                    <!-- 제품 관리 폼 -->
                    <form action="<%=request.getContextPath()%>/productDelete" method="post">
                     <input type="hidden" name="productId" value="${product.productId}" />
                     <input type="hidden" name="sellerCode" value="${product.sellerCode}" />
                    <input type="submit" value="제품 삭제" class="btn btn-danger" onclick="ForceProductDelete();" />
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
                    <input type="text" class="form-control" name="search" placeholder="제품ID 또는 제품명으로 검색">
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
