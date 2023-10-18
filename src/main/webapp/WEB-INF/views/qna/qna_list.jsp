<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A 상품문의</title>

	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

#qwrap{
   width:auto; height:auto; border:none;
   margin-left:15px; margin-right:auto;
   margin-top:70px;
   
}

a{
	text-decoration: none;
	color:inherit;	
}

#titleui {
	
	margin-left: 10px;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />


<div id="qwrap">
<form method="get" action="qna_list">
      <h2 class="bList_title">Q & A 상품문의 (총 ${listcount}건)</h2>
      <table id="qList_t">		<!-- 추후 비밀작성글 / 비밀글 제외 버튼 추가 보완 -->
         <tr>
            <th width="6%" height="26">No</th>
           <!--   <th width="10%">구분</th> --> <!-- 입력폼에서 넣어둔 radio 문의유형 추후 적용해보기 -->
            <th width="50%">내용</th>
            <th width="14%">작성자</th>
            <th width="17%">등록일자</th>
         </tr>
<!-- <div id="qna-content" style="display: none;"></div> -->
         <c:if test="${!empty qlist}">
            <c:forEach var="q" items="${qlist}">
               <tr>
                  <td align="center">
                  <c:if test="${q.qstep==0}"> <!-- 원본글일때만 글그룹번호를 출력 -->
                  ${q.qref}  
                  </c:if>
                  </td>
                  <td>
                  <c:if test="${q.qstep!=0}"> <!-- 답변글일때만 실행: 계단형 계층형 자료실 -->
                  <c:forEach begin="1" end="${q.qstep}" step="1">
                  &nbsp;<%--한 칸의 빈 공백 처리 --%>
                  </c:forEach>
                 <!--  <img src="images/AnswerLine.gif"> --> <%--답변글 이미지 --%>
                 <!--  <i class='bx bxs-cloud' ></i> -->
                 &#8627;
                  </c:if>
                  <a id="titleui"
                     href="qna_cont?qnano=${q.qnano}&state=cont&page=${page}">
                      ${q.qtitle}</a></td>
                  <td align="center">${q.qid}</td>
                  <td align="center">${fn:substring(q.qdate,0,10)}</td>
                  <%-- 0이상 10미만 사이의 년월일만 반환 --%>
               </tr>
            </c:forEach>
         </c:if>

         <c:if test="${empty qlist}">
            <tr>
               <th colspan="5">자료실 목록이 없습니다.</th>
            </tr>
         </c:if>
      </table>

      <%--페이징(쪽나누기)--%>
      <div id="qList_paging">
         <%--검색전 페이징 --%>
         <c:if test="${(empty find_field)&&(empty find_name)}">
            <c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
            <c:if test="${page >1}">
               <a href="qna_list?page=${page-1}">[이전]</a>&nbsp;
   </c:if>

            <%--쪽번호 출력부분 --%>
            <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
               <c:if test="${a == page}"><${a}></c:if>

               <c:if test="${a != page}">
                  <a href="qna_list?page=${a}">[${a}]</a>&nbsp;
    </c:if>
            </c:forEach>

            <c:if test="${page>=maxpage}">[다음]</c:if>
            <c:if test="${page<maxpage}">
               <a href="qna_list?page=${page+1}">[다음]</a>
            </c:if>
         </c:if>
		</div>


<!-- 목록 페이지에 글쓰기 버튼 추가  -->
	<div id="bList_menu">
				<input type="button" class="btn btn-dark" value="글쓰기"
					onclick="location='qna_write?page=${page}';" />
					<c:if test="${(!empty find_field) && (!empty find_name)}">
					<input type="button" value="전체목록"
						onclick="location='qna_list?page=${page}';" />
				</c:if>
			</div>


<%--검색 폼추가 --%>
			<div id="bFind_wrap">
				<select name="find_field">
					<option value="qtitle"
						<c:if test="${find_field=='qtitle'}">
   ${'selected'}</c:if>>제목</option>
					<option value="qcont"
						<c:if test="${find_field=='qcont'}">
   ${'selected'}</c:if>>내용</option>
				</select> <input name="find_name" id="find_name" size="14"
					value="${find_name}" /> <input type="submit" value="검색" />
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