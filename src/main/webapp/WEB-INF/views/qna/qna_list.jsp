<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q &#38; A 상품문의</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#container_q {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
}

#qwrap {
	width: 90%;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative; /* 요소의 위치를 조정하기 위해 필요한 기본 속성 */
	top: -40px; /* 위로 이동할 픽셀 수를 조정하세요. 음수 값은 위로 이동, 양수 값은 아래로 이동 */
}

a {
	text-decoration: none;
	color: inherit;
}

#titleui {
	margin-left: 10px;
}

.title_q {
	font-weight: bold;
}

#qfind, #qList_paging {
	margin-top: 5px;
	flex-direction: column; /* 세로 방향 가운데 정렬 */
	align-items: center; /* 세로 방향 가운데 정렬 */
	text-align: center;
}

#qList_paging {
	padding: 10px;
}

#qbutton {
	position: relative;
	float: right;
	right: 20px;
	z-index: 2; /* qbutton을 qfind 위에 표시 */
}

#qfind {
	position: relative;
	z-index: 1; /* qfind를 다른 요소보다 위에 표시 */
	left: 32px;
}

#qti {
	margin-bottom: 30px;
	text-align: center;
	margin-top: 10px;
}

#qwrite {
	flex-direction: column; /* 세로 방향 가운데 정렬 */
}

#qList_t {
	border-collapse: collapse; /* 테두리를 겹치게 설정 */
}

#qList_t th {
	
	border-bottom: 2px solid #9ca3a6; 
	background-color: #fff;
	padding: 8px; /* 셀 안의 내용과 내부 여백 설정 */
	text-align: center; /* 텍스트 가운데 정렬 */
}

#qList_t td {
	border-bottom: 1px solid #e9e9e9; /* 가로 구분선 추가 */
	padding: 12px;
	text-align: center;
}

#qtable {
	/*border: 1px solid #ccc; /* 바깥 윤곽선 설정 */
	
	border-radius: 3px; /* 윤곽선의 둥근 모서리 설정 */
	overflow: auto; /* 내용이 넘칠 때 스크롤 표시 */
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */

}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
					

	<div id="container_q">
		<div id="qwrap">	
			<form method="get" action="qna_list">
		
		<div id="qti">
		<h2 class="title_q">Q & A (총 ${listcount}건)</h2>
					<h6 id="qq">
						<strong>NUBE</strong> 문의 게시판입니다.
					</h6>
			</div>				
			
			<div id="qtable">
				<table id="qList_t"
					style='width: 900px; table-layout: fixed; word-break: break-all; height:auto'>
					<!-- 추후 비밀작성글 / 비밀글 제외 버튼 추가 보완 -->
					<tr>
						<th width="6%" height="26">번호</th>
						<!--   <th width="10%">구분</th> -->
						<!-- 입력폼에서 넣어둔 radio 문의유형 추후 적용해보기 -->
						<th width="50%">제목</th>
						<th width="14%">작성자</th>
						<th width="17%">등록일자</th>
					</tr>
					<c:if test="${!empty qlist}">
						<c:forEach var="q" items="${qlist}">
							<tr>
								<td align="center"><c:if test="${q.qstep==0}">
										<!-- 원본글일때만 글그룹번호를 출력 -->
                  ${q.qref}  
                  </c:if></td>
								<td><c:if test="${q.qstep!=0}">
										<!-- 답변글일때만 실행: 계단형 계층형 자료실 -->
										<c:forEach begin="1" end="${q.qstep}" step="1">
                  &nbsp;<%--한 칸의 빈 공백 처리 --%>
										</c:forEach>
										<!--  <img src="images/AnswerLine.gif"> -->
										<%--답변글 이미지 --%>
										<!--  <i class='bx bxs-cloud' ></i> -->
                 &#8627;
                 
                 <!-- 추후 제목 눌렀을 때 페이징 이동 말고 이벤트 처리로 현재 페이지에서 모달창이나 ajax 비동기식 되게끔 구현하기-->
                   </c:if> <a id="titleui"
									href="qna_cont?qnano=${q.qnano}&state=cont&page=${page}">
										${q.qtitle}</a></td>
								<td align="center">${q.qid}</td>
								<td align="center">${fn:substring(q.qdate,0,10)}</td></tr>
						</c:forEach>
					</c:if> 
		
					<c:if test="${empty qlist}">
						<tr>
							<th colspan="5">자료실 목록이 없습니다.</th>
						</tr>
					</c:if>
				</table>
				</div>



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
				<div id="qbutton">
					<input type="button" id="qwrite" class="btn btn-dark" value="글쓰기"
						onclick="location='qna_write?page=${page}';" />
					<c:if test="${(!empty find_field) && (!empty find_name)}">
						<input type="button" class="btn btn-dark" value="전체 목록"
							onclick="location='qna_list?page=${page}';" />
					</c:if>
				</div>

<%--검색 폼추가 --%>
				<div id="qfind">
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
	</div>



<script type="text/javascript">
$(document).ready(function() {
	  // 게시물 클릭 이벤트 처리
	  $('.titleui').click(function(e) {
	    e.preventDefault(); // 기본 링크 동작 방지
	    var qnano = $(this).data('qnano'); // 게시물 번호를 가져옴
	
	    // 모달 창 열기
	    $('#qnaModal').modal('show');

	    // 게시물 내용을 로드할 div를 지정
	    var qnaContent = $('#qna-content');

	    // Ajax 요청 생성
	    $.ajax({
	      type: 'GET',
	      url: 'qna_cont', // 게시물 내용을 반환하는 서버 엔드포인트
	      data: { qnano: qnano },
	      success: function(data) {
	        // 성공 시 게시물 내용을 qna-content div에 추가
	        qnaContent.html(data);
	      },
	      error: function() {
	        // 에러 처리
	        alert('게시물 내용을 불러오는 중 오류가 발생했습니다.');
	      }
	    });
	  });
	});
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