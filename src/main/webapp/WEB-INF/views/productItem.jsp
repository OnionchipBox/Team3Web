<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Item - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
   rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/productItem.css">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

</head>
<style>
/* CSS를 사용하여 버튼 스타일을 꾸밉니다. */
.addToCartButton {
    background-color: #FF4500; /* 배경 색상 설정 */
    color: #fff; /* 글자 색상 설정 */
    border: none; /* 테두리 제거 */
    padding: 10px 20px; /* 내부 여백 설정 */
    border-radius: 5px; /* 둥근 테두리 설정 */
    font-size: 16px; /* 글자 크기 설정 */
    cursor: pointer; /* 커서 스타일 설정 */
    transition: background-color 0.3s; /* 마우스 오버 효과를 위한 전환 효과 설정 */
}

.addToCartButton:hover {
    background-color: #0056b3; /* 마우스 오버 시 배경 색상 변경 */
}
</style>
<body>
   <!-- Navigation-->
   <jsp:include page="header.jsp" />
   <!-- Product section-->
   
   <section class="py-5">
      <div class="container px-4 px-lg-5 my-5">
      
         <div class="row gx-4 gx-lg-5 align-items-center">
         
            <div class="col-md-6">
            
               <img src="<%=request.getContextPath()%>/images/${product.productId}" style="width:500px; height: 500px;"alt="Product Image ${product.productId}">
            </div>
            <div class="col-md-6">
         <h2 style="margin-bottom:80px;">${product.name}</h2> 
               <div class="small mb-1 " style=" margin-top: -50px;">구매가 </div>
               <h2 class=" fw-bolder">  <script>
        var price = ${product.price};
        var formattedPrice = price.toLocaleString('ko-KR');
        document.write(formattedPrice + "원");
    </script></h2>
               <div class="fs-5 mb-4">
               <span class="text-price ">  Our product is excellent          </span>
               <!--  text-decoration-line-through 가격 줄 긋는다 -->
               </div>
               
                  <input class="form-control text-center me-3" id="quantity"
                     type="num" value="1" style="max-width: 3rem; width:50px;" />
                  
                     
               
            <label for="cartSize" class="me-2"></label> <select
                        class="form-select" id="cartSize"style="font-weight: bold;">
                     <option value ="#"  >옵션 선택</option>
                        <option value="220">220mm</option>
                        <option value="225">225mm</option>
                        <option value="230">230mm</option>
                        <!-- 다른 사이즈 옵션을 추가하세요 -->
                     </select>
                  <div class="d-flex align-items-center mb-3">
   
                  <button class="addToCartButton" style="width:590px; height:60px; margin-top:20px; " type="button">
                     <i class="bi-cart-fill me-1"></i> 장바구니
                  </button>
                  
               <div class="d-flex">
                  
                     <!-- 여기에 제품의 다른 사이즈 옵션을 추가하세요 -->
                     
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Related items section-->
   <section class="py-5 bg-light">
      <div class="container px-4 px-lg-5 mt-5">
         <h2 class="fw-bolder mb-4">Related products</h2>
         <div
            class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach items="${products}" var="product">

            <div class="col mb-5">
               <div class="card h-100">
                  <!-- Product image-->
               <img src="<%=request.getContextPath()%>/images/${product.productId}" alt="Product Image ${product.productId}">
                  <!-- Product details-->
                  <div class="card-body p-4">
                     <div class="text-center">
                  
                     
                        <!-- Product name-->
                        <h5 class="fw-bolder">Fancy Product</h5>
                        <!-- Product price-->
                        $40.00 - $80.00
                     </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                     <div class="text-center">
                        <a class="btn btn-outline-dark mt-auto" href="#">View
                           options</a>
                     </div>
                  </div>
               </div>
            </div>
                <!-- Product details -->
    <!-- ... -->
