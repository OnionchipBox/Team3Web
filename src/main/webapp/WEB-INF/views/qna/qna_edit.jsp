<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 수정</title>
<link rel="stylesheet" type="text/css" href="./resources/css/qna.css" />
<script 
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../header.jsp" />
   <div id="qwrap">
      <h2 class="qtitle">QnA 문의 수정</h2>
      <form method="post" action="qna_edit_ok"
         onsubmit="return write_check();">
         <%-- 자료실 기능을 만들려면 첫번째,method=post만 가능하다.
  두번째 폼태그내에 enctype속성을 꼭 지정해야 한다. 파일첨부해서
  서버로 전송되는 첨부된 파일을 포함한 일반문자를 바이너리 모드
  (binary mode) 즉 이진파일이라 부른다. 그렇지 않은 일반게시판에
  서 서버로 전송되는 데이터를 ascii mode(아스키 모드) 파일
  이라 한다. --%>
  
          <%-- 자료실 번호 히든값--%>
          <input type="hidden" name="qnano" value="${q.qnano}" >
          <%--책갈피 페이지 번호 히든값 --%>
          <input type="hidden" name="page" value="${page}" >
          
         <table id="qtable">
            <tr>
               <th>작성자</th>
               <td><input name="qid" id="qid" size="14" value="${q.qid}"/></td>
            </tr>
            <tr>
               <th>글제목</th>
               <td><input name="qtitle" id="qtitle" size="33" value="${q.qtitle}" /></td>
            </tr>
            <tr>
               <th>비밀번호</th>
               <td><input type="password" name="qpw" id="qpw"
                  size="14" /></td>
            </tr>
            <tr>
               <th>글내용</th>
               <td><textarea name="qcont" id="qcont" rows="8"
                cols="34">${q.qcont}</textarea></td>
            </tr>
         </table>
         <div id="qmenu">
            <input type="submit" class="btn btn-dark" value="수정" /> <input type="reset" class="btn btn-dark" value="취소"
               onclick="$('#qid').focus();"> <input type="button"
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