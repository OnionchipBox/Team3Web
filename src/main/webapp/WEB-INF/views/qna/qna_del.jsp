<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 삭제</title>
<script 
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script>
 function del_check(){
    if($.trim($("#qpw").val()) == ""){
       alert("삭제 비번을 입력하세요!");
       $("#qpw").val("").focus();
       return false;
    }
 }
</script>

<style>
#q_wrap {

   text-align: center;
   display: flex;
   flex-direction: column;
   align-items: center;
	
}
h2{
	margin-top:30px;	
	font-weight: bold;
	margin-bottom:10px;
}
#q_menu{
	margin-top:10px;
	margin-left:10px;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
   <div id="q_wrap">
      <h2 class="q_title">문의 삭제</h2>
      <form method="post" action="qna_del_ok?qnano=${q.qnano}" onsubmit="return del_check();">
      <%-- qna_no는 get방식으로 전달되고, page와 qpw는 post방식으로 전달된다. --%>
          <input   type="hidden" name="page" value="${page}" />
         <table id="q_t">
            <tr>
               <th>비밀번호</th>
               <td><input type="password" name="qpw" id="qpw"
                  size="14" /></td>
            </tr>
         </table>
         <div id="q_menu">
            <input type="submit" class="btn btn-dark" value="삭제" /> <input type="reset" class="btn btn-dark" value="취소"
               onclick="$('#qpw').focus();" />
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