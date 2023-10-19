<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="./resources/js/review.js"></script>
<style>
@font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

#review_w{
 	position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 80%; /* 너비를 80%로 설정 */
    height: 50vh; /* 높이를 80vh로 설정 (뷰포트 높이의 80%) */
	
}
h2{
	 font-family: 'TheJamsil5Bold';
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />


<div id="review_w">
      <h2 class="re_t">Review</h2>
      <form method="post" action="review_write_ok"
         onsubmit="return write_check();" enctype="multipart/form-data">

<table>
	<tr>
		<th>작성자</th>
		<td><input name="re_name" id="re_name" size="14" /></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input name="re_title" id="re_title" size="33" /></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input name="re_pwd" id="re_pwd" size="14" /></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
		<textarea name="re_cont" id="re_cont" rows="8" cols="34" ></textarea>
		</td>
	</tr>
	<tr>
		<th>파일 첨부</th>
		<td>
		<input type="file" id="uploadFile" name="uploadFile" class="btn btn-dark"/>
		</td>
	</tr>
</table>

<div id="remenu">
         	   <input type="submit" class="btn btn-dark" value="취소" />
               <input type="reset" style="display:none;" onclick="$('#re_name').focus();" />
               <button type="button" class="btn btn-dark" onclick="location='review_list?page=${page}';">목록</button>
               <input type="submit" class="btn btn-dark" value="작성하기" />
         </div>

</form>
</div>

<%-- <hr>
<jsp:include page="../footer.jsp" />
<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script> --%>
</body>
</html>