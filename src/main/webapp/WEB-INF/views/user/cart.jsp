<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/cart.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/style.css">

<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script type="text/javascript">
   //이벤트 리스너 등록
   
</script>
<style>
/* CSS 스타일 */
.total-price {
    margin-top: 20px;
    margin-right:50px;
    text-align: right;
    font-size: 18px;
    font-weight: bold;
}
.total-box {
    background-color: #e6e6e6; /* 배경색 설정 */
    border: 1px solid #ccc; /* 테두리 설정 */
    border-radius: 5px; /* 모서리를 둥글게 만듭니다. */
    padding: 10px 20px; /* 안쪽 여백 설정 */
    display: inline-block; /* 요소를 인라인 블록으로 표시합니다. */
}
.total-label {
    margin-right: 20px;
}

.total-amount {
    color: #e74c3c; /* 원하는 색상으로 변경 */
}
.order-button {
    text-align: right; /* 오른쪽 정렬 */
    margin-top: 20px; /* 상단 여백 조절 */
    margin-right: 50px; /* 오른쪽 여백 조절 */
}
</style>
</head>
<body>

   <jsp:include page="../header.jsp" />
   <form name="cartForm" id="cartForm" method="post" class="cartForm"
      action="/user/cart">



      <!-- "장바구니 헤더" -->

      <div class="row head">

         <div class="check">선택</div>

         <div class="img">이미지</div>

         <div class="pname">상품명</div>

         <div class="basketprice" style="margin-left:580px;">가격</div>

         <div class="num"style="margin-right:50px;">수량</div>

         <div class="sum" style="margin-right:50px;">합계</div>

         <div class="basketcmd">삭제</div>

      </div>

      <!-- "장바구니 상품 목록" -->
      <div class="row data">
      <c:set var="totalPrice" value="${0}" />
         <c:forEach var="item" items="${list}">

            <div class="check">
               <input type="checkbox" name="buy" value="${item.productId}"
                  checked="">&nbsp;
            </div>
            <div>
               <a href="<%=request.getContextPath()%>/productItem?productId=${item.productId}"> <img
                  src="<%=request.getContextPath()%>/images/${item.productId}"
                  alt="Product Image ${item.productId}">
               </a>
               <!-- 이미지 표시 방법을 여기에 추가 -->
            </div>
            <div class="name" id="name" name="name">
               <span>${item.name}</span>
            </div>
            <div class="basketprice">
               <input type="hidden" name="p_price" id="formattedPrice_${item.productId}" class="p_price" data-price="${item.price}">
   <script>
        var price = ${item.price};
        var formattedPrice = price.toLocaleString('ko-KR');
        document.write(formattedPrice + "원");
    </script>
            </div>
            <div class="num">
               <!-- 수량 변경 -->
               <div class="updown">
                  <!-- name   ="p_num${cartOrProduct.productId}" -->
                  <input type="text"id="p_num_${item.productId}" name="p_num" class="p_num" size="2"
                     maxlength="4" class="p_num" value="${item.quantity}" data-product-id="${item.productId}"> <span><i
                     class="bi bi-arrow-up-circle up" ></i></span> <span><i
                     class="bi bi-arrow-down-circle down"></i></span>
               </div>
            </div>

            <div class="sum">  
               <span id="itemTotal_${item.productId}">   
               <script>
               // TODO totalPrice를 업데이트
               
        var totalPrice = ${item.price * item.quantity};
        var total = totalPrice.toLocaleString('ko-KR');
        document.write(total + "원");
             </script>
             </span> 
          </div>
              <c:set var="totalPrice" value="${totalPrice + (item.price * item.quantity)}" />
        <!-- 총 토탈 가격에 각 상품의 합계를 더합니다 -->
            <div class="basketcmd">
               <a href="#" class="abutton" data-product-id="${item.productId}">삭제</a>
            </div>
         </c:forEach>
      </div>
