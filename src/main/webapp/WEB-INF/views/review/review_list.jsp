<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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

/*============================================*/

/*
#container_r {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}
*/


#container_r{
	display:flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}


#rwrap {
	width: 90%;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative; /* 요소의 위치를 조정하기 위해 필요한 기본 속성 */
	top: -60px; /* 위로 이동할 픽셀 수를 조정하세요. 음수 값은 위로 이동, 양수 값은 아래로 이동 */
	
}

a {
	text-decoration: none;
	color: inherit;
}

#titleui {
	margin-left: 10px;
}

#rfind, #rList_paging {
	margin-top: 5px;
	flex-direction: column; /* 세로 방향 가운데 정렬 */
	align-items: center; /* 세로 방향 가운데 정렬 */
	text-align: center;
}

#rList_paging {
	padding: 10px;
}

#rbutton {
	position: relative;
	float: right;
	right: 20px;
	z-index: 2; /* qbutton을 qfind 위에 표시 */
}

#rfind {
	position: relative;
	z-index: 1; /* qfind를 다른 요소보다 위에 표시 */
	left: 32px;
}

#qti {
	margin-bottom: 20px;
	text-align: center;
	margin-top: 10px;
}

#rwrite {
	flex-direction: column; /* 세로 방향 가운데 정렬 */
}

#Rlist_t {
	border-style:2px solid #000;
	overflow: auto; /* 내용이 넘칠 때 스크롤 표시 */
	table-layout: fixed;
    border-spacing: 0;
	
}

#Rlist_t th {
	border-bottom: 2px solid #9ca3a6; /* 가로 구분선 추가 및 회색 계열의 바탕색 설정 */
	background-color: #fff;
	padding: 15px; /* 셀 안의 내용과 내부 여백 설정 */
	text-align: center; /* 텍스트 가운데 정렬 */
}

#Rlist_t td {
	padding: 15px;
	text-align: center;
}


/*페이징 부분 */
.paging-section {
    padding: 15px;
    text-align: center;
}

.paging-section a {
    text-decoration: none;
    margin : 0 5px;
}

.paging-section a:hover {
    color: #6e7480; 
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />


<div id="container_r">
<div id="rwrap">

<form method="get" action="review_list">
		<div id="qti">
		<h2 class="title_q"><strong>Review</strong> (총 ${listcount}개)</h2>
					<h6 id="qq">
						<strong>NUBE</strong> 리뷰 게시판입니다.
					</h6>
			</div>
<div id="rtable">
      <table id="Rlist_t" style='width: 900px; table-layout: fixed; word-break: break-all; height:auto'>
         <tr>
            <th width="8%" height="26">번호</th>
            <th width="50%">제목</th>
            <th width="14%">작성자</th>
            <th width="17%">작성일</th>
            <th width="10%">조회수</th>
         </tr>

         <c:if test="${!empty rlist}">
            <c:forEach var="r" items="${rlist}">
               <tr>
                  <td align="center">                  
                  <c:if test="${r.restep==0}"> <!-- 원본글일때만 글그룹번호를 출력 -->
                  ${r.reref}
                  </c:if>
                  </td>
                  <td>
                  <c:if test="${r.restep!=0}"> <!-- 답변글일때만 실행: 계단형 계층형 자료실 -->
                  <c:forEach begin="1" end="${r.restep}" step="1">
                  &nbsp;<%--한 칸의 빈 공백 처리 --%>
                  </c:forEach>
                  &#8627;
                  </c:if>
                  <a
                     href="review_cont?reno=${r.reno}&state=cont&page=${page}">
                        ${r.retitle}</a></td>
                  <td align="center">${r.rename2}</td>
                  <td align="center">${fn:substring(r.redate,0,10)}</td>
                  <%-- 0이상 10미만 사이의 년월일만 반환 --%>
                  <td align="center">${r.rehit}</td>
               </tr>
            </c:forEach>
         </c:if>

         <c:if test="${empty rlist}">
            <tr>
               <th colspan="5">리뷰 목록이 없습니다.</th>
            </tr>
         </c:if>
      </table>
</div>


      <%--페이징(쪽나누기)--%>
      <div id="rList_paging" class="paging-section">
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

      <div id="rbutton">
         <input type="button" class="btn btn-dark" id="rwrite" value="글쓰기"
            onclick="location='review_write?page=${page}';" />
      	<c:if test="${(!empty find_field) && (!empty find_name)}"> <!-- 이건 지금 검색 이후!! -->
      	<input type="button" class="btn btn-dark" value="전체목록"
      	onclick="location='review_list?page=${page}';"> <!-- 내가 본 페이지로 가는..책갈피 기능 -->
      	</c:if>
      </div>
      
			<%--검색 폼 추가--%>
			<div id="rFind">
				<select name="find_field">
					<option value="retitle"
						<c:if test="${find_field=='retitle'}"> ${'selected'}></c:if>>
						<!-- find_field가 re_cont와 같다면 해당 목록을 선택되게 한다. -->
						글제목</option>
					<option value="recont"
						<c:if test="${find_field=='recont'}">${'selected'}
					</c:if>>글내용</option>
				</select> <input type="search" name="find_name" id="find_name" 
				size="16" value="${find_name}"> 
				<input type="submit" value="검색">
			</div>


		
</form>
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