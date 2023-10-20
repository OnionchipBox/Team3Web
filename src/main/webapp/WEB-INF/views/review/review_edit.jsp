<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="./resources/js/review.js"></script>
<link rel="stylesheet" type="text/css" href="./css/review.css" />
<script 
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../header.jsp" />
   <div id="bsW_wrap">
      <h2 class="bsW_title">리뷰 수정</h2>
      <form method="post" action="review_edit_ok"
         onsubmit="return write_check();" enctype="multipart/form-data">
         <%-- 자료실 기능을 만들려면 첫번째,method=post만 가능하다.
  두번째 폼태그내에 enctype속성을 꼭 지정해야 한다. 파일첨부해서
  서버로 전송되는 첨부된 파일을 포함한 일반문자를 바이너리 모드
  (binary mode) 즉 이진파일이라 부른다. 그렇지 않은 일반게시판에
  서 서버로 전송되는 데이터를 ascii mode(아스키 모드) 파일
  이라 한다. --%>
  
          <%-- 자료실 번호 히든값--%>
          <input type="hidden" name="reno" value="${r.reno}" >
          <%--책갈피 페이지 번호 히든값 --%>
          <input type="hidden" name="page" value="${page}" >
          
         <table id="bsW_t">
            <tr>
               <th>글쓴이</th>
               <td><input name="rename2" id="rename2" size="14" value="${r.rename2}"/></td>
            </tr>
            <tr>
               <th>글제목</th>
               <td><input name="retitle" id="retitle" size="33" value="${r.retitle}" /></td>
            </tr>
            <tr>
               <th>비밀번호</th>
               <td><input type="password" name="repwd" id="repwd"   size="14" /></td>
            </tr>
            <tr>
               <th>글내용</th>
               <td><textarea name="recont" id="recont" rows="8"
                cols="34">${r.recont}</textarea></td>
            </tr>
            <tr>
               <th>파일첨부</th>
               <td><input type="file" id="uploadFile" name="uploadFile" /><br>${r.refile}</td>
            </tr>
         </table>
         <div id="bsW_menu">
            <input type="submit" class="btn btn-dark" value="수정" /> <input type="reset" value="취소"
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