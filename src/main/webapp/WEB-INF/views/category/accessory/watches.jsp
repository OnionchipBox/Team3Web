<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team3Web</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<style>
  /* Scroll To Top Button Styles */
  #scroll-btn {
    opacity: 0;
    width: 40px;
    height: 40px;
    color: #fff;
    background-color: #000000; /* 배경색을 흰색으로 변경 */

    position: fixed;
    bottom: 10%;
    right: 10%;
    border: 2px solid #fff;
    border-radius: 50%;
    font: bold 20px monospace;
    transition: opacity 0.5s, transform 0.5s;
    cursor: pointer;
    display: flex; /* Flexbox를 사용하여 아이콘을 중앙으로 정렬 */
  align-items: center; /* 세로 중앙 정렬 */
  justify-content: center; /* 가로 중앙 정렬 */
  }

  #scroll-btn.show {
    opacity: 1;
    transition: opacity 1s, transform 1s;
  }
</style>
<body>
   
<jsp:include page="../../header.jsp"></jsp:include>
   <div class="container mt-4">
      <div class="text-start ms-1 me-1">
      
         <h4  class="text-dark text-center" style="font-weight: bold;">시계 추천 컬렉션
            </h4>
         <h6 class="text-muted ms-1 text-center ">NUBE에서 추천하는 시계</h6>
         <hr>
      

      <div class="row">
         <!-- Repeat the below card structure for each product -->
           <c:forEach items="${wathes}" var="watches">
            <div class="col-xl-3 col-lg-4 col-md-6 col-6 mb-2">
                <!-- Changed mb-4 to mb-2 -->
                <div class="card">
                    <img src="<%=request.getContextPath()%>/images/${watches.productId}" class="card-img-top" style="max-width: 260px; " alt="Product Image ${watches.productId}">
                    <div class="card-body">
                        <p class="card-title mb-0" style="font-weight: bold;">${watches.name}</p>
                        <p class="card-text mb-1"></p>
                        <p class="card-text mt-3" style="font-weight: bold;">${watches.price}원</p>
                        <!-- Link to product details page -->
                        <a href="<%=request.getContextPath()%>/productItem?productId=${watches.productId}" class="stretched-link"></a>
                    </div>
                </div>
            </div>
        </c:forEach>
         <!-- End of the repeating card structure -->
      </div>
   </div>
   </div>
   <div class="text-center mt-0">
      <!-- Adjusted the margin-top to 2rem -->
      <a class="btn btn-outline-secondary mb-3" id="load-more-button">더보기</a>
   </div>
   
   <jsp:include page="../../footer.jsp" />
 <button id="scroll-btn"><i class="bi bi-arrow-up"></i></button>
   <!-- Bootstrap JS and Popper.js -->
   <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
</body>
<script>


  // Scroll To Top Button Functionality
  var scrollBtn = document.getElementById("scroll-btn");

  window.addEventListener('scroll', function () {
    if (window.scrollY > 50) {
      scrollBtn.classList.add('show');
    } else {
      scrollBtn.classList.remove('show');
    }
  });

  scrollBtn.addEventListener('click', function () {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
  
  document.getElementById("load-more-button").addEventListener("click", function () {
       loadMoreImages();
   });

  
</script>
   <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
</html>