<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review 댓글</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="./resources/js/review.js"></script>
</head>
<body>
<jsp:include page="../header.jsp" />
   <div id="bsW_wrap">
      <h2 class="bsW_title">댓글 작성</h2>
      <form method="post" action="review_reply_ok"
         onsubmit="return write_check();">
	
	<%-- 답변글 히든값 필요! --%>
	<input type="hidden" name="reref" value="${r.reref}">
	<%-- bbs_ref는 원본글과 답변글을 묶어주는 글 그룹번호 역할 --%>
	<input type="hidden" name="restep" value="${r.restep}">
	<%-- 원본글이면 0, 첫번째 답변글이면 1, 두번째 답변글이면 2. 즉 원본글과 답변글을 구분하는
	번호값이면서 몇번째 답변글인가를 알려준다. --%>
	<input type="hidden" name="relevel" value="${r.relevel}">
	<%-- 답변글 정렬 순서 --%>
	
	<%-- 페이징에서 책갈피 기능을 만들기 위해서 쪽번호를 전달 --%>
	<input type="hidden" name="page" value="${page}">
	
	
	
			<table id="bsW_t">
            <tr>
               <th>글쓴이</th>
               <td><input name="rename2" id="rename2" size="14" /></td>
            </tr>
            
            <tr>
               <th>글제목</th>
               <td><input name="retitle" id="retitle" size="33"
               value="Re:${r.retitle}"/></td>
            </tr>
            
            
            <tr>
               <th>비밀번호</th>
               <td><input type="password" name="repwd" id="repwd"   size="14" /></td>
            </tr>
            <tr>
               <th>글내용</th>
               <td><textarea name="recont" id="recont" rows="8" cols="34"></textarea></td>
            </tr>

         </table>
         <div id="bsW_menu">
            <input type="submit" class="btn btn-dark" value="답변" /> <input type="reset" value="취소"
               class="btn btn-dark" onclick="$('#rename2').focus();"> <input type="button"
               class="btn btn-dark" value="목록" onclick="location='review_list?page=${page}';">
         </div>
      </form>
   </div>
<hr>
<jsp:include page="../footer.jsp" />
<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script>
</body>
</html>