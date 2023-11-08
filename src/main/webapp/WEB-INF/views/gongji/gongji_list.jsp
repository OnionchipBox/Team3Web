<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 공지목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<style>
/* notice.jsp ui 상단 */
/* 서브 메인 이미지 */
@import
	url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css')
	;

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.notosanskr * {
	font-family: 'Noto Sans KR', sans-serif;
}

#container {
	display: flex;
	justify-content: center;
}

#sub_img_center {
	/*이미지 조절 추가 코드 */
	background-image: url(../heroheader01.jpg);
	background-repeat: no-repeat;
	background-position: left top;
}

#notice {
	width: 70%;
	border-collapse: collapse; /* 표 테이블 테두리 선을 분리하지 않고 합쳐서 한 줄로 그린다. */
}

#notice td {
	text-align: center;
	padding: 15px;
	border-bottom-style: solid; /*밑줄 선 스타일 */
	border-bottom-color: rgba(0, 0, 0, 0.1); /*밑줄 선 색 지정*/
	width: 70%;
	/* 원하는 너비로 조절 (예: 50%) == > 적용 안 되는 이유가 notice에서 만진 비율때문에 notice가 td보다 더 위?..부모?..*/
	border-bottom-width: 1px; /*밑줄 선 두께*/
}

#notice td.left {
	text-align: left;
	padding-left: 14px; /* 왼쪽 안 여백을 주어 약간의 들여쓰기 느낌 ...*/
}

#table_search {
	float: right;
	margin: 15px 5px 10px 0px;
}

#page_control {
	/*div태그는 블록수준태그라서 너비를 따로 안 주면 가로줄 전체를 차지함 그래서 여기서 margin을 줘도 이동할 공간이 없어서 변화를 줄 수 없음 !
margin-left:auto 이거 쓰고 싶으면...jsp가서 이 부분 div에 너비를 주고 와서 다시 적용해보기 ...!*/
	text-align: center;
	margin-top: 30px;
	margin-bottom: 50px;
}

#page_control a {
	font-family: monospace;
	text-decoration: none;
	padding: 2px 5px;
	color: #333;
	margin: 0px 10px;
}

#page_control a:hover {
	text-decoration: underline;
	font-weight: bold;
	color: gray;
}

#notice tr:hover {
	cursor: pointer;
	cursor: hand; /*마우스 오버시 화살표 마우스 포인터를 손가락 모양으로 나오게 한다.*/
}

#sub_menu li a {
	text-decoration: none;
	color: inherit;
}

#sub_menu {
	width: 20%; /* 왼쪽 메뉴 너비 조절 */
	padding-left: 40px; /* 왼쪽 여백 추가 */
	order: -1; /* sub_menu를 왼쪽으로 이동시킴 */
}

#sub_menu ul {
	padding: 30px;
}

#sub_menu li {
	list-style: none;
}

#sub_main_cont {
	width: 80%; /* 오른쪽 본문 너비 조절 */
}

#notice_hr {
	margin-top: 10px;
	margin-bottom: 10px;
	border: 2px solid #000; /* 선의 굵기와 색상 설정 */
	width: 80%;
}

#center {
	margin-bottom: 15px;
	padding: 30px;
	padding-right: 10px;
	letter-spacing: -2px;
}

#leftlist li {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 17px;
	margin-bottom: 10px;
	font-size: 17px;
}

/* 클릭된 항목은 두꺼운 검은색으로 스타일링합니다. */
#leftlist li a.active {
	color: black;
	font-weight: bold;
}

table th,td{
	background-color:#fff;
}

a{
	text-decoration: none;
	color:inherit;
}
</style>
<body>
	<jsp:include page="../header.jsp" />



	<div id="container_no">
		<%-- 고객 센터 서브 메인 이미지 --%>
		<div id="sub_img_center"></div>

		<div class="clear"></div>


		<%-- 서브 메뉴 --%>
		<div id="container">

			<div id="sub_menu">
				<h1 id="center">고객센터</h1>
				<ul id="leftlist">
					<li><a href="./gongji_list.jsp">공지사항</a></li>
					<li><a href="../notice/FAQ.jsp" data-page="../notice/FAQ.jsp">자주
							묻는 질문</a></li>
					<li><a href="../notice/inspection.jsp"
						data-page="../notice/inspection.jsp">검수 기준</a></li>
				</ul>
			</div>


		<%-- 서브 메인 본문 --%>
		<div id="sub_main_cont">

			<h2>공지사항</h2>
			<hr id="notice_hr">
			<table id="notice">
				<tr>
					<th>제목</th>
					<th>날짜</th>
				</tr>
				<c:if test="${!empty glist}">
					<c:forEach var="g" items="${glist}">
						<tr>
							<th><a href="gongji_cont?gno=${g.gno}"> <c:if
										test="${fn:length(g.gtitle)>16}">
       ${fn:substring(g.gtitle,0,16)}...
      </c:if> <c:if test="${fn:length(g.gtitle)<16}">
      ${g.gtitle}
      </c:if>
							</a></th>
							<th>${g.gdate}</th>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty glist}">
					<tr>
						<th colspan="2">공지 목록이 없습니다!</th>
					</tr>
				</c:if>

			</table>


			<div class="clear"></div>

			<div id="page_control">
			
			</div>

		</div>

	</div>

	</div>


	<jsp:include page="../footer.jsp" />
	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script>



	<script>
// JavaScript로 클릭 이벤트를 처리합니다.
document.addEventListener('DOMContentLoaded', function () {
    // 각 메뉴 항목을 선택합니다.
    var menuItems = document.querySelectorAll('#leftlist li a');
    
    // 첫 화면에서 "공지사항" 메뉴에 "active" 클래스를 추가합니다.
    var firstMenuItem = document.querySelector('#leftlist li:first-child a');
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
            
            // 클릭된 항목의 data-page 속성을 가져와 서버에서 해당 페이지를 로드합니다.
            var pageToLoad = event.target.getAttribute('data-page');
            
            // 서버로부터 데이터를 가져와서 sub_main_cont를 업데이트합니다.
            $.ajax({
                url: pageToLoad,
                type: 'GET',
                dataType: 'html',
                success: function (data) {
                    $('#sub_main_cont').html(data);
                },
                error: function () {
                    alert('페이지를 로드하는 동안 오류가 발생했습니다.');
                }
            });
            
            
            
        });
    });
});
</script>

</body>
</html>