<div class="total-price">
    <div class="total-box">
        <span class="total-label">총 금액:</span>
        <span class="total-amount"> 
  <script>
   var totalPrice = ${totalPrice};
   var total = totalPrice.toLocaleString('ko-KR');
   document.write(total + "원");
</script>
       </span>
    </div>
</div>
<div class="order-button">
    <a href="<%=request.getContextPath()%>/order" class="btn btn-primary" >주문하기</a>
    <script>
    $(document).ready(function() {
        var error = "${error}"; // 모델에서 받은 error 메시지
   
   
        if (error) {
            alert(error);
        }
    });
</script>
</div>

   </form>
               
   <br>
   <br>
   <br>
   <jsp:include page="../footer.jsp" />

   <!-- Bootstrap JS and Popper.js -->
   <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
   <script src="/shop/resources/js/script.js"></script>


</body>
<script>
   $(".abutton").click(function(event) {
      event.preventDefault();

      var productId = $(this).data("product-id");
      var confirmDelete = confirm("정말 삭제하시겠습니까?");

      if (confirmDelete) {
         $.ajax({
            type : "POST",
            url : "/shop/user/cart/" + productId,
            success : function(data) {

               alert("삭제 성공.");
               location.href = "/shop/user/cart";
            },
            error : function() {
               console.log("서버 요청 실패:", status, error);
               alert("삭제 실패.");
            }
         });
      }
   });
</script>
<script>

$(".up").click(function() {
    var productId = $(this).closest(".updown").find(".p_num").attr("data-product-id");
    var quantityField = $("#p_num_" + productId);
    
    var newQuantity = parseInt(quantityField.val());
    newQuantity += 1;
    quantityField.val(newQuantity);

    // 증가한 수량을 서버로 보내기
    sendUpdateRequest(productId, newQuantity);
    console.log("productId::: newQuantity " +"제품 아이디:" +productId+ "수량 :"+ newQuantity);
    updateProductTotalPrice(productId);
});

$(".down").click(function() {
    var productId = $(this).closest(".updown").find(".p_num").attr("data-product-id");
    var quantityField = $("#p_num_" + productId);
    
    var newQuantity = parseInt(quantityField.val());
    if (newQuantity > 1) {
        newQuantity -= 1;
        quantityField.val(newQuantity);

        // 감소한 수량을 서버로 보내기
        sendUpdateRequest(productId, newQuantity);
        console.log("productId::: newQuantity " +"제품 아이디:" +productId+ "수량 :"+ newQuantity);
        updateProductTotalPrice(productId);
    }
});

function sendUpdateRequest(productId, newQuantity) {
   console.log("productId:"+ productId);
   console.log("newQuantity:"+ newQuantity);
   
    // 서버로 업데이트 요청을 보냅니다.
    $.ajax({
        type: "PATCH",
        url: "/shop/cart/update",
        data: {
            productId: productId,
            newQuantity: newQuantity
        },
        success: function(data) {
            // 성공 시, 수량 및 총 가격을 업데이트합니다.
            
        },
        error: function(xhr, status, error) {
            console.log("서버 요청 실패:", status, error);
            alert("수량 업데이트 실패.");
        }   
    });
}


function updateProductTotalPrice(productId) {
   console.log("productId: " + productId);
    var quantityField = $("#p_num_" + productId);
    var priceField = $("#formattedPrice_" + productId); // 수정된 부분: "formattedPrice_" + productId
    console.log("priceField: " + priceField);
    
    var itemTotalField = $("#itemTotal_" + productId);
    var newQuantity = parseInt(quantityField.val());
    var price = parseFloat(priceField.attr('data-price'));
    console.log("newQuantity: " + newQuantity);
   console.log("price: " + price);

    // 제품 가격 업데이트
    var productPrice = newQuantity * price;
    priceField.text(productPrice.toLocaleString('ko-KR') + "원");

    // 각 제품의 합계 업데이트
    var productTotal = newQuantity * price;
    itemTotalField.text(productTotal.toLocaleString('ko-KR') + "원");
}
</script>

</html>