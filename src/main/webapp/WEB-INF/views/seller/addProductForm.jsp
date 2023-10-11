<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Add Product</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../header.jsp" />
    <h1>Add Product</h1>
    <form action="<%=request.getContextPath()%>/addProduct" method="post" enctype="multipart/form-data">
    <input type="number" id="productId" name="productId" value="1" required>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" required><br>
        <label for="stock">Stock:</label>
        <input type="number" id="stock" name="stock" required><br>
  
        <label for="pcode">Product Code:</label>
        <input type="text" id="pcode" name="pcode" required><br>
        
   파일 : <input type="file" id="uploadFile" name="uploadFile"><br><br>
      <input type="submit" value="업로드">
     <div class="select_img"><img id =previewImage src="" /></div>
 
        <button type="submit">Add Product</button>
        
    </form>
    <%=request.getRealPath("/") %>
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
 $("#uploadFile").change(function(){
      if(this.files && this.files[0]) {
       var reader = new FileReader;
       reader.onload = function(data) {
        $("#previewImage").attr("src", data.target.result).width(500);        
       }
       reader.readAsDataURL(this.files[0]);
      }
     });
</script>
</html>