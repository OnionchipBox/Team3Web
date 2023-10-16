<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/qna.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/js/qna.js"></script>
<style>
#container {
	display:flex;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
<div id="qwrap">
      <h2 class="title"><strong>상품문의</strong></h2><br>
      <form method="post" action="qna_write_ok"
         onsubmit="return write_check();" enctype="multipart/form-data">
			
			<table id="qna">
			
	
			<!-- 추후에 ui https://wsss.tistory.com/1644 참고 리스트화면 -->
			
<div id="container">
<form>
	<strong>문의 유형</strong>&nbsp;
    <label>
      <input type="radio" name="radio"/>
      <span>사이즈</span>
    </label>
    <label>
      <input type="radio" name="radio"/>
      <span>배송</span>
    </label>
    <label>
      <input type="radio" name="radio"/>
      <span>재입고</span>
    </label>
     <label>
      <input type="radio" name="radio"/>
      <span>상품 상세 문의</span>
    </label>
     <label>
      <input type="radio" name="radio"/>
      <span>기타</span>
    </label>
  </form>
</div>
			<br>
			<tr>
			<p>클레임(교환/환불/취소)관련 문의는 <a href="#"><strong id="mypage">마이페이지 > 1:1 문의</strong></a>에서 문의 바랍니다.</p>
           </tr>
           
           
           <div id="form1">
            <tr>
               <th>작성자</th>
               <td><input name="qid" id="qid" size="14" /></td>
            </tr>
            <tr>
               <th>제목</th>
               <td><input name="qtitle" id="qtitle" size="33" /></td>
            </tr>
            <tr>
               <th>비밀번호</th>
               <td><input type="password" name="qpw" id="qpw"   size="14" /></td>
            </tr>
            <tr>
               <th>내용</th>
               <td><textarea name="qcont" id="qcont" rows="8" cols="34"></textarea></td>
            </tr>
            <tr>
               <th>파일첨부</th>
				<td>
   					<input type="file" id="input-file" name="qfile" class="btn btn-dark"/>
				</td>						
            </tr>
            </div>
            
         </table>
         <div id="qnamenu">
         	   <input type="submit" class="btn btn-dark" value="취소" />
               <input type="reset" style="display:none;" onclick="$('#qid').focus();" />
               <button type="button" class="btn btn-dark" onclick="location='qna_list?page=${page}';">목록</button>
               <input type="submit" class="btn btn-dark" value="작성하기" />
         </div>
      </form>
   </div>

<jsp:include page="../footer.jsp" />
</body>
</html>