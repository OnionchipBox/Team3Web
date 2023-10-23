<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
/* 사용자 정의 경고 스타일 */
.alert {
    background-color: lightgray; /* 배경색 */
    color: white; /* 텍스트 색상 */
    padding: 10px;
    border-radius: 5px;
}
</style>


</head>
<body>
모달창 테스트중
<form method="get" action="qna_test">

</form>

<button onclick="customAlert()">사용자 정의 경고</button>

<script>
function customAlert() {
    var alertBox = document.createElement("div");
    alertBox.classList.add("alert"); // 사용자 정의 클래스 추가
    alertBox.innerHTML = "이것은 사용자 정의 경고입니다!";
    document.body.appendChild(alertBox);
}
</script>




<script>
$(function() {
	$("#modal").modal("show");
});
</script>
<div class="modal" id="modal"  role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" >
	<div class="modal-dialog" style="width:850px;">
		<div class="modal-content" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					×
				</button>
				<h4 class="modal-title" id="myModalLabel">NUBE</h4>
			</div>
			<div class="modal-body">
				<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-4" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" data-widget-togglebutton="false">
					<div role="content">
						<div class="widget-body">		
							NUBE에 오신 것을 환영합니다!	
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


</body>
</html>