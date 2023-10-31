/**
 *  리뷰 글쓰기 폼 유효성 검사 10/19
 */
 
 function write_check(){
   if($.trim($("#rename2").val())==""){
      alert("작성자를 입력하세요!");
      $("#rename2").val("").focus();
      return false;
   }
   if($.trim($("#retitle").val())==""){
      alert("글제목을 입력하세요!");
      $("#retitle").val("").focus();
      return false;
   }
   if($.trim($("#repwd").val())==""){
      alert("비밀번호를 입력하세요!");
      $("#repwd").val("").focus();
      return false;
   }
   if($.trim($("#recont").val())==""){
      alert("글내용을 입력하세요!");
      $("#recont").val("").focus();
      return false;
   }
}