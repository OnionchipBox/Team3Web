<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 답변</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="./resources/js/qna.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#container_q {
	 display: flex;
    justify-content: center;
    align-items: center;
    text-align: center; /* 수평 가운데 정렬을 위해 추가 */
}


</style>
</head>
<body>
<jsp:include page="../header.jsp" />
   <div id="qwrap">
      <h2 class="q_title">문의 답변</h2>
      <form method="post" action="qna_reply_ok"
         onsubmit="return write_check();">
	
	<%-- 답변글 히든값 필요! --%>
	<input type="hidden" name="qref" value="${q.qref}">
	<%-- bbs_ref는 원본글과 답변글을 묶어주는 글 그룹번호 역할 --%>
	<input type="hidden" name="qstep" value="${q.qstep}">
	<%-- 원본글이면 0, 첫번째 답변글이면 1, 두번째 답변글이면 2. 즉 원본글과 답변글을 구분하는
	번호값이면서 몇번째 답변글인가를 알려준다. --%>
	<input type="hidden" name="qlevel" value="${q.qlevel}">
	<%-- 답변글 정렬 순서 --%>
	
	<%-- 페이징에서 책갈피 기능을 만들기 위해서 쪽번호를 전달 --%>
	<input type="hidden" name="page" value="${page}">
	
	
	
			<table id="qtable">
            <tr>
               <th>작성자</th>
               <td><input name="qid" id="qid" size="14" value="NUBE관리자" /></td>
            </tr>
            
            <tr>
               <th>글제목</th>
               <td><input name="qtitle" id="qtitle" size="33"
               value="문의 답변 드립니다." /></td>
            </tr>
            <tr>
						<th>비밀번호</th>
						<td><input type="password" name="qpw" id="qpw" size="14" /></td>
					</tr>
					
            <tr>
               <th>글내용</th>
               <td><textarea name="qcont" id="qcont" rows="8" cols="34" ></textarea></td>
            </tr>

         </table>
         <div id="qmenu">
            <input type="submit" class="btn btn-dark" value="답변" /> <input type="reset" class="btn btn-dark" value="취소"
               onclick="$('#qcont').focus();"> <input type="button"
               class="btn btn-dark" value="목록" onclick="location='qna_list?page=${page}';">
         </div>
      </form>
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