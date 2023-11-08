<%@ page contentType="text/html; charset=UTF-8" %>

 
 <%--관리자 메인 본문 --%>
  <div id="aMain_cont">
    <div id="aBw_wrap">
     <h2 class="aBw_title">관리자 공지 수정</h2>
     <form method="post" action="admin_gongji_edit_ok"
     onsubmit="return gw_check();">
     <input type="hidden" name="gno" 
     value="${g.gno}" />
     <input type="hidden" name="page" value="${page}" />
     <table id="aBw_t">
    <tr>
     <th>이름</th>
     <td>
     <input name="gname" id="gname" size="14" 
     value="${g.gname}"/>
     </td>
    </tr>
    <tr>
     <th>제목</th>
     <td>
     <input name="gtitle" id="gtitle" size="35" 
     value="${g.gtitle}" />
     </td>
    </tr>
    <tr>
     <th>비밀번호</th>
     <td>
     <input type="password" name="gpwd" id="gpwd"
     size="14" />
     </td>    
    </tr>
    <tr>
     <th>내용</th>
     <td>
     <textarea name="gcont" id="gcont" rows="9"
     cols="36">${g.gcont}</textarea>
     </td>
    </tr>
   </table>
   <div id="aBw_menu">
    <input type="submit" value="수정" />
    <input type="reset" value="취소" 
    onclick="$('#gname').focus();" />
    <input type="button" value="목록"
    onclick="location='admin_gongji_list?page=${page}';" />
   </div>
     </form>
    </div>
  </div>
  



 




 