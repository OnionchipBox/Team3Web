<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" type="text/css" href="./css/review.css" />
<script 
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
 function del_check(){
    if($.trim($("#del_pwd").val()) == ""){
       alert("삭제 비번을 입력하세요!");
       $("#del_pwd").val("").focus();
       return false;
    }
 }
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
   <div id="bsDel_wrap">
      <h2 class="bsDel_title">리뷰 삭제</h2>
      <form method="post" action="review_del_ok?reno=${r.reno}" onsubmit="return del_check();">
      <%-- re_no는 get방식으로 전달되고, page와 del_pwd는 post방식으로 전달된다. --%>
          <input   type="hidden" name="page" value="${page}" />
         <table id="bsDel_t">
            <tr>
               <th>비밀번호</th>
               <td><input type="password" name="del_pwd" id="del_pwd"
                  size="14" /></td>
            </tr>
         </table>
         <div id="bsDel_menu">
            <input type="submit" class="btn btn-dark" value="삭제" /> <input type="reset" value="취소"
               class="btn btn-dark" onclick="$('#del_pwd').focus();" />
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