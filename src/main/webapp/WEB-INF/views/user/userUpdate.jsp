<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
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
            document.getElementById("address").value = roadAddr; //도로명 주소
            //document.getElementById("NOaddress").value = data.jibunAddress; //일반 주소
            
         	// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }
            var guideTextBox = document.getElementById("guide");
            
        }
   	}).open();
}

</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<br><br><br><br>
=======
<title>Insert title here</title>
</head>
<body>
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
<div class="container">
		<div class="row">
			<h1>회원 정보 수정하기</h1>
		</div>
		<div class="row">
<<<<<<< HEAD
			<form class="form-horizontal" action="/shop/userUp" method="post">
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">ID</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputId" value="${user.id}" name="id" required readonly>
=======
			<form class="form-horizontal" action="/member/update" method="post">
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">ID</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputId" value="${userInfo.userid}" name="userid" readonly>
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
<<<<<<< HEAD
						<input type="password" class="form-control" id="inputPassword"  name="password">
=======
						<input type="password" class="form-control" id="inputPassword" value="${userInfo.userpw}" name="userpw">
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword2" class="col-sm-2 control-label">Confirm Password</label>
					<div class="col-sm-10">
<<<<<<< HEAD
						<input type="password" class="form-control" id="inputPassword2" >
					</div>
				</div>				
				<div class="form-group">
					<label for="inputName" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputName" value="${user.name}" name="name" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="inputAdd" class="col-sm-2 control-label">주소</label>
					<div class="col-sm-10">
						<input type="text" id="zipcode" name="zipcode" value="${user.zipcode}" onclick="searchAddress()" readonly>&nbsp;
						<input type="button" class="btn btn-default btn-sm" id="searchAdd" value="우편번호 찾기" onclick="searchAddress()"><br>
						<input class="form-control" type="text" id="address" name="address" value="${user.address}" readonly>
						<input class="form-control" type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
						
					</div>
				</div>
	
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">전화번호</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="inputTel" value="${user.phone}" name="phone">
					</div>
				</div>
				<div class="form-group">
					<label for="inputBirth" class="col-sm-2 control-label">생일</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" id="inputBirth" value="${user.birthday}" name="birthday">
=======
						<input type="password" class="form-control" id="inputPassword2" value="${userInfo.userpw}">
					</div>
				</div>				
				<div class="form-group">
					<label for="inputName" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputName" value="${userInfo.username}" name="username">
					</div>
				</div>
				<div class="form-group">
					<label for="inputAdd" class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<input type="text" id="postcode" name="postcode" value="${userInfo.postcode}">&nbsp;
						<input type="button" class="btn btn-default btn-sm" id="searchAdd" value="우편번호 찾기"><br>
						<input class="form-control" type="text" id="roadAddress" name="useraddress" value="${userInfo.useraddress}">
						<input class="form-control" type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail" value="${userInfo.email}" name="email">
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">Tel</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="inputTel" value="${userInfo.tel}" name="tel">
					</div>
				</div>
				<div class="form-group">
					<label for="inputBirth" class="col-sm-2 control-label">Bitrh</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" id="inputBirth" value="${userInfo.birthDate}" name="birthDate">
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
					</div>
				</div>				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default submit">회원정보 수정하기</button>
<<<<<<< HEAD
						

					</div>
				</div>
			</form>
			<a href="/shop" class="btn btn-default"><button class="btn btn-default" id="back_to_myPage">마이페이지로 돌아가기</button></a>
		</div><!-- class=row -->
	</div><!-- class=container -->
	<br><br><br>
	<jsp:include page="../footer.jsp" />
=======
						<button class="btn btn-default" id="back_to_myPage">마이페이지로 돌아가기</button>
					</div>
				</div>
			</form>
		</div><!-- class=row -->
	</div><!-- class=container -->

>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
</body>
</html>