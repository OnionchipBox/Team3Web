<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>


table{ 
	border-collapse : collapse; /*이중선 제거*/
	margin-top:15px;

}  
th,td{
      width: 270px;
      height: 70px;
      text-align: center;
      border: 1px solid lightgray;
      
      vertical-align: top;	/* 위 */
      vertical-align: bottom;   /* 아래 */
      vertical-align: middle;   /* 가운데 */   
}



#notice_hr {
	margin-top: 10px;
	margin-bottom: 10px;
	border: 2px solid #000; /* 선의 굵기와 색상 설정 */
	width: 100%;
}

.search{
	margin-top: 8px;
	padding-left:10px;
	width:100%;
	height:45px;
	border-radius:8px;
	border-style:none;
	background-color:#f4f4f4;
	font-family:'Noto Sans KR', sans-serif; 
}

/* placeholder 색상 변경 */
.search::placeholder {
    color: #afb0b3; /* 원하는 색상으로 변경 */
}

#jull{
	font-size:15px;
	margin-top:20px;
}

#jull hr{
	border: 0.5px solid rgba(0,0,0, 0.1);
	margin-top:15px;
	margin-bottom:15px;
}

#jull strong{
	padding-right:7px;
}

#container_no{
display: flex;
  justify-content: center;
  align-items: center;
  min-height: 65dvh;
}
</style>

</head>
<body>
<jsp:include page="../header.jsp" />
<div id="container_no">
<div id="sub_main_cont">
<h2>자주 묻는 질문</h2>
<hr id="notice_hr">

<form>
        <input class="search" type="search" placeholder="검색" aria-label="Search">
</form>


 <table>
    <tr>
      <th scope="col">전체</th>
      <th scope="col">이용정책</th>
      <th scope="col">공통</th>
    </tr>
    <tr>
      <td>구매</td>
      <td>판매</td>
      <td></td>
    </tr>
  </table>

<div id="jull">
	<p><strong>이용정책</strong> 페널티 정책</p><hr>
	<p><strong>이용정책</strong> 가품 ・ 손상/오염/사용감 있는 상품 판매에 대한 제재</p><hr>
	<p><strong>이용정책</strong> 검수 기준 악용에 대한 제재</p><hr>
	<p><strong>이용정책</strong> 거래 실패 시 반송 운임 기준</p><hr>
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


</body>
</html>