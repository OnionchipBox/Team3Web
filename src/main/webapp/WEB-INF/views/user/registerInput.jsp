<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!--script>
function checkNickname(){
	var nicknameCheck = $("#nicknameCheck").val();
	var nickname = $("#nickname").val();
	var regExp =  /^[가-힣|a-z|A-Z|0-9|]+$/;

	if(nicknameCheck == null || nicknameCheck == ""){
		alert("닉네임을 입력 해주세요");
		return false;
	}
	if(!regExp.test(nicknameCheck)){
		alert("닉네임은 한글, 영어, 숫자만 4 ~10자리로 입력 가능합니다.");
		return false;
	}
	$.ajax({
		type : 'POST',
		url : '/user/registerInput',
		data : {nickname:nicknameCheck },
		dataType : 'json',
		success : function(data){
			console.log(data)
			if(data.JavaData == 'YES'){
				alert("사용가능한 닉네임 입니다.");
				$("#nickname").val(nicknameCheck);
			}else{
				alert("이미 존재하는 닉네임 입니다.");
				$("#nicknameCheck").val("");
			}
		},
		error: function(xhr, status, error){
			alert(error);
		}
	});
}


function register(){
	var registerData =common.serializeObject($("form[name=userRegisterForm]"));
	if(registerData.nickname == null || registerData.nickname == ""){
		alert("닉네임 중복 체크를 해주세요");
		return false;
	}
	var phoneNum = registerData.phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3")
	registerData.phone = phoneNum
	
	$.ajax({
		type : 'POST',
		url : '/user/checkRegister',
		data : registerData,
		dataType : 'json',
		success : function(data){
			if(data.JavaData == "YES"){
				alert("가입되었습니다.");
				location.href = '/user/login'
			}else{
				alert("가입에 실패했습니다.");
			}
		},
		error: function(xhr, status, error){
			alert("가입에 실패했습니다."+error);
		}
	});
}
</script-->
<script>
//다음 주소 검색 api
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
            
         	// 참고항목 문자열이 있을 경우
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }
            var guideTextBox = document.getElementById("guide");
            
        }
   	}).open();
}

function showRegisterEvent() {
 	var Name = document.getElementById("name").value;
 	var NickName = document.getElementById("nickname").value;
    alert(Name + "님 회원가입을 축하합니다!\n닉네임 : "+ NickName);
}

window.addEventListener("load", function() {
	function setReadonlyIfValueExists(inputField) {
	    if (inputField.value === "") {
	        inputField.removeAttribute("readonly");
	    } else {
	        inputField.setAttribute("readonly", "readonly");
	    }
	}

	var IdInput = document.getElementById("id");
	var nameInput = document.getElementById("name");
	var nicknameInput = document.getElementById("nickname");
	var phoneInput = document.getElementById("phone");
	var BirthdayInput = document.getElementById("birthday");
	var GenderInput = document.getElementById("gender");

	setReadonlyIfValueExists(IdInput);
	setReadonlyIfValueExists(nameInput);
	setReadonlyIfValueExists(nicknameInput);
	setReadonlyIfValueExists(phoneInput);
	setReadonlyIfValueExists(BirthdayInput);
	setReadonlyIfValueExists(GenderInput);
});
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
<h1 class="mt-5">회원가입 추가 입력폼</h1>
<form method="post" action="<%= request.getContextPath() %>/register">
    <div class="form-group">
        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" class="form-control" placeholder="ex)Team3Web@naver.com" value="${user.id}" required>
    </div>
    <div class="form-group">
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="영문,숫자,특수문자 조합 8-16자" required>
    </div>
    <div class="form-group">
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" class="form-control" value="${user.name}" required>
    </div>
    <div class="form-group">
        <label for="nickname">닉네임:</label>
        <input type="text" id="nickname" name="nickname" class="form-control" value="${user.nickname}" required>
    </div>
    <div class="form-group">
        <label for="phone">전화번호:</label>
        <input type="text" id="phone" name="phone" class="form-control" placeholder="ex)01012345678" value="${user.phone}" required>
    </div>
    <div class="form-group">
        <label for="birthdate">생년월일:</label>
        <div id="birthGroup">
            <input type="text" id="birthday" name="birthday" class="form-control" value="${user.birthday}" placeholder="ex)2000-12-31" required>
        </div>
    </div>     
    <div class="form-group">
        <label for="gender">성별:</label>
        <input type="text" id="gender" name="gender" class="form-control" value="${user.gender}" required>
    </div>
    <div class="form-group">
        <label for="addressGroup">주소:</label>
        <div id="addressGroup">
            <input type="text" id="roadAddr1" name="roadAddr1" class="form-control" placeholder="주소" onclick="searchAddress()" required readonly>
            <button class="button" class="searchAddress" onclick="searchAddress()">주소 검색</button>
        </div>
        <input type="text" id="zipcode" name="zipcode" class="form-control" placeholder="우편번호" onclick="searchAddress()" required readonly>
        <input type="text" id="roadAddr2" name="roadAddr2" class="form-control" placeholder="상세주소 입력" required>
    </div>
    <button type="submit" class="btn btn-primary" onclick="showRegisterEvent()">회원가입</button>
</form>

<jsp:include page="../footer.jsp" />
<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
</body>
</html>