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

.re_t{
	text-align:center;
	font-weight: bold;
}
#Rlist_t{
	overflow: auto; /* 내용이 넘칠 때 스크롤 표시 */
	margin-left:auto; 
    margin-right:auto;
}
#remenu{
	text-align:center;
	margin-top:15px;
	padding:15px 0px;	
}
#rtable{
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />

<div id="review_w">
      <h2 class="re_t">Review</h2>
      <form method="post" action="review_write_ok"
         onsubmit="return write_check();" enctype="multipart/form-data">
         
          <!-- 이전 페이지 URL을 서버로 전달하는 hidden 필드 -->
    <input type="hidden" name="referer" value="${pageReferer}" />
         
<div id="rtable">
<table id="Rlist_t" style='height:auto'>
	<tr>
		<th>작성자</th>
		<td><input name="rename2" id="rename2" size="14" /></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input name="retitle" id="retitle" size="33" /></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="repwd" id="repwd" size="14" /></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
		<textarea name="recont" id="recont" rows="8" cols="34" ></textarea>
		</td>
	</tr>
	<tr>
		<th>파일 첨부</th>
		<td>
		<input type="file" id="uploadFile" name="uploadFile" class="btn btn-dark"/>
		</td>
	</tr>
</table>
</div>

<div id="remenu">
         	   <input type="submit" class="btn btn-dark" value="취소" />
               <input type="reset" style="display:none;" onclick="$('#rename2').focus();" />
               <!--<button type="button" class="btn btn-dark" onclick="location='review_list?page=${page}';">목록</button>-->
               <button type="button" class="btn btn-dark" onclick="goBack();">목록</button>               
               <input type="submit" class="btn btn-dark"  onclick="saveReview();" value="작성하기" />
         </div>

</form>
</div>

<script>
function goBack() {
    window.history.back(); // 이전 페이지로 이동
}



function saveReview() {
    // 현재 페이지 URL을 가져옴
    var currentPageURL = window.location.href;
    localStorage.setItem('currentPageURL', currentPageURL);

    // 리뷰 데이터 및 현재 페이지 URL을 서버로 전송
    $.ajax({
        url: '/review_write_ok', // 서버의 저장 엔드포인트 경로
        type: 'POST',
        data: {
            reviewData: reviewData, // 리뷰 데이터를 여기에 추가
            currentPageURL: currentPageURL, // 현재 페이지 URL을 전송
        },
        success: function(response) {
            // 성공 시 처리
            if (response.redirect) {
                // 서버에서 리다이렉트 URL을 반환하면 해당 URL로 이동
                window.location.href = response.redirect;
            }
        },
        error: function(error) {
            // 오류 시 처리
        },
    });
}
</script>

<jsp:include page="../footer.jsp" />


<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script>
</body>
</html>