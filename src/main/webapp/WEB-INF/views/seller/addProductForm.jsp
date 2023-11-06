
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Add Product</title>
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
   <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script type="text/javascript" src="./resources/js/validation.js"></script>
</head>
<title>상품 등록</title>
</head>
<body>
<jsp:include page="../header.jsp" />

   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">상품 등록</h1>
      </div>
   </div>
   <div class="container">
       <form action="<%=request.getContextPath()%>/addProduct" method="post" enctype="multipart/form-data">
         <div class="form-group row">
            <label class="col-sm-2"></label>
            <div class="com-sm-3">
               <input type="hidden" id="productId" name="productId" value="1"
                  class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">상품 이름</label>
            <div class="com-sm-3">
               <input type="text" id="name" name="name" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">가격</label>
            <div class="com-sm-3">
               <input type="text" id="price" name="price" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">제품 코드</label>
            <div class="com-sm-3">
               <input type="text" id ="pcode"name="pcode" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2" >분류</label> <select id="categoryId"
               name="categoryId" required>
               <option value="" >Select a category</option>
               <option value="1">신발</option>
               <option value="2">악세서리</option>
               <option value="3">의류</option>
               <option value="4">가방</option>
            </select>
            <div class="com-sm-3">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">재고 수</label>
            <div class="com-sm-3">
               <input type="text" id="stock" name="stock" class="form-control">
            </div>
         </div>

         <div class="form-group row">
         
            <label class="col-sm-2">상태</label>
            <div class="com-sm-5">
               <input type="radio" name="condition" value="New"> 신규 제품 <input
                  type="radio" name="condition" value="Old"> 중고 제품 <input
                  type="radio" name="condition" value="Refurbished"> 재생 제품
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">상품 이미지</label>
            <div>
               <input
         type="file" id="uploadFile" name="uploadFile"class="form-control"> 
         <div class="select_img">
         <img id=previewImage src="" />
      </div> 
            </div>
         </div>
         <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10">
                  <input type="submit"   class="btn btn-primary" value="등록" >
            </div>
         </div>
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
<script>
   $("#uploadFile").change(function() {
      if (this.files && this.files[0]) {
         var reader = new FileReader;
         reader.onload = function(data) {
            $("#previewImage").attr("src", data.target.result).width(500);
         }
         reader.readAsDataURL(this.files[0]);
      }
   });
</script>
</html>
 