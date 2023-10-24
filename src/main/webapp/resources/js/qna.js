/**
 * qna.js : 자료실 유효성 검증 10/16
 */
 
function write_check(){
   if($.trim($("#qid").val())==""){
      alert("글쓴이를 입력하세요!");
      $("#qid").val("").focus();
      return false;
   }
   if($.trim($("#qtitle").val())==""){
      alert("글제목을 입력하세요!");
      $("#qtitle").val("").focus();
      return false;
   }
   if($.trim($("#qpw").val())==""){
      alert("비밀번호를 입력하세요!");
      $("#qpw").val("").focus();
      return false;
   }
   if($.trim($("#qcont").val())==""){
      alert("글내용을 입력하세요!");
      $("#qcont").val("").focus();
      return false;
   }
}