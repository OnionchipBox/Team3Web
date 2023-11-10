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
<script>
function handlePageLoad() {
    if (document.cookie.indexOf('popupShown=1') === -1 || !isPopupClosed()) {
        openPopup();
    }
}

window.onload = handlePageLoad;

function openPopup() {
    var popupFeatures = 'width=1080,height=1920,scrollbars=yes';
    var popupWindow = window.open('', '_blank', popupFeatures);
    var imageUrl = '<%=request.getContextPath()%>/resources/img/index/mainPopup.png';

    popupWindow.document.write('<img src="' + imageUrl + '" alt="Popup Image">');
    popupWindow.document.title = '배송 공지';

    popupWindow.document.write('<input type="checkbox" id="hidePopupCheckbox">');
    popupWindow.document.write('<label for="hidePopupCheckbox">하루 동안 보지 않기</label>');

    var hidePopupCheckbox = popupWindow.document.getElementById('hidePopupCheckbox');

    if (!hidePopupCheckbox.checked) {
        var expiryDate = new Date();
        expiryDate.setDate(expiryDate.getDate() + 1);
        document.cookie = 'popupShown=1; expires=' + expiryDate.toUTCString() + '; path=/shop';
    }
}

function isPopupClosed() {
    return document.cookie.indexOf('popupShown=1') !== -1;
}
</script>


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
<div class="container mt-4">
  <div class="text-start ms-1 me-1">
    <h5 class="text-dark ms-1" style="font-weight: bold;"></h5>
    <h6 class="text-muted ms-1"></h6>
  </div>

  
  <div class="row">
    <c:forEach var="i" begin="1" end="10">
        <div class="col-2 mb-2" style="margin-left: 25px; margin-top: 10px;">
            <!-- 5개의 열 중에서 각각을 1/5 너비로 설정 -->
            <img src="<%=request.getContextPath()%>/resources/img/index/main${i}.png"
                class="card-img-top" style="width: 200px; height: 100px;" alt="women Image ${i}">
            <!-- 제품 상세 페이지로 연결하는 링크 -->
            <div>
            
        </div>
        </div>
    </c:forEach>
</div>
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
      <a class="btn btn-outline-secondary mb-3" id="load-more-button1">더보기</a>
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
         <div class="text-center mt-0">
      <!-- Adjusted the margin-top to 2rem -->
      <a class="btn btn-outline-secondary mb-3" id="load-more-button2">더보기</a>
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

<script>
function navigateToProductDetails(productId) {
    var productDetailsLink = "<%=request.getContextPath()%>/product/details/" + productId;
    window.location.href = productDetailsLink;
}
</script>
</html>