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
var successMessage = '${successMessage}';
if (successMessage === 'VerifyMessageOK') {
    alert("변경이 완료되었습니다");
}

const DeleteSuccessMessage = '<%= request.getAttribute("DeleteSuccessMessage") %>';

function showConfirmation() {
    if (confirm("변경하시겠습니까?")) {
        document.getElementById("userVerifyForm").action = "<%=request.getContextPath()%>/userVerify";
        document.getElementById("userVerifyForm").submit();
        
    } else {
    	alert("취소되었습니다");
        window.location.href = "/admin/userList";
    }
}

function ForceUserDelete() {
    if (confirm("탈퇴 처리 하시겠습니까?")) {
        document.getElementById("userDeleteForm").action = "<%=request.getContextPath()%>/userDelete";
        document.getElementById("userDeleteForm").submit();
        if (DeleteSuccessMessage) {
            alert(DeleteSuccessMessage);
        }
    } else {
        window.location.href = "/admin/userList";
    }
}

</script>
</head>
<body>
<jsp:include page="../header.jsp" />

<div class="container">
    <h1 class="mt-5">회원 목록</h1>
    <div class="table-responsive">
    <table class="table table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>이름</th>
                <th>닉네임</th>
                <th>성별</th>
                <th>전화번호</th>
                <th class="col-1">생일</th>
                <th>우편번호</th>
                <th>주소</th>
                <th>가입날짜</th>
                <th>마일리지</th>
                <th>회원등급</th>
                <th>회원관리</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.username}</td>
                    <td>${user.name}</td>
                    <td>${user.nickname}</td>
                    <td>${user.gender}</td>
                    <td>${user.phone}</td>
                    <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd" /></td>
                    <td>${user.zipcode}</td>
                    <td>${user.address}</td>
                    <td>${user.joindate}</td>
                    <td>${user.point}</td>
                    <td>${user.verify}</td>
                    <td>
                    <!-- 회원 등급 수정 폼 -->
                    <form action="<%=request.getContextPath()%>/userVerify" method="post" class="d-flex align-items-center">
                        <select name="userVerify">
                            <option value="USER" ${user.verify == 'USER' ? 'selected' : ''}>USER</option>
                            <option value="SELLER" ${user.verify == 'SELLER' ? 'selected' : ''}>SELLER</option>
                        </select>
                        <input type="hidden" name="username" value="${user.username}" />
                        <span class="custom-margin"></span>
                        <input type="submit" value="변경" class="btn-outline-dark" onclick="showConfirmation();" />
                    </form>
                    <form action="<%=request.getContextPath()%>/userDelete" method="post">
                     <input type="hidden" name="username" value="${user.username}" />
                    <input type="submit" value="회원 탈퇴" class="btn btn-danger" onclick="ForceUserDelete();" />
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
                    <input type="text" class="form-control" name="search" placeholder="ID 또는 이름으로 검색">
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
