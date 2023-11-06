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
   <jsp:include page="header.jsp" />
   <div id="carouselExampleAutoplaying" class="carousel slide mt-1   "
      data-bs-ride="carousel ">
      <!-- Carousel Indicators -->
      <ol class="carousel-indicators">
         <li data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="0"
            class="active"></li>
         <li data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="1"></li>
         <li data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
         <div class="carousel-item active">
            <img src="<%=request.getContextPath()%>/resources/img/slider/sample_image_1.jpg"
               class="d-block w-100" alt="slider_image_1">
         </div>
         <div class="carousel-item">
            <img src="<%=request.getContextPath()%>/resources/img/slider/sample_image_2.jpg"
               class="d-block w-100" alt="slider_image_2">
         </div>
         <div class="carousel-item">
            <img src="<%=request.getContextPath()%>/resources/img/slider/sample_image_3.jpg"
               class="d-block w-100" alt="slider_image_3">
         </div>
      </div>
      <button class="carousel-control-prev" type="button"
         data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button"
         data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="visually-hidden">Next</span>
      </button>
   </div>

   <!-- Product Cards -->
   <div class="container mt-4">
      <div class="text-start ms-1 me-1">
         <h5 class="text-dark ms-1" style="font-weight: bold;">Just
            Dropped</h5>
         <h6 class="text-muted ms-1">신상품</h6>
         <hr>
      </div>

      <div class="row">
         <!-- Repeat the below card structure for each product -->
           <c:forEach items="${products}" var="product" varStatus="loop">
            <c:if test="${loop.index < 4}">
            <div class="col-xl-3 col-lg-4 col-md-6 col-6 mb-2">
                <!-- Changed mb-4 to mb-2 -->
                <div class="card">
                    <img src="<%=request.getContextPath()%>/images/${product.productId}" class="card-img-top"   style="max-width: 260px;" alt="Product Image ${product.productId}">
                    <div class="card-body">
                        <p class="card-title mb-0" style="font-weight: bold;">${product.name}</p>
                        <p class="card-text mb-1"></p>
                          <script>
        var price = ${product.price};
        var formattedPrice = price.toLocaleString('ko-KR');
        document.write(formattedPrice + "원");
    </script>
   
    <p class="card-text" style="font-size: 12px; margin-top: 0px; color: #888;">구매가</p>
                        <a href="<%=request.getContextPath()%>/productItem?productId=${product.productId}" class="stretched-link"></a>
                    </div>
                </div>
            </div>
            </c:if>
        </c:forEach>
         <!-- End of the repeating card structure -->
      </div>
   </div>
      
   <div class="text-center mt-0">
      <!-- Adjusted the margin-top to 2rem -->
      <a class="btn btn-outline-secondary mb-3" id="load-more-button">더보기</a>
   </div>
   <!-- Product Cards -->
   <div class="container mt-4">
      <div class="text-start ms-1 me-1">
         <h5 class="text-dark ms-1" style="font-weight: bold;">Just
            Dropped</h5>
         <h6 class="text-muted ms-1">신상품</h6>
         <hr>
      </div>

      <div class="row">
         <!-- Repeat the below card structure for each product -->
           <c:forEach items="${products1}" var="product1" varStatus="loop">
            <c:if test="${loop.index < 4}">
            <div class="col-xl-3 col-lg-4 col-md-6 col-6 mb-2">
                <!-- Changed mb-4 to mb-2 -->
                <div class="card">
                    <img src="<%=request.getContextPath()%>/images/${product1.productId}" class="card-img-top"   style="max-width: 260px;" alt="Product Image ${product1.productId}">
                    <div class="card-body">
                        <p class="card-title mb-0" style="font-weight: bold;">${product1.name}</p>
                        <p class="card-text mb-1"></p>
                          <script>
        var price = ${product1.price};
        var formattedPrice = price.toLocaleString('ko-KR');
        document.write(formattedPrice + "원");
    </script>
   
    <p class="card-text" style="font-size: 12px; margin-top: 0px; color: #888;">구매가</p>
                        <a href="<%=request.getContextPath()%>/productItem?productId=${product1.productId}" class="stretched-link"></a>
                    </div>
                </div>
            </div>
            </c:if>
        </c:forEach>
         <!-- End of the repeating card structure -->
      </div>
   </div>
   
   
   
   <jsp:include page="footer.jsp" />
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
  
 
</script>
<script>
document.getElementById("load-more-button").addEventListener("click", function () {
    loadMoreImages();
});


//이 부분은 더보기 버튼 클릭 시 수행될 함수입니다.
function loadMoreImages() {
   
    // 총 제품 수와 현재 표시된 제품 수
    var totalProducts = ${products.size()}; // JSTL을 사용하여 Java 코드로 가져오세요
    var displayedProducts = document.querySelectorAll('.card').length;

    // 한 번에 추가할 제품 수
    var productsToAdd = 4;

    // 새로운 제품을 불러올 때, 화면에 추가할 HTML 문자열
    var newProductsHTML = '';
    console.log("Button clicked"); // 버튼 클릭 여부 확인
    console.log("Total products: " + totalProducts); // 제품 수 확인
    console.log("Displayed products: " + displayedProducts); // 표시된 제품 수 확인
    // 새로운 제품을 HTML 문자열에 추가
    for (var i = displayedProducts; i < Math.min(displayedProducts + productsToAdd, totalProducts); i++) {
        var product = ${products.get(i)}; // JSTL을 사용하여 Java 코드로 가져오세요

        var price = ${product.price};
        var formattedPrice = price.toLocaleString('ko-KR');

        newProductsHTML +=  `
            <div class="col-xl-3 col-lg-4 col-md-6 col-6 mb-2">
                <div class="card">
                    <img src="${product.imagePath}" class="card-img-top" style="max-width: 260px;" alt="Product Image ${product.productId}">
                    <div class="card-body">
                        <p class="card-title mb-0" style="font-weight: bold;">${product.name}</p>
                        <p class="card-text mb-1">${formattedPrice}원</p>
                        <p class="card-text" style="font-size: 12px; margin-top: 0px; color: #888;">구매가</p>
                        <a href="<%=request.getContextPath()%>/productItem?productId=${product.productId}" class="stretched-link"></a>
                    </div>
                </div>
            </div>
        `;
    }

    // 새로운 제품을 표시할 div에 추가
    document.querySelector('.row').innerHTML += newProductsHTML;
}

// "더보기" 버튼 클릭 시 loadMoreImages 함수 실행
document.getElementById("load-more-button").addEventListener("click", function () {
    loadMoreImages();
});
</script>
</html> 