</c:forEach>
            <div class="col mb-5">
               <div class="card h-100">
                  <!-- Sale badge-->
                  <div class="badge bg-dark text-white position-absolute"
                     style="top: 0.5rem; right: 0.5rem">Sale</div>
                  <!-- Product image-->
                     <img src="<%=request.getContextPath()%>/images/${product.productId}" alt="Product Image ${product.productId}">
                  
                  <!-- Product details-->
                  <div class="card-body p-4">
                     <div class="text-center">
                        <!-- Product name-->
                        <h5 class="fw-bolder">Special Item</h5>
                        <!-- Product reviews-->
                        <div
                           class="d-flex justify-content-center small text-warning mb-2">
                           <div class="bi-star-fill"></div>
                           <div class="bi-star-fill"></div>
                           <div class="bi-star-fill"></div>
                           <div class="bi-star-fill"></div>
                           <div class="bi-star-fill"></div>
                        </div>
                        <!-- Product price-->
                        <span class="text-muted text-decoration-line-through">$20.00</span>
                        $18.00
                     </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                     <div class="text-center">
                        <a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col mb-5">
               <div class="card h-100">
                  <!-- Sale badge-->
                  <div class="badge bg-dark text-white position-absolute"
                     style="top: 0.5rem; right: 0.5rem">Sale</div>
                  <!-- Product image-->
                     <img src="<%=request.getContextPath()%>/images/${product.productId}" alt="Product Image ${product.productId}">
                     
                  <!-- Product details-->
                  <div class="card-body p-4">
                     <div class="text-center">
                        <!-- Product name-->
                        <h5 class="fw-bolder">Sale Item</h5>
                        <!-- Product price-->
                        <span class="text-muted text-decoration-line-through">$50.00</span>
                        $25.00
                     </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                     <div class="text-center">
                        <a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col mb-5">
               <div class="card h-100">
                  <!-- Product image-->
                  <img src="<%=request.getContextPath()%>/images/${product.productId}" alt="Product Image ${product.productId}">
                  <!-- Product details-->
                  <div class="card-body p-4">
                     <div class="text-center">
                        <!-- Product name-->
                        <h5 class="fw-bolder">Popular Item</h5>
                        <!-- Product reviews-->
                        <div
                           class="d-flex justify-content-center small text-warning mb-2">
                           <div class="bi-star-fill"></div>
                           <div class="bi-star-fill"></div>
                           <div class="bi-star-fill"></div>
                           <div class="bi-star-fill"></div>
                           <div class="bi-star-fill"></div>
                        </div>
                        <!-- Product price-->
                        $40.00
                     </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                     <div class="text-center">
                        <a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Footer-->
   <footer class="py-5 bg-dark">
      <div class="container">
         <p class="m-0 text-center text-white">Copyright &copy; Your
            Website 2023</p>
      </div>
   </footer>
   <!-- Bootstrap core JS-->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->
<c:if test="${not empty error}">
   <script>
        // JavaScript를 사용하여 경고 창 띄우기
        alert("${error}");
    </script>
</c:if>
</body>
<script>
    $(document).ready(function() {
        $(".addToCartButton").click(function() {
            var productId = "${product.productId}"; // 실제 제품 ID로 대체
            var quantity = parseInt($("#quantity").val()); // 입력 필드에서 수량을 가져옵니다.
            var cartSize = $("#cartSize").val();
            console.log("cartSize:", cartSize);
            
       
                // 제품을 장바구니에 추가하기 위한 Ajax 요청
                $.ajax({
                    type: "POST",
                    url: "/shop/user/cart", // 실제 카트에 추가하는 URL로 대체
                    data: {
                        productId: productId,
                        quantity: quantity,
                        cartSize: cartSize
                    },
                    success: function(response) {
                        if (response === "duplicate") {
                            // 이미 장바구니에 있는 상품이라면 메시지를 표시하거나 다른 작업을 수행합니다.
                            alert("이미 장바구니에 있는 상품입니다.");
                        } else if (response === "add") {
                            // 추가가 완료된 경우, 성공 메시지를 표시하거나 다른 작업을 수행합니다.
                            alert("제품이 장바구니에 추가되었습니다.");
                        } else {
                            alert("실패 했습니다");
                        }
                    },
                    error: function() {
                        alert("제품을 장바구니에 추가하는 데 실패했습니다.");
                    }
                });
             
                // 사용자가 로그인하지 않은 경우
                // 로그인 페이지로 리디렉션
                 // 로그인 페이지의 URL로 대체
            
        });
    });
</script>

</html>