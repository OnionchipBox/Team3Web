/**
 * myQnA.js : 1:1 문의 폼 유효성 검증 11/01
 */
 
function write_check(){
   if($.trim($("#qtitle").val())==""){
      alert("글제목을 입력하세요!");
      $("#qtitle").val("").focus();
      return false;
   }
   if($.trim($("#qcont").val())==""){
      alert("글내용을 입력하세요!");
      $("#qcont").val("").focus();
      return false;
   }
}