<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 등록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<script>
document.getElementById('sellerOK').addEventListener('click', function() {
    var successMessage = '${successMessage}';
    if (successMessage) {
        alert(successMessage);
    }
});

var errorMessage = '${errorMessage}';
var successMessage = '${successMessage}';
if (errorMessage === 'ErrorMessage') {
	alert("이미 등록된 판매자 입니다");
}
</script>
<style>
    /* 입력칸 스타일 */
    .Input-container {
        width: 400px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f9f9f9;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    .input-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .form-control {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 3px;
        outline: none;
    }

    input[type="text"]::placeholder {
        color: #999;
    }

    input[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 3px;
        font-size: 18px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    hr {
        border: 1px solid #ccc;
        margin-top: 20px;
        margin-bottom: 0;
    }
</style>

<body>
<jsp:include page="../header.jsp" />
<div class="Input-container">
		<h2>NUBE</h2>
		 <form action="<%=request.getContextPath()%>/registration" method="post">
                <div class="input-group">
                    <label for="sellerId">사업자등록번호 : </label> 
                    <input class="form-control" id="sellerId" name="sellerId" placeholder="ex) 012345-678910" required>
                </div>
                <div class="input-group">
                    <label for="sellerName">업체명 : </label> 
                    <input class="form-control" id="sellerName" name="sellerName" placeholder="업체명 입력" required>
                </div>
                <button type="submit" class="btn btn-primary" id="sellerOK">등록</button>  
        </form>
	</div>
<br><br><br>
<jsp:include page="../footer.jsp" />
<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="/shop/resources/js/script.js"></script>
</body>
</html>