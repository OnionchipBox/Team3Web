<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<script src="../assets/js/color-modes.js"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.118.2">
<title>Checkout example · Bootstrap v5.3</title>

<link rel="canonical"
   href="https://getbootstrap.com/docs/5.3/examples/checkout/">

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">

<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- 카카오페이 결제를 위한 아임포트 라이브러리 -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.container {
   max-width: 960px;
}

.bd-placeholder-img {
   font-size: 1.125rem;
   text-anchor: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   user-select: none;
}

@media ( min-width : 768px) {
   .bd-placeholder-img-lg {
      font-size: 3.5rem;
   }
}

.b-example-divider {
   width: 100%;
   height: 3rem;
   background-color: rgba(0, 0, 0, .1);
   border: solid rgba(0, 0, 0, .15);
   border-width: 1px 0;
   box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
      rgba(0, 0, 0, .15);
}

.b-example-vr {
   flex-shrink: 0;
   width: 1.5rem;
   height: 100vh;
}

.bi {
   vertical-align: -.125em;
   fill: currentColor;
}

.nav-scroller {
   position: relative;
   z-index: 2;
   height: 2.75rem;
   overflow-y: hidden;
}

.nav-scroller .nav {
   display: flex;
   flex-wrap: nowrap;
   padding-bottom: 1rem;
   margin-top: -1px;
   overflow-x: auto;
   text-align: center;
   white-space: nowrap;
   -webkit-overflow-scrolling: touch;
}

.btn-bd-primary { -
   -bd-violet-bg: #712cf9; -
   -bd-violet-rgb: 112.520718, 44.062154, 249.437846; -
   -bs-btn-font-weight: 600; -
   -bs-btn-color: var(- -bs-white); -
   -bs-btn-bg: var(- -bd-violet-bg); -
   -bs-btn-border-color: var(- -bd-violet-bg); -
   -bs-btn-hover-color: var(- -bs-white); -
   -bs-btn-hover-bg: #6528e0; -
   -bs-btn-hover-border-color: #6528e0; -
   -bs-btn-focus-shadow-rgb: var(- -bd-violet-rgb); -
   -bs-btn-active-color: var(- -bs-btn-hover-color); -
   -bs-btn-active-bg: #5a23c8; -
   -bs-btn-active-border-color: #5a23c8;
}

.bd-mode-toggle {
   z-index: 1500;
}

