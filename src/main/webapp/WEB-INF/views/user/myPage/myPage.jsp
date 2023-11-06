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
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>

#container_my {
    display: flex;
    min-height: 65vh;
}
#submenu_my {
	margin-top:40px;
    flex: 0 0 20%; /* 20% 너비를 가집니다. */
    background-color: #fff; /* 배경색을 지정할 수 있습니다. */
    padding: 20px; /* 내용과 외부 사이의 간격을 지정할 수 있습니다. */
    text-align:center;
}

#myPage{
	font-weight: bold;
	margin-bottom:15px;
	opacity: 0.8;
}
#myList {
	padding:10px;
    list-style: none;
    color: inherit;
}

#myList li{
	margin-bottom:10px;
	font-size:20px;
	font-weight:bold;
	color: lightgray;
}

a {
    text-decoration: none;
    color: inherit;
}

a:hover {
    color: gray;
    font-weight: 20px;
}


#cont_my {
    display: flex;
    flex-direction: column;
    align-items: center; /* 가로 정렬 중앙 정렬 */
    justify-content: center; /* 세로 정렬 중앙 정렬 */
    text-align: center; /* 텍스트도 중앙 정렬 */
    min-height: 50vh; /* 높이 조정 */
    margin-left: 330px;
    margin-bottom :30px;
    font-size:25px;
}

#usermy{
	border:none;
	text-decoration: underline;
}
</style>
</head>
<body>
	<jsp:include page="../../header.jsp" />
	
<div id="container_my">


<div id="submenu_my">

<h1 id="myPage">My페이지</h1>
<ul id="myList">
<li><a href="/shop/updateLogin">내 정보 수정</a></li>
<li><a href="/shop/user/cart" data-page="../cart">장바구니</a></li>
<li><a href="./myQnA_list">1:1 문의 내역</a></li>
<li><a href="/shop/delivery">주문/배송 조회</a></li>
</ul>
</div> <!-- submenu_my-->


<div id="cont_my">
 <!-- 내용이 여기에 동적으로 로드될 것입니다. -->
<i class='bx bx-user'> <strong>${loggedInUserId}</strong>님은 일반 회원 등급입니다.</i> 
<br>
보유 포인트 ( ${userPoint} ) 점

</div> <!-- cont_my-->



</div>	<!-- container_my-->
	
	
	
<script>
// JavaScript로 클릭 이벤트를 처리합니다.
document.addEventListener('DOMContentLoaded', function () {
  // 각 메뉴 항목을 선택합니다.
  var menuItems = document.querySelectorAll('#myList li a');

  // 첫 화면에서 "마이페이지" 메뉴에 "active" 클래스를 추가합니다.
  var firstMenuItem = document.querySelector('#myList li:first-child a');
  firstMenuItem.classList.add('active');

  // 클릭 이벤트 리스너를 추가합니다.
  menuItems.forEach(function (menuItem) {
    menuItem.addEventListener('click', function (event) {
      // 모든 항목의 클래스를 초기화합니다.
      menuItems.forEach(function (item) {
        item.classList.remove('active');
      });

      // 클릭된 항목에 'active' 클래스를 추가하여 스타일을 적용합니다.
      event.target.classList.add('active');

      // 클릭된 항목의 data-page 속성을 가져와 해당 페이지를 동적으로 로드합니다.
      var pageToLoad = event.target.getAttribute('data-page');

      // 서버로부터 페이지 내용을 가져와서 cont_my div를 업데이트합니다.
      $.ajax({
        url: pageToLoad + '.jsp', // 페이지 이름으로 jsp 파일을 찾음
        type: 'GET',
        dataType: 'html',
        success: function (data) {
          $('#cont_my').html(data);
        },
      });
    });
  });
});
</script>



	
	
	<jsp:include page="../../footer.jsp" />

	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
</body>
</html>
