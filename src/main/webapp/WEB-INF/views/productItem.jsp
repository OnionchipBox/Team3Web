<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
   
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


/* 리뷰 영역  시작 */
#container_r{
	display:flex;
	justify-content: center;
	align-items: center;
	min-height: 60vh;
}


#rwrap {
	width: 90%;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative; /* 요소의 위치를 조정하기 위해 필요한 기본 속성 */
	top: -60px; /* 위로 이동할 픽셀 수를 조정하세요. 음수 값은 위로 이동, 양수 값은 아래로 이동 */
	
}
a {
	text-decoration: none;
	color: inherit;
}

#qti {
	margin-bottom: 20px;
	text-align: center;
	margin-top: 10px;
}


#titleui {
	margin-left: 10px;
}

#rfind, #rList_paging {
	margin-top: 5px;
	flex-direction: column; /* 세로 방향 가운데 정렬 */
	align-items: center; /* 세로 방향 가운데 정렬 */
	text-align: center;
}


#rList_paging {
	padding: 10px;
}

#rbutton {
	position: relative;
	float: right;
	right: 20px;
	z-index: 2; /* qbutton을 qfind 위에 표시 */
}

#rfind {
	position: relative;
	z-index: 1; /* qfind를 다른 요소보다 위에 표시 */
	left: 32px;
}

#rfindbtn{
	position:relative;
	bottom:3px;	
}


#rwrite {
	flex-direction: column; /* 세로 방향 가운데 정렬 */
}


#Rlist_t {
	border-style:2px solid #000;
	overflow: auto; /* 내용이 넘칠 때 스크롤 표시 */
	table-layout: fixed;
    border-spacing: 0;
	
}


#Rlist_t th {
	border-bottom: 2px solid #9ca3a6; /* 가로 구분선 추가 및 회색 계열의 바탕색 설정 */
	background-color: #fff;
	padding: 15px; /* 셀 안의 내용과 내부 여백 설정 */
	text-align: center; /* 텍스트 가운데 정렬 */
}


#Rlist_t td {
	padding: 15px;
	text-align: center;
}



/* 리뷰 영역  끝 */
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
 
 
 
   
   <!-- 11/03 리뷰 영역  추가  -->

   <div id="container_r">
    
<div id="rwrap">
  <hr>
<form method="get" action="review_list">
		<div id="qti">
		<h2 class="title_q"><strong>Review</strong>(${listcount})</h2>
					<h6 id="qq">
						<strong>NUBE</strong> 리뷰 게시판입니다.
					</h6>
			</div>
<div id="rtable">
      <table id="Rlist_t" style='width: 900px; table-layout: fixed; word-break: break-all; height:auto'>
         <tr>
            <th class ="rnot" width="8%" height="26">번호</th>
            <th class ="rnot" width="50%">제목</th>
            <th class ="rnot" width="14%">작성자</th>
            <th class ="rnot" width="17%">작성일</th>
            <th class ="rnot" width="10%">조회수</th>
         </tr>

         <c:if test="${!empty rlist}">
            <c:forEach var="r" items="${rlist}">
               <tr id="rtr">
                  <td align="center">                  
                  <c:if test="${r.restep==0}"> <!-- 원본글일때만 글그룹번호를 출력 -->
                  ${r.reref}
                  </c:if>
                  </td>
                  <td>
                  <c:if test="${r.restep!=0}"> <!-- 답변글일때만 실행: 계단형 계층형 자료실 -->
                  <c:forEach begin="1" end="${r.restep}" step="1">
                  &nbsp;<%--한 칸의 빈 공백 처리 --%>
                  </c:forEach>
                  &#8627;
                  </c:if>
                  <a
                     href="review_cont?reno=${r.reno}&state=cont&page=${page}">
                        ${r.retitle}</a></td>
                  <td align="center">${r.rename2}</td>
                  <td align="center">${fn:substring(r.redate,0,10)}</td>
                  <%-- 0이상 10미만 사이의 년월일만 반환 --%>
                  <td align="center">${r.rehit}</td>
               </tr>
            </c:forEach>
         </c:if>
         <c:if test="${empty rlist}">
            <tr>
               <th colspan="5">등록된 리뷰가 없습니다.</th>
            </tr>
         </c:if>
      </table>
</div>


      <%--페이징(쪽나누기)--%>
      <div id="rList_paging" class="paging-section">
         <%--검색전 페이징 --%>
         <c:if test="${(empty find_field)&&(empty find_name)&& !empty rlist}">
            <c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
            <c:if test="${page >1}">
               <a href="review_list?page=${page-1}">[이전]</a>&nbsp;
   </c:if>

            <%--쪽번호 출력부분 --%>
            <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
               <c:if test="${a == page}"><${a}></c:if>

               <c:if test="${a != page}">
                  <a href="review_list?page=${a}">[${a}]</a>&nbsp;
    </c:if>
            </c:forEach>

            <c:if test="${page>=maxpage}">[다음]</c:if>
            <c:if test="${page<maxpage}">
               <a href="review_list?page=${page+1}">[다음]</a>
            </c:if>
         </c:if>

         <%-- 검색후 페이징(쪽나누기) --%>
         <c:if test="${(!empty find_field) || (!empty find_name)}">
            <c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
            <c:if test="${page >1}">
               <a href="review_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   </c:if>

            <%--쪽번호 출력부분 --%>
            <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
               <c:if test="${a == page}"><${a}></c:if>

               <c:if test="${a != page}">
                  <a href="review_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
    </c:if>
            </c:forEach>

            <c:if test="${page>=maxpage}">[다음]</c:if>
            <c:if test="${page<maxpage}">
               <a href="review_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
            </c:if>
         </c:if>
      </div>

      <div id="rbutton">
         <input type="button" class="btn btn-dark" id="rwrite" value="글쓰기"
            onclick="location='review_write?page=${page}';" />
      	<c:if test="${(!empty find_field) && (!empty find_name)}"> <!-- 이건 지금 검색 이후!! -->
      	<input type="button" class="btn btn-dark" value="전체목록"
      	onclick="location='review_list?page=${page}';"> <!-- 내가 본 페이지로 가는..책갈피 기능 -->
      	</c:if>
      </div>
      
			<%--검색 폼 추가--%>
			<div id="rFind">
				<select name="find_field">
					<option value="retitle"
						<c:if test="${find_field=='retitle'}"> ${'selected'}></c:if>>
						<!-- find_field가 re_cont와 같다면 해당 목록을 선택되게 한다. -->
						제목</option>
					<option value="recont"
						<c:if test="${find_field=='recont'}">${'selected'}
					</c:if>>내용</option>
				</select> <input type="search" name="find_name" id="find_name" 
				size="16" value="${find_name}"> 
				<input type="submit" id="rfindbtn" class="btn btn-dark" value="검색">
			</div>


		
</form>
</div>
</div>
   
   <!-- 리뷰 영역 끝  -->
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
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