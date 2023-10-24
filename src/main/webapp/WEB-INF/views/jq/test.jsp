<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
/**
 *  10/24
 */
 

$(function(){
 	$('#apibtn').click(function(){
 	$.ajax({
 	url:'/jq/kakaopay.cls' ,
 	dataType:'json' ,
 	success:function(data){
 		alert(data);
 	} ,
 	error:function(error){
 	alert(error);
 	}
 	});
 	});
 });
</script>
</head>
<style>
#kadiv{
	margin-top:10%;
	text-align:center;
}
#apibtn{
	position:relative;
}
</style>
<body>
<div id="kadiv">
<h3>카카오페이 api 구현 테스트 중</h3>
<!--<div id="hbtn">HOME</div>-->
<input type="button" class="btn btn-dark" value="HOME" />
<c:if test="${empty sessionScope.SID}">
<!--<div id="loginbtn">LOGIN</div>-->
<input type="button" class="btn btn-dark" value="LOGIN" />
</c:if>
<input type="button" id="apibtn" class="btn btn-dark" value="kakaopay" />
<c:if test="${not empty sessionScope.SID}">
<!-- <div id="logoutbtn">LOGOUT</div>
<div id="writebtn">WRITE</div>
<div id="editbtn">EDITOR</div> -->
<input type="button" class="btn btn-dark" value="LOGOUT" />
</c:if>
</div>
<hr>
</body>
</html>