.bd-mode-toggle .dropdown-menu .active .bi {
   display: block !important;
}
/* CSS 스타일 */
/* CSS 스타일 */
.orange-asterisk {
   color: #FF4500; /* 오렌지색 텍스트 색상 */
   font-weight: bold; /* 굵은 글꼴 (선택 사항) */
   margin-top: 5px;
}
#headLogo {
letter-spacing:10px;
font-family:'partialSansKR-Regular';
font-style: italic;


}
@font-face {
    font-family: 'PartialSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/PartialSansKR-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
</style>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/style.css">
<!-- Custom styles for this template -->
<link href="checkout.css" rel="stylesheet">
</head>
<body class="bg-body-tertiary">
   <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
      <symbol id="check2" viewBox="0 0 16 16">
        <path
         d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
      </symbol>
      <symbol id="circle-half" viewBox="0 0 16 16">
        <path
         d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z" />
      </symbol>
      <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path
         d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z" />
        <path
         d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z" />
      </symbol>
      <symbol id="sun-fill" viewBox="0 0 16 16">
        <path
         d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z" />
      </symbol>
    </svg>

   <div
      class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle">
      <button
         class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center"
         id="bd-theme" type="button" aria-expanded="false"
         data-bs-toggle="dropdown" aria-label="Toggle theme (auto)">
         <svg class="bi my-1 theme-icon-active" width="1em" height="1em">
            <use href="#circle-half"></use></svg>
         <span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
      </button>
      <ul class="dropdown-menu dropdown-menu-end shadow"
         aria-labelledby="bd-theme-text">
         <li>
            <button type="button"
               class="dropdown-item d-flex align-items-center"
               data-bs-theme-value="light" aria-pressed="false">
               <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                  <use href="#sun-fill"></use></svg>
               Light
               <svg class="bi ms-auto d-none" width="1em" height="1em">
                  <use href="#check2"></use></svg>
            </button>
         </li>
         <li>
            <button type="button"
               class="dropdown-item d-flex align-items-center"
               data-bs-theme-value="dark" aria-pressed="false">
               <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                  <use href="#moon-stars-fill"></use></svg>
               Dark
               <svg class="bi ms-auto d-none" width="1em" height="1em">
                  <use href="#check2"></use></svg>
            </button>
         </li>
         <li>
            <button type="button"
               class="dropdown-item d-flex align-items-center active"
               data-bs-theme-value="auto" aria-pressed="true">
               <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                  <use href="#circle-half"></use></svg>
               Auto
               <svg class="bi ms-auto d-none" width="1em" height="1em">
                  <use href="#check2"></use></svg>
            </button>
         </li>
      </ul>
   </div>
   <div class="container">
               <nav class="navbar">
            <h1 id="headLogo">
               <a class="navbar-brand " href="<%=request.getContextPath()%>/">NUBE</a>
            </h1>
         </nav>
         <div class="py-5 text-center"></div>

         <div class="row g-5">
            <div class="col-md-5 col-lg-4 order-md-last">
               <h4 class="d-flex justify-content-between align-items-center mb-3">
                  <span class="text-primary">Your cart</span> <span
                     class="badge bg-primary rounded-pill">3</span>
               </h4>
               <ul class="list-group mb-3">
                  <li class="list-group-item d-flex justify-content-between lh-sm">
                     <div>
                        <h6 class="my-0">Product name</h6>
                        <small class="text-body-secondary">Brief description</small>
                     </div> <span class="text-body-secondary">$12</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between lh-sm">
                     <div>
                        <h6 class="my-0">Second product</h6>
                        <small class="text-body-secondary">Brief description</small>
                     </div> <span class="text-body-secondary">$8</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between lh-sm">
                     <div>
                        <h6 class="my-0">Third item</h6>
                        <small class="text-body-secondary">Brief description</small>
                     </div> <span class="text-body-secondary">$5</span>
                  </li>
                  <li
                     class="list-group-item d-flex justify-content-between bg-body-tertiary">
                     <div class="text-success">
                        <h6 class="my-0">Promo code</h6>
                        <small>EXAMPLECODE</small>
                     </div> <span class="text-success">−$5</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between"><span>합계 금액 
                        </span>  <strong>                    <script>
        var totalPrice = ${totalPrice};
        var formattedPrice = totalPrice.toLocaleString('ko-KR');
        document.write(formattedPrice + "원");
    </script></strong></li>
               </ul>

               <form class="card p-2">
                  <div class="input-group">
                     <input type="text" class="form-control" placeholder="Promo code">
                     <button type="submit" class="btn btn-secondary">Redeem</button>
                  </div>
               </form>
            </div>
            <div class="col-md-7 col-lg-8">
               <h4 class="mb-3">배송지</h4>
               
                  <div class="row g-3">
                     <div class="col-sm-6">
                        <div class="input-group">
                           <label for="firstName"
                              class="form-label input-group-text highlighted-text">수령인
                              <span class="orange-asterisk">*</span>
                           </label> <input type="text" class="form-control"
                              style="margin-bottom: 6.5px;" id="name"
                              placeholder="50자 이내로 입력하세요" value="${user.name}" required>
                        </div>
                        <div class="invalid-feedback">Valid first name is
                           required.</div>
                     </div>
                     
               



                     <div class="col-12">

                        <div class="input-group has-validation">

                           <label for="firstName"
                              class="form-label input-group-text highlighted-text">연락처<span
                              class="orange-asterisk">*</span></label>
                           <input type="text"
                              id="phonePart2" name="phone" class="form-control"
                              style="margin-bottom: 6.5px;" value="${user.phone}" required>
                           <div class="invalid-feedback"></div>
                        </div>
                     </div>



                  </div>



            <div class="form-group">       
                  <div class="input-group">
                     <label for="inputAdd"
                        class="form-label input-group-text highlighted-text">배송지<span
                        class="orange-asterisk">*</span></label>
                     <div class="col-sm-4" >
                             <input type="text" id="zipcode" name="zipcode"class="form-control" value="${user.zipcode }"
                     value="" onclick="searchAddress()">&nbsp;
                  <input type="button" class="btn btn-default btn-sm" id="searchAdd" value="" onclick="searchAddress()"><br> <input
                           class="form-control" type="text" id="roadAddr1" style="margin-bottom:10px;"value="${user.address}"
                           name="roadAddr1" onclick="searchAddress()"> 
                     </div>
                  </div>   
                  </div>
                  <div class="col-sm-6">
                        <div class="input-group">
                           <label for="firstName"
                              class="form-label input-group-text highlighted-text">주문상품
                              <span class="orange-asterisk">*</span>
                           </label> <input type="text" class="form-control"
                              style="margin-bottom: 6.5px;" id="name" name="name"
                              placeholder="" value="" required readonly>
                              
                        </div>
                        <div class="invalid-feedback">Valid first name is
                           required.</div>
                     </div>
   
      

                     <div class="col-sm-6">
                        <div class="input-group">
                                  <select class="form-select" style="margin-bottom: 6.5px;" id="req" name="req" required>
            <option value="">배송 메모를 선택해주세요</option>
            <option value="배송 전에 미리 연락 바랍니다">배송 전에 미리 연락 바랍니다.</option>
            <option value="부재시  경비실에 맡겨 주세요">부재시  경비실에 맡겨 주세요.</option>
            <option value="부재시 전화 주시거나 문자 남겨주세요">부재시 전화 주시거나 문자 남겨주세요.</option>
        </select>
                        </div>
                        <div class="invalid-feedback">Valid first name is
                           required.</div>
                     </div>

                  <div class="col-md-5">
            </div>


               
            <hr class="my-4">

            <button class="w-100 btn btn-primary btn-lg" id="processPayment">결제하기  </button>
            
         </div>
   </div>



   <footer class="my-5 pt-5 text-body-secondary text-center text-small">
      <p class="mb-1">&copy; 2017–2023 Company Name</p>
      <ul class="list-inline">
         <li class="list-inline-item"><a href="#">Privacy</a></li>
         <li class="list-inline-item"><a href="#">Terms</a></li>
         <li class="list-inline-item"><a href="#">Support</a></li>
      </ul>
   </footer>
</div>
   <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

   <script src="checkout.js"></script>
</body>
<script>
   function searchAddress() {
      new daum.Postcode({
         oncomplete : function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
               extraRoadAddr += data.bname;
            }

            if (data.buildingName !== '' && data.apartment === 'Y') {
               extraRoadAddr += (extraRoadAddr !== '' ? ', '
                     + data.buildingName : data.buildingName);
            }

            if (extraRoadAddr !== '') {
               extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            document.getElementById('zipcode').value = data.zonecode; //우편번호
            document.getElementById("roadAddr1").value = roadAddr; //도로명 주소
            //document.getElementById("NOaddress").value = data.jibunAddress; //일반 주소
            document.getElementById("roadAddr2").focus();
         }
      }).open();
   }
   
   
   
   
   $('#processPayment').click(function(){
         var IMP = window.IMP;
         IMP.init('imp15273143');
         var totalPrice = ${totalPrice};
         var zipcode= ${user.zipcode};
         var getReq = document.getElementById("req").value;
         console.log(" zipcode::::"+zipcode);  
         console.log(" getReq::::"+getReq);  
         IMP.request_pay({
             pg: 'kakaopay',
             pay_method: 'card',
             //우리서버에서 사용할 주문식별번호
             merchant_uid: 'merchant' + new Date().getTime(),
          
             name : '상품결제',
             amount: totalPrice, //총결제금액
             buyer_email: 'shoo1925@naver.com',
             buyer_name: '이학진',
             buyer_tel: '01087606105',
             buyer_addr: '서울특별시 도봉구 방학동',
             getReq:getReq
                
             }, function (rsp){
               if(rsp.success){
                  
                   alert('주문이 완료되었습니다.');
                   
                   //결제완료 후 주문정보를 DB에 저장하고, 주문완료 페이지로 이동
                   $.ajax(
                       {
                           url: '/shop/order',
                           type: 'post',
                           data: {
                              Id: '${user.id}',
                              
                               merchant_uid: rsp.merchant_uid, //주문 식별번호
                               price: rsp.paid_amount, //결제 금액
                               name: rsp.buyer_name, // 이름
                               phone: rsp.buyer_tel, // 핸드폰번호
                               address1: rsp.buyer_addr, // 주소
                               zipcode: '${user.zipcode}',// ZIPCODE
                               req:getReq
                           }
                       }
                   ).done(function(msg){
                       if(msg == 'SUCCESS'){
                           location.href = '/shop';
                       } else {
                           alert('주문에 실패하였습니다.');
                       }
                   }).fail(function(){
                       alert('결제에 실패하였습니다.');
                   });
               } else {
                   alert(rsp.error_msg);
               }
             }
             
             )
     })
    
</script>
</html>