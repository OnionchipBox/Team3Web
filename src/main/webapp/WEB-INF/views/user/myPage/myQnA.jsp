<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="./resources/js/myQnA.js"></script>
<style>
  /* Overall container styles */
  #con {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 50vh;
    
  }
  /* Form styles */
  table {
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-collapse: collapse;
  }
  input[type="text"] {
    width: 50%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  textarea[name="qcont"] {
    width: 50%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

#qnat{
	color:#b5b8bd;
	text-align:center;
	font-weight:bold;
}

#qmenu{
	margin-top:15px;
}

#tt{
	margin:auto 10px;
}

#ttt{
	margin:auto 10px;
	position:relative;
	bottom:28px;
}
/* Custom switch style */
  .form-check-input[type="checkbox"]:checked + .form-check-label::before {
    background-color: #ccc; /* 회색으로 변경 */
    border-color: #ccc;
</style>

</head>
<body>
<jsp:include page="../../header.jsp" />
<form method="post" action="myQnA_ok"
			onsubmit="return write_check();">
<div id="con">			
<div id="container" style="justify-content: center;">
<h4 id="qnat">1:1문의 작성</h4>		
<table>
<tr>
<td><span id="tt">제목</span><input type="text" name="qtitle" id="qtitle"></td>
</tr>
<tr>
<td><span id="ttt">내용</span><textarea name="qcont" id="qcont"></textarea></td>
</tr>
<tr>
<td>
<div class="form-check form-switch">
  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
  <label class="form-check-label" for="flexSwitchCheckDefault">답변 알림 선택 유무</label>
  												<!-- 추후에 알림 기능 구현  -->
</div>
</td>
</tr>
</table>
<div id="qmenu">
         	   <input type="submit" class="btn btn-dark" value="취소" />
               <input type="reset" style="display:none;" onclick="$('#qtitle').focus();" />
               <button type="button" class="btn btn-dark" onclick="location='myQnA_list';">내 문의 내역</button>
               <input type="submit" class="btn btn-dark" value="작성하기" />
         </div>

</div>
</div>       
</form>


<jsp:include page="../../footer.jsp" />
	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script>
</body>
</html>