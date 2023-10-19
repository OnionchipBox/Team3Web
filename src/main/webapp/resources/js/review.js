/**
 *  리뷰 글쓰기 폼 유효성 검사 10/19
 */
 
 function write_check(){
   if($.trim($("#re_name").val())==""){
      alert("글쓴이를 입력하세요!");
      $("#re_name").val("").focus();
      return false;
   }
   if($.trim($("#re_title").val())==""){
      alert("글제목을 입력하세요!");
      $("#re_title").val("").focus();
      return false;
   }
   if($.trim($("#re_pwd").val())==""){
      alert("비밀번호를 입력하세요!");
      $("#re_pwd").val("").focus();
      return false;
   }
   if($.trim($("#re_cont").val())==""){
      alert("글내용을 입력하세요!");
      $("#re_cont").val("").focus();
      return false;
   }
}