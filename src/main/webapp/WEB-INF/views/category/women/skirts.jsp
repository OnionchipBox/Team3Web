<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>dresses</title>
<style>

</style>
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>
   <div class="container mt-4">
      <div class="text-start ms-1 me-1">
      
         <h4  class="text-dark text-center" style="font-weight: bold;">스커트 추천 컬렉션
            </h4>
         <h6 class="text-muted ms-1 text-center ">NUBE에서 추천하는 스커트</h6>
         <hr>
      
      <div class="row">
   <c:forEach items="${skirts}" var="Skirts">
    <div class="col-xl-3 col-lg-4 col-md-6 col-6 mb-2">
        <!-- Changed mb-4 to mb-2 -->
        <div class="card">
            <img src="<%=request.getContextPath()%>/images/${Skirts.productId}" class="card-img-top" alt="Product Image ${product.productId}">
            <div class="card-body">
                <p class="card-title mb-0" style="font-weight: bold;">${Skirts.name}</p>
                <p class="card-text mb-1"></p>
                <p class="card-text mt-3" style="font-weight: bold;">${Skirts.price}원</p>
                <!-- Link to product details page -->
                <a href="<%=request.getContextPath()%>/productItem?productId=${Skirts.productId}" class="stretched-link"></a>
            </div>
        </div>
    </div>
</c:forEach>
</div>
</div>
</div>
<jsp:include page="../../footer.jsp"></jsp:include>
</body>
   <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
</html>