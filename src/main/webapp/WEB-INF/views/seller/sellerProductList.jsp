<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
.custom-margin {
        margin-left: 10px;
    }
</style>
<script>
function SellerProductDelete() {
    if (confirm("삭제 처리 하시겠습니까?")) {
        document.getElementById("productDeleteForm").action = "<%=request.getContextPath()%>/sellerProductDelete";
        document.getElementById("productDeleteForm").submit();
        if (DeleteSuccessMessage) {
            alert(DeleteSuccessMessage);
        }
    } else {
    	alert("취소되었습니다");
    	document.getElementById("productDeleteForm").reset();
        return false;
        window.location.href = "/shop/seller/sellerProductList";
    }
}
</script>
</head>
<body>
<jsp:include page="../header.jsp" />

<div class="container">
    <h1 class="mt-5">제품 목록</h1>
    <div class="table-responsive">
    <form action="<%=request.getContextPath()%>/sellerProductDelete" method="post">
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
                <th>제품 관리</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${productList}" var="product">
              <c:if test="${product.sellerCode eq sessionScope.sellerCode}">
                <tr>
                    <td>${product.productId}</td>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>${product.stock}</td>
                    <td>${product.pcode}</td>
                    <td>${product.categoryId}</td>
                    <td>
                    <!-- 제품 관리 폼 -->
                    <form action="<%=request.getContextPath()%>/sellerProductDelete" method="post">
                     <input type="hidden" name="productId" value="${product.productId}" />
                     <input type="hidden" name="sellerCode" value="${product.sellerCode}" />
                    <input type="submit" value="제품 삭제" class="btn btn-danger" onclick="SellerProductDelete();" />
                    </form>
                </td>
                </tr>
              </c:if>
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
                    <input type="text" class="form-control" name="search" placeholder="제품명으로 검색">
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
