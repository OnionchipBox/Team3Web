<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team3Web</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function searchAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
           var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
            
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            
            document.getElementById('zipcode').value = data.zonecode; //우편번호
            document.getElementById("roadAddr1").value = roadAddr; //도로명 주소
            //document.getElementById("NOaddress").value = data.jibunAddress; //일반 주소
            document.getElementById("roadAddr2").focus();
        }
  }).open();
}

</script>
</head>
<body>
<jsp:include page="../header.jsp" />
<div class="container">
      <div class="row">
         <h1>회원 정보 수정하기</h1>
      </div>
      <div class="row">
         <form class="form-horizontal" action="/shop/userUpdate" method="post">
            <div class="form-group">
               <label for="inputId" class="col-sm-2 control-label">ID</label>
               <div class="col-sm-10">
                  <input class="form-control" id="inputId" value="${loggedInUserId}" name="id" placeholder="${loggedInUserId}" readonly>
               </div>
            </div>
            <div class="form-group">
               <label for="inputPassword" class="col-sm-2 control-label">Password</label>
               <div class="col-sm-10">
                  <input type="password" class="form-control" id="inputPassword" value="" name="password1">
               </div>
            </div>
            <div class="form-group">
               <label for="inputPassword2" class="col-sm-2 control-label">Confirm Password</label>
               <div class="col-sm-10">
                  <input type="password" class="form-control" id="inputPassword2" value="" name="password2" >
                  <button type="button" id="checkPasswordButton" class="btn btn-primary">비밀번호 확인</button>
                  <span id="passwordMatchStatus" style="color: blue;"></span>
               </div>
            </div>            
            <div class="form-group">
               <label for="inputName" class="col-sm-2 control-label">Name</label>
               <div class="col-sm-10">
                  <input class="form-control" id="inputName" value="" name="name" placeholder="${loggedInUserName}"  readonly>
               </div>
            </div>
            <div class="form-group">
               <label for="inputNickName" class="col-sm-2 control-label">NickName</label>
               <div class="col-sm-10">
                  <input class="form-control" id="inputNickName" value="${loggedInUserNickName}" name="nickname" placeholder="${loggedInUserNickName}" >
               </div>
            </div>
				<div class="form-group">
					<label for="inputAdd" class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<input type="text" id="zipcode" name="zipcode"
							value="" onclick="searchAddress()">&nbsp;
						<input type="button" class="btn btn-default btn-sm" id="searchAdd" value="" onclick="searchAddress()"><br> 
							<input class="form-control" type="text" id="roadAddr1" value="" name="roadAddr1" onclick="searchAddress()">
							 <input class="form-control" type="text" id="roadAddr2" value="" name="roadAddr2" placeholder="상세주소">
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">Tel</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputTel" name="phone" placeholder="${loggedInUserPhone}">
					</div>
				</div>
				<div class="form-group">
               <label for="inputBirth" class="col-sm-2 control-label">Bitrh</label>
               <div class="col-sm-10">
                  <input type="date" class="form-control" id="inputBirth" value="" name="birthday">
               </div>
            </div>            
            <div class="form-group">
               <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-default submit">회원정보 수정하기</button>
                  

               </div>
            </div>
         </form>
          <a href="/shop/myPage"><button class="btn btn-default" id="back_to_myPage">마이페이지로 돌아가기</button></a>
      </div><!-- class=row -->
   </div><!-- class=container -->
   <br><br><br>
	<jsp:include page="../footer.jsp" />
	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	<script>
	document.getElementById("checkPasswordButton").addEventListener("click", function() {
	    var password1 = document.getElementById("inputPassword").value;
	    var password2 = document.getElementById("inputPassword2").value;
	    
	    if (password1 === password2) {
	        alert("비밀번호가 일치합니다.");
	        passwordMatchStatus.textContent = "체크 완료";
	        passwordMatchStatus.style.color = "blue";
	    } else {
	        alert("비밀번호가 일치하지 않습니다.");
	    }
	});
	</script>
</body>
</html>