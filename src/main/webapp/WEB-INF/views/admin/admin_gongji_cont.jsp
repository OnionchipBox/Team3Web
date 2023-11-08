<%@ page contentType="text/html; charset=UTF-8" %>

<div id="aMain_cont">
 <div id="aBc_wrap">
  <h2 class="aBc_title">관리자 공지 내용</h2>
  <table id="aBc_t">
   <tr>
    <th>제목</th> <td>${g.gtitle}</td>
   </tr>
   <tr>
    <th>내용</th> <td>${g_cont}</td>
   </tr>
   <tr>
    <th>조회수</th> <td>${g.ghit}</td>
   </tr>
  </table>
  <div id="aBc_menu">
  <input type="button" value="목록"
  onclick="location='admin_gongji_list?page=${page}';" />  
  </div>
 </div>
</div>
