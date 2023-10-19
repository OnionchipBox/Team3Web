<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
#re_wrap{
   width:auto; height:auto; border:none;
   margin-left:auto; margin-right:auto;
   margin-top:70px;
   
}
a{
	text-decoration: none;
	color:inherit;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
<form method="get" action="review_list">
<div id="re_wrap">
      <div><h2>Review (${listcount})</h2></div>
      <table id="bList_t">
         <tr>
            <th width="6%" height="26">번호</th>
            <th width="50%">제목</th>
            <th width="14%">작성자</th>
            <th width="17%">작성일</th>
            <th width="14%">조회수</th>
         </tr>

         <c:if test="${!empty rlist}">
            <c:forEach var="r" items="${rlist}">
               <tr>
                  <td align="center">
                  <c:if test="${r.re_step==0}"> <!-- 원본글일때만 글그룹번호를 출력 -->
                  ${r.re_ref}
                  </c:if>
                  </td>
                  <td>
                  <c:if test="${r.re_step!=0}"> <!-- 답변글일때만 실행: 계단형 계층형 자료실 -->
                  <c:forEach begin="1" end="${r.re_step}" step="1">
                  &nbsp;<%--한 칸의 빈 공백 처리 --%>
                  </c:forEach>
                  &#8627;
                  </c:if>
                  <a
                     href="review_cont?re_no=${r.re_no}&state=cont&page=${page}">
                        ${r.re_title}</a></td>
                  <td align="center">${r.re_name}</td>
                  <td align="center">${fn:substring(r.re_date,0,10)}</td>
                  <%-- 0이상 10미만 사이의 년월일만 반환 --%>
                  <td align="center">${r.re_hit}</td>
               </tr>
            </c:forEach>
         </c:if>

         <c:if test="${empty rlist}">
            <tr>
               <th colspan="5">리뷰 목록이 없습니다.</th>
            </tr>
         </c:if>
      </table>

      <%--페이징(쪽나누기)--%>
      <div id="bList_paging">
         <%--검색전 페이징 --%>
         <c:if test="${(empty find_field)&&(empty find_name)}">
            <c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
            <c:if test="${page >1}">
               <a href="review_list?page=${page-1}">[이전]</a>&nbsp;
   </c:if>

            <%--쪽번호 출력부분 --%>
            <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
               <c:if test="${a == page}"><${a}></c:if>

               <c:if test="${a != page}">
                  <a href="review_list?page=${a}">[${a}]</a>&nbsp;
    </c:if>
            </c:forEach>

            <c:if test="${page>=maxpage}">[다음]</c:if>
            <c:if test="${page<maxpage}">
               <a href="review_list?page=${page+1}">[다음]</a>
            </c:if>
         </c:if>

         <%-- 검색후 페이징(쪽나누기) --%>
         <c:if test="${(!empty find_field) || (!empty find_name)}">
            <c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
            <c:if test="${page >1}">
               <a href="review_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   </c:if>

            <%--쪽번호 출력부분 --%>
            <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
               <c:if test="${a == page}"><${a}></c:if>

               <c:if test="${a != page}">
                  <a href="review_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
    </c:if>
            </c:forEach>

            <c:if test="${page>=maxpage}">[다음]</c:if>
            <c:if test="${page<maxpage}">
               <a href="review_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
            </c:if>
         </c:if>
      </div>

      <div id="bList_menu">
         <input type="button" class="btn btn-dark" value="글쓰기"
            onclick="location='review_write?page=${page}';" />
      	<c:if test="${(!empty find_field) && (!empty find_name)}"> <!-- 이건 지금 검색 이후!! -->
      	<input type="button" class="btn btn-dark" value="전체목록"
      	onclick="location='review_list?page=${page}';"> <!-- 내가 본 페이지로 가는..책갈피 기능 -->
      	</c:if>
      </div>
      
			<%--검색 폼 추가--%>
			<div id="bFind_wrap">
				<select name="find_field">
					<option value="re_title"
						<c:if test="${find_field=='re_title'}"> ${'selected'}></c:if>>
						<!-- find_field가 re_cont와 같다면 해당 목록을 선택되게 한다. -->
						글제목</option>
					<option value="re_cont"
						<c:if test="${find_field=='re_cont'}">${'selected'}
					</c:if>>글내용</option>
				</select> <input type="search" name="find_name" id="find_name" 
				size="16" value="${find_name}"> 
				<input type="submit" value="검색">
			</div>


		</div>
</form>


<jsp:include page="../footer.jsp" />
<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script>

</body>
</html>