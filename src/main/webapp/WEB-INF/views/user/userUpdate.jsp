<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<div class="row">
			<h1>회원 정보 수정하기</h1>
		</div>
		<div class="row">
			<form class="form-horizontal" action="/member/update" method="post">
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">ID</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputId" value="${userInfo.userid}" name="userid" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword" value="${userInfo.userpw}" name="userpw">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword2" class="col-sm-2 control-label">Confirm Password</label>
					<div class="col-sm-10">
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
					</div>
				</div>				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default submit">회원정보 수정하기</button>
						<button class="btn btn-default" id="back_to_myPage">마이페이지로 돌아가기</button>
					</div>
				</div>
			</form>
		</div><!-- class=row -->
	</div><!-- class=container -->

</body>
</html>