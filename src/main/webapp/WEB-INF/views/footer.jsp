
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
.footer {
   background-color: #f9f9f9;
   color: #333;
   padding: 40px 20px;
   font-size: 14px;
   line-height: 1.5;
}

.footer a {
   color: #333;
   text-decoration: none;
   transition: color 0.3s;
}

 .footer a:hover {
   color: #555;
}

.footer .inner {
   max-width: 1200px;
   margin: 0 auto;
   display: flex;
   justify-content: space-between;
   flex-wrap: wrap;
}

.service_area, .footer_menu, .corporation_area, .notice_area {
   margin-bottom: 20px;
}

.service_title {
   font-size: 18px;
   margin-bottom: 10px;
}

.service_tel {
   color: #FFD700;
   margin-left: 10px;
}

.menu_box {
   margin-right: 30px;
}

.menu_title {
   font-size: 16px;
   margin-bottom: 15px;
}

.menu_list {
   list-style-type: none;
   padding: 0;
}

.menu_item {
   margin-bottom: 10px;
}

.term_list {
   display: flex;
   list-style-type: none;
   padding: 0;
   margin: 0;
   gap: 20px;
}

.footer_sns .sns_box {
   display: flex;
   gap: 15px;
}

.footer_menu {
   display: flex;
   justify-content: space-between;
}

.btn_business, .btn.solid.small {
   display: inline-flex;
   align-items: center;
   gap: 5px;
   background-color: #FFD700;
   color: #333;
   padding: 5px 15px;
   border-radius: 5px;
   cursor: pointer;
   border: none;
   transition: background-color 0.3s, color 0.3s;
}

.btn_business:hover, .btn.solid.small:hover {
   background-color: #f5f5f5;
   color: #333;
}

.notice {
   font-size: 12px;
   opacity: 0.8;
}

.copyright {
   font-size: 12px;
   margin-top: 20px;
}
/* 모달 스타일 */
.modal {
   display: none;
   position: fixed;
   z-index: 1;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   background-color: rgba(0, 0, 0, 0.7);
   overflow: hidden;
}

/* 모달 내용 스타일 */
.modal-content {
   background-color: #fff;
   margin: 15% auto;
   padding: 20px;
   border: 1px solid #888;
   width: 32%;
   position: relative;
   max-height: 600px; /* 테이블 내용이 800px까지 표시되고 그 이상일 경우 스크롤이 나타남 */
   overflow-y: auto;
}

/* 닫기 버튼 스타일 */
.close {
   position: absolute;
   top: 1px; /* 상단 여백 조정 */
   right: 20px; /* 우측 여백 조정 */
   cursor: pointer;
   font-size: 40px; /* 원하는 크기로 조정 */
}

table {
   border-collapse: collapse;
   width: 100%;
}

th, td {
   border: 1px solid #ccc;
   padding: 8px;
   text-align: left;
}

th {
   background-color: #f2f2f2;
}

.selected {
   font-weight: bold;
}

h2 {
   text-align: center;
   font-size: 20px;
   font: bold;
   font-weight: bold; /* 굵은 글꼴 */
   color: #000; /* 검정색 */
}

.hidden {
   display: none;
}

h5 {
   font-weight: bold;
}

h6 {
   font-weight: bold;
}
</style>

</head>
<body>
   <div class="footer sm">
      <div class="inner">
         <div class="service_area">
            <div class="customer_service">
               <strong class="service_title">고객센터<a href="tel:1588-0000"
                  class="sevice_tel">1588-0000</a></strong>
               <div class="service_time">
                  <dl class="time_box">
                     <dt class="time_term">운영시간 평일 11:00 - 18:00 (토∙일, 공휴일 휴무)
                        점심시간 평일 13:00 - 14:00</dt>
                  </dl>
               </div>
            </div>
            <div class="footer_menu">
               <div class="menu_box">
                  <strong class="menu_title">이용안내</strong>
                  <ul class="menu_list">
                     <li class="menu_item" id="openInspectionCriteria"><a
                        href="#" class="menu_link">검수기준</a></li>
                     <li class="menu_item" id="openUsagePolicy"><a href="#"
                        class="menu_link">이용정책</a></li>
                     <li class="menu_item" id="openPenaltyPolicy"><a href="#"
                        class="menu_link">페널티 정책</a></li>
                     <li class="menu_item" id="openCommunityGuidelines"><a
                        href="#" class="menu_link">커뮤니티 가이드라인</a></li>
                  </ul>
               </div>
               <!-- 검수기준 모달 -->
               <div id="modalInspectionCriteria" class="modal">
                  <div class="modal-content">
                     <span class="close" id="closeInspectionCriteria">&times;</span>
                     <!-- 모달 내용을 추가하세요 -->
                     <h2>검수기준</h2>
                     <table>
                        <tr>
                           <td><a href="#" class="category-link" data-category="신발">신발</a></td>
                           <td><a href="#" class="category-link"
                              data-category="아우터상의하의">아우터 · 상의 · 하의</a></td>
                           <td><a href="#" class="category-link"
                              data-category="가방시계지갑패션잡화">가방 · 시계 · 지갑 · 패션잡화</a></td>
                        </tr>
                        <tr>
                           <td><a href="#" class="category-link" data-category="테크">테크</a></td>
                           <td><a href="#" class="category-link"
                              data-category="뷰티컬렉터블캠핑가구리빙">뷰티 · 컬렉터블 · 캠핑 · 가구/리빙</a></td>
                           <td><a href="#" class="category-link"
                              data-category="프리미엄시계">프리미엄 시계</a></td>
                        </tr>
                        <tr>
                           <td><a href="#" class="category-link"
                              data-category="프리미엄가방">프리미엄 가방</a></td>
                           <td></td>
                           <!-- 빈 칸 -->
                           <td></td>
                           <!-- 빈 칸 -->
                        </tr>
                     </table>

                     <!-- 카테고리 내용 -->
                     <div class="category-content" id="신발-content">
                        <!-- 신발 내용을 여기에 추가하세요 -->


                     </div>
                     <div class="category-content" id="아우터-content">
                        <!-- 아우터 내용을 여기에 추가하세요 -->

                     </div>
                     <div class="category-content" id="가방-content">
                        <!-- 가방 내용을 여기에 추가하세요 -->

                     </div>

                     <!-- 추가적인 카테고리 내용을 여기에 추가하세요 -->


                  </div>
               </div>

               <!-- 모달 -->
               <div id="modalUsagePolicy" class="modal">
                  <div class="modal-content">
                     <span class="close" id="closeUsagePolicy"
                        onclick="closeModal('modalUsagePolicy')">&times;</span>
                     <!-- 이용정책 내용을 여기에 추가 -->
                     <h2>이용정책</h2>
                     <p>
                        <a href="#" style="font-weight: bold;"
                           onclick="toggleContent('content1')">패널티 정책</a>
                     </p>
                     <div id="content1" class="hidden">
                        <!-- 이용정책 내용 1을 여기에 추가 -->
                        <p>
                           최종 수정일 2023년 6월 7일<br> <br> 판매자와 구매자의 건전한 거래를 위하여 아래
                           사유에 따라 페널티가 부과됩니다. 결제정보 오류로 페널티 결제 실패 시, <a
                              href="/shop/TermsOfService"
                              style="color: blue; text-decoration: underline;">이용약관</a>
                           제24조("서비스수수료")에 따라 별도의 고지없이 재결제를 시도합니다.

                        </p>
                        <h5>판매거부</h5>
                        <hr>
                        <p>
                           판매 거래 대기 이후, 1시간 이내 판매 거부 &ensp;<span
                              style="color: #FF4500; font-weight: bold;">5.0%</span>
                        </p>
                        <hr>
                        <p>
                           판매 거래 대기 이후, 1시간 이후 판매 거부 &ensp;<span
                              style="color: #FF4500; font-weight: bold;">10.0%</span>
                        </p>
                        <br> <br>
                        <h5>발송지연</h5>
                        <hr>
                        <p>
                           판매 거래 체결 후, 48시간(일요일・공휴일 제외) 이내 발송 정보 미입력&ensp;&ensp; <span
                              style="color: #FF4500; font-weight: bold;">10.0%</span>
                        </p>
                        <br> <br>
                        <h5>미입고</h5>
                        <hr>
                        <p>
                           발송 정보 입력 후, 5일(일요일・공휴일 제외) 이내검수센터에 미도착 &ensp;&ensp; <span
                              style="color: #FF4500; font-weight: bold;">10.0%</span>
                        </p>
                        <hr>
                        <p>
                           가송장 등 허위 정보 입력 &ensp;&ensp;<span
                              style="color: #FF4500; font-weight: bold;">10.0%</span>
                        </p>
                        <Hr>
                        <p>
                           거래 체결 전 상품 발송&ensp;&ensp;<span
                              style="color: #FF4500; font-weight: bold;">10.0%</span>
                        </p>
                        <br>
                        <p>* 발송 정보 입력 시 지원하지 않는 배송 수단의 경우, 운송장 추적 불가, 도착 상품의 식별 곤란
                           등의 사유로 인해 입고가 불가하며 이에 해당하는 상품은 반송 처리됩니다. * 반송 처리 등 정상적이지 않은 배송
                           방법을 통해 상품을 검수센터로 전달할 경우 상품 입고가 불가능합니다. * 단, 부득이한 경우 발송 정보 입력 기한
                           이내에 고객센터를 통한 협의 및 KREAM의 사전 승인 하에 상품 동일성 식별이 가능하도록 조치한 경우에 한하여
                           상품 입고가 가능한 점 참고 부탁드립니다.</p>

                        <br>
                        <br>
                        <h5>검수기준 악용</h5>
                        <p>아래 검수기준 위반시에는 페널티를 부과합니다. (패키지와 상품 공통 적용)</p>
                        <h6>신발/의류/패션잡화</h6>
                        <hr>
                        <p>
                           상품 불일치 &ensp;&ensp;<span
                              style="color: #FF4500; font-weight: bold;">10.0%</span>
                        </p>
                        <hr>
                        <p>
                           사이즈 불일치 &ensp;&ensp;<span
                              style="color: #FF4500; font-weight: bold;">10.0%</span>
                        </p>
                        <hr>
                        <p>
                           기본 구성품 누락 &ensp;&ensp;<span
                              style="color: #FF4500; font-weight: bold;">10.0%</span>
                        </p>
                        <br>
                        <h6>테크/라이프</h6>
                        <hr>
                        <p>
                           정보 불일치 &ensp;&ensp;<span
                              style="color: #FF4500; font-weight: bold;">10.0%</span>
                        </p>
                        <br><br>
                        <h5>가품, 손상/오염/사용감</h5>
                        <p>일반 거래는 판매가 기준이며, 보관 판매는 판매 상품 모든 사이즈의 전월 평균 거래가 기준입니다.</p>
                        <hr>
                        <p>
                           가품 &ensp;&ensp;<span style="color: #FF4500; font-weight: bold;">15.0%</span>
                        </p>
                        <hr>
                        <p>
                           손상/오염/사용감 &ensp;&ensp;<span
                              style="color: #FF4500; font-weight: bold;">15.0%</span>
                        </p>
                        <h5>페널티 감면 기준</h5>
                        <p>KREAM은 이용약관 제 24조 ("서비스 수수료") 다. 항에 따라 회원이 아래와 같은 특별한 사유에 해당하는 것으로 객관적으로 소명할 경우 기 부과된 페널티를 감경 또는 면제할 수 있습니다.<br><br> 

KREAM은 해당 사안의 사실관계, 이전 사용이력, 거래행태 등을 종합적으로 분석하여 아래 사유에 해당하는지 여부를 최종 판단합니다.<br><br>

 

페널티 감경 또는 면제는 해당 회원의 부주의에도 불구하고 KREAM이 회원의 특별한 사정을 고려하여 예외적으로 실시하는 조치이므로 하기 특별 사유의 존재 여부는 해당 "회원"이 객관적으로 증명해야 할 책임이 있습니다.<br><br>

＊서비스 사용 미숙에 따른 조작실수임이 명백한 경우<br>
＊명백히 택배사의 책임 있는 사유로 인하여 페널티 발생한 경우<br>
＊고의성이 없이 가품 및 손상/오염/사용감 있는 제품을 판매한 것이 명백한 경우 (단, 페널티 감경이 이루어지더라도 가품 및 손상/오염/사용감 있는 제품 판매로 인한 이용정지 등의 절차는 진행될 수 있음)
</p>
                     </div>

                     <p>
                        <a href="#" onclick="toggleContent('content2')">이용정책 내용
                           보기/숨기기 2</a>
                     </p>
                     <div id="content2" class="hidden">
                        <!-- 이용정책 내용 2를 여기에 추가 -->
                        <p>이용정책 내용 2를 여기에 작성합니다.</p>
                     </div>

                     <p>
                        <a href="#" onclick="toggleContent('content3')">이용정책 내용
                           보기/숨기기 3</a>
                     </p>
                     <div id="content3" class="hidden">
                        <!-- 이용정책 내용 3을 여기에 추가 -->
                        <p>이용정책 내용 3을 여기에 작성합니다.</p>
                     </div>
                  </div>
               </div>
               <!-- 페널티 정책 모달 -->
               <div id="modalPenaltyPolicy" class="modal">
                  <div class="modal-content">
                     <span class="close" id="closePenaltyPolicy">&times;</span>
                     <!-- 모달 내용을 추가하세요 -->
                     <h2>페널티 정책</h2>
                     <p>페널티 정책 내용을 여기에 추가합니다.</p>
                  </div>
               </div>

               <!-- 커뮤니티 가이드라인 모달 -->
               <div id="modalCommunityGuidelines" class="modal">
                  <div class="modal-content">
                     <span class="close" id="closeCommunityGuidelines">&times;</span>
                     <!-- 모달 내용을 추가하세요 -->
                     <h2>커뮤니티 가이드라인</h2>
                     <p>커뮤니티 가이드라인 내용을 여기에 추가합니다.</p>
                  </div>
               </div>

               <div class="menu_box">
                  <strong class="menu_title">고객지원</strong>
                  <ul class="menu_list">
                     <!-- <li class="menu_item"><a href="/shop/notice" class="menu_link">공지사항</a></li> -->
                     <li class="menu_item"><a href="/shop/notice" class="menu_link">공지사항</a></li>
                     <li class="menu_item"><a href="#" target="_blank"
                        class="menu_link">서비스 소개</a></li>
                     <li class="menu_item"><a href="/shop/shopmap" target="_self"
                        class="menu_link">스토어 안내</a></li>
                     <li class="menu_item"><a href="#" target="_blank"
                        class="menu_link">판매자 방문접수</a></li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="corporation_area">
            <ul class="term_list">
               <li class="term_item"><a href="#" target="_blank"
                  rel="noopener noreferrer" class="term_link">회사소개</a></li>
               <li class="term_item"><a href="#" target="_blank"
                  rel="noopener noreferrer" class="term_link">인재채용</a></li>
               <li class="term_item" style="display: none;"><a href="#"
                  target="_blank" rel="noopener noreferrer" class="term_link">제휴제안</a></li>
               <li class="term_item"><a href="/shop/TermsOfService"
                  class="term_link">이용약관</a></li>
               <li class="term_item privacy"><a href="/shop/PrivacyPolicy"
                  class="term_link">개인정보처리방침</a></li>
            </ul>
            <br>
            <div class="footer_sns">
               <div class="sns_box">
                  <a href="#" aria-label="인스타그램" class="sns"
                     style="font-size: 21px;"><i class="bi bi-instagram"></i></a> <a
                     href="#" aria-label="페이스북" class="sns" style="font-size: 21px;"><i
                     class="bi bi-facebook"></i></a> <a href="#" aria-label="깃허브"
                     class="sns" style="font-size: 21px;"><i class="bi bi-github"></i></a>
               </div>
            </div>
            <br>
            <div class="business_info">
               <div class="info_list">
                  <dl class="info_item">
                     <dt class="business_title">
                        NUBE 주식회사 · 대표 김김김<br>사업자등록번호 : 000-00-00000 <a href="#">사업자정보확인</a><br>통신판매업
                        : 제 0000-서울종로A-0000호<br>사업장소재지 : 서울시 종로구 돈화문로 26 단성 골드 빌딩
                        4층<br>호스팅 서비스 : 네이버 클라우드 ㈜
                     </dt>
                  </dl>
               </div>
            </div>
         </div>
         <div class="notice_area">
            <p class="notice">NUBE(주)는 통신판매 중개자로서 통신판매의 당사자가 아닙니다. 본 상품은
               개별판매자가 등록한 상품으로 상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다. 단, 이용약관 및
               정책, 기타 거래 체결 과정에서 고지하는 내용 등에 따라 검수하고 보증하는 내용에 대한 책임은 NUBE(주)에 있습니다.</p>
            <p class="copyright">© NUBE Corp.</p>
         </div>
      </div>
   </div>
   <script>
      // 모달 열기 함수
      function openModal(modalId, category) {
         // 모달 요소 가져오기
         var modal = document.getElementById(modalId);
         // body 요소 가져오기
         var body = document.body;

         // 모달 표시
         modal.style.display = "block";
         // body의 스크롤 비활성화
         body.style.overflow = "hidden";

         // 모달 내용을 열 때 스크롤 활성화 (예를 들어, displayCategoryDetails 함수 내에서)
         displayCategoryDetails(category);
      }

      // 모달 닫기 함수
      function closeModal(modalId) {
         // 모달 요소 가져오기
         var modal = document.getElementById(modalId);
         // body 요소 가져오기
         var body = document.body;

         // 모달 숨기기
         modal.style.display = "none";
         // body의 스크롤 활성화
         body.style.overflow = "auto";
      }

      function toggleContent(contentId) {
         var content = document.getElementById(contentId);
         if (content.style.display === "none"
               || content.style.display === "") {
            content.style.display = "block";
         } else {
            content.style.display = "none";
         }
      }
      // 각 메뉴 항목과 모달 창 연결
      document.getElementById("openInspectionCriteria").addEventListener(
            "click", function() {
               // '신발' 내용으로 모달을 열기
               openModal("modalInspectionCriteria", '신발');
            });
      document.getElementById("closeInspectionCriteria").addEventListener(
            "click", function() {
               closeModal("modalInspectionCriteria");
            });

      document.getElementById("openUsagePolicy").addEventListener("click",
            function() {
               openModal("modalUsagePolicy");
            });
      document.getElementById("closeUsagePolicy").addEventListener("click",
            function() {
               closeModal("modalUsagePolicy");
            });

      document.getElementById("openPenaltyPolicy").addEventListener("click",
            function() {
               openModal("modalPenaltyPolicy");
            });
      document.getElementById("closePenaltyPolicy").addEventListener("click",
            function() {
               closeModal("modalPenaltyPolicy");
            });

      document.getElementById("openCommunityGuidelines").addEventListener(
            "click", function() {
               openModal("modalCommunityGuidelines");
            });
      document.getElementById("closeCommunityGuidelines").addEventListener(
            "click", function() {
               closeModal("modalCommunityGuidelines");
            });
   </script>
   <script>
      document.querySelectorAll('.category-link').forEach(function(link) {
         link.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 링크 이벤트를 취소

            // 클릭한 항목의 data-category 속성 값을 가져옴
            var category = link.getAttribute('data-category');

            // 해당 항목의 상세 내용을 표시
            displayCategoryDetails(category);
         });
      });
      function displayCategoryDetails(category) {
         // 여기에서 각 항목에 대한 상세 내용을 설정합니다.
         var detailText = '';

         switch (category) {
         case '신발':
            detailText = ' <strong>[업데이트] 2021/11/29 월<br>[적용일시] 2021/12/03 금 00:00 체결 건 부터</strong><br><br> KREAM의 검수기준은 거래 당사자간 원활한 거래와 보다 균형있는 검수기준 확립을 위해 지속적<br>으로 업데이트 되고 있습니다. 거래에 앞서 최신 검수기준을 참고하시기 바랍니다 <br><br>회원님께서 판매 또는 구매하신 모든 상품은 KREAM의 전문 검수팀이 제품의 컨디션을 꼼<br>꼼하게 확인한 후, 검수 합격 시에만 출고하고 있습니다.<br><br><span style="color: red;">※ 신발 거래 관련 주의사항<br> KREAM은 정가품 판정 및 검수기준에 의한 기본 품질 확인을 수행하고 있으나,<br> 통신판매 중개자로서 제조업체의 제품별 보증에 대해서는 책임을 지지 않습니다.</span><br><br> 제품 기능에 관한 사항이나 기타 제품 관련 질문은 제조업체에 문의하시기 바랍니다.<br>단, 제조업체의 A/S 여부는 보장하지 않습니다. (이용약관 제22조 3항 참고)<br><br>KREAM의 검수기준으로 고지된 사항 이외 아래와 같이 제조사에서 불량으로 인정하지 않는 <br>기준, 또는 당사 검수기준에 따라 그 여부를 명확히 분별할 수 없는 상품의 경우 하자로 판단하지 않<br>으며,이로 인한 구매 취소는 불가하므로 신중한 거래 부탁드립니다.<br><br>＊제조공정, 유통과정 또는 소재 특성 상 발생할 수 있는 사항<br>＊도장, 마킹 등의 제조사 또는 판매처에서 진행되는 사항<br>＊검수 중 발생할 수 있는 사항 (속지, 슈트리 손상 등)<br>＊택배 개봉 또는 적재 및 상품 이동 중 발생할 수 있는 사항 (칼자국, 박스 눌림, 이염 등)<br>＊상품택, 구성품 등의 고리 누락/이탈<br><br>고지드린 검수 기준으로 판정하기 모호한 상품 상태, 비특정적 상품 상태, 특정 모델의 제조<br>공정에 따른 개체차이와 관련하여서는 검수센터 책임자의 최종 판단 하에 결정하게 됩니다.<br><br><strong><h5>불합격/페널티 부과 사항</h5></strong><table><thead><tr> <th>구분</th><th>불합격</th><th>구매자 의사 확인: 합격</th> </tr></thead><tbody><tr>     <td>모조품/가품 상품, 박스, 구성품 등</td><td>○</td><td>-</td>  </tr> <tr>  <td>손상/오염/사용감</td> <td>○</td><td>-</td></tr> <tr>  <td>상품 불일치</td><td>○</td> <td>-</td></tr><tr><td>사이즈 불일치</td> <td>○</td><td>-</td> </tr>  <tr> <td>기본 구성품 누락 (인솔, 기본끈, 박스, 덮개 등)</td><td>○</td><td>-</td></tr></tbody> </table>   <br>※ 손상/오염/사용감 판정의 경우 사용으로 인한 아웃솔 마모, 오염, 수선/보강, 페인팅 등의 기준<br>을 종합하여 검수원과 검수센터 책임자의 최종 판단하에 결정하게 됩니다. ';
            break;
         case '아우터상의하의':
            detailText = '<strong>[업데이트] 2021/12/06 월<br>[적용일시] 2021/12/10 금 00:00 체결 건 부터</strong><br><br>KREAM의 검수기준은 거래 당사자간 원활한 거래와 보다 균형있는 검수기준 확립을 위해지속적으로 업데이트 되고 있습니다. 거래에 앞서 최신 검수기준을 참고하시기 바랍니다.<br><br>회원님께서 판매 또는 구매하신 모든 상품은 KREAM의 전문 검수팀이 제품의 컨디션을 꼼꼼하게 확인한 후, 검수 합격 시에만 출고하고 있습니다.<br><br><span style="color: red;">※ 아우터 · 상의 · 하의 거래 주의사항<BR>KREAM은 정가품 판정 및 검수기준에 의한 기본 품질 확인을 수행하고 있으나, 통신판매 중<BR>개자로서 제조업체의 제품별 보증에 대해서는 책임을 지지 않습니다.<br><br>제품 기능에 관한 사항이나 기타 제품 관련 질문은 제조업체에 문의하시기 바랍니다.<br>단, 제조업체의 A/S 여부는 보장하지 않습니다. (이용약관 제22조 3항 참고)<br><br>KREAM에서 검수를 진행하는 모든 제품은 검수 과정 중 밀봉 및 실링된 포장을 개봉합니다.<br><br>판매자 - 판매하신 제품의 검수를 위해 제품의 밀봉 및 실링은 모두 개봉되며 검수 탈락되어<br> 상품이 반송될 경우 포장이 개봉된 상태로 배송됩니다.<br><br>구매자 - 검수 진행 중 밀봉 및 실링은 모두 개봉되며, KREAM 패키지로 포장되어 발송해 드립니다.<br><br>* 기존 제품의 오리지널 폴리백의 경우 포함되지 않을 수 있습니다.</span><br><br>KREAM의 검수기준으로 고지된 사항 이외 아래와 같이 제조사에서 불량으로 인정하지 않는<br> 기준, 또는 당사 검수기준에 따라 그 여부를 명확히 분별할 수 없는 상품의 경우 하자로 판단<br>하지 않으며,이로 인한 구매 취소는 불가하므로 신중한 거래 부탁드립니다.<br><br>상품택, 구성품 등의 고리 누락/이탈<br>제조공정, 유통과정 또는 소재 특성 상 발생할 수 있는 사항<br><br>고지드린 검수 기준으로 판정하기 모호한 상품 상태, 비특정적 상품 상태, 특정 모델의 제조<br>공정에 따른 개체차이와 관련하여서는 검수센터 책임자의 최종 판단 하에 결정하게 됩니다.<br><br>   KREAM의 검수기준에 동의하지 않으실 경우 거래가 불가하오니 거래 당사자는 거래에 앞서<br> KREAM의 검수기준을 반드시 검토하시기 바랍니다.<br><br> <table><thead><tr> <th>구분</th><th>불합격</th><th>구매자 의사 확인: 합격</th> </tr></thead><tbody><tr>     <td>모조품/가품 상품, 박스, 구성품 등</td><td>○</td><td>-</td>  </tr> <tr>  <td>손상/오염/사용감</td> <td>○</td><td>-</td></tr> <tr>  <td>상품 불일치</td><td>○</td> <td>-</td></tr><tr><td>사이즈 불일치</td> <td>○</td><td>-</td> </tr>  <tr> <td>기본 구성품 누락 (인솔, 기본끈, 박스, 덮개 등)</td><td>○</td><td>-</td></tr></tbody> </table>';

            break;
         case '가방시계지갑패션잡화':
            detailText = ' <strong>[업데이트] 2021/11/29 월<br>[적용일시] 2021/12/03 금 00:00 체결 건 부터.</strong><br><br>KREAM의 검수기준은 거래 당사자간 원활한 거래와 보다 균형있는 검수기준 확립을 위해  지속적으로 업데이트 되고 있습니다. 거래에 앞서 최신 검수기준을 참고하시기 바랍니다.<br><br>회원님께서 판매 또는 구매하신 모든 상품은 KREAM의 전문 검수팀이 제품의 컨디션을 꼼꼼하게 확인한 후, 검수 합격 시에만 출고하고 있습니다.<br><br><span style="color: red;">※ 가방 · 시계 · 지갑 · 패션잡화 거래 주의사항<Br>KREAM은 정가품 판정 및 검수기준에 의한 기본 품질 확인을 수행하고 있으나, 통신판매 중<br>개자로서 제조업체의 제품별 보증에 대해서는 책임을 지지 않습니다.<br>제품 기능에 관한 사항이나 기타 제품 관련 질문은 제조업체에 문의하시기 바랍니다.<br>단, 제조업체의 A/S 여부는 보장하지 않습니다. (이용약관 제22조 3항 참고)</span><br><br>KREAM의 검수기준으로 고지된 사항 이외 아래와 같이 제조사에서 불량으로 인정하지 않는 <br>기준, 또는 당사 검수기준에 따라 그 여부를 명확히 분별할 수 없는 상품의 경우 하자로 판단<br>하지 않으며,이로 인한 구매 취소는 불가하므로 신중한 거래 부탁드립니다.<br><br>＊상상품택, 구성품 등의 고리 이탈<br>＊제조공정, 유통과정 또는 소재 특성 상 발생할 수 있는 사항<br><br>고지드린 검수 기준으로 판정하기 모호한 상품 상태, 비특정적 상품 상태, 특정 모델의 제조<br>공정에 따른 개체차이와 관련하여서는 검수센터 책임자의 최종 판단 하에 결정하게 됩니다.<br><br>KREAM의 검수기준에 동의하지 않으실 경우 거래가 불가하오니 거래 당사자는 거래에 앞서<br> KREAM의 검수기준을 반드시 검토하시기 바랍니다.<br><br><strong><h5>불합격/페널티 부과 사항</h5></strong><table><thead><tr> <th>구분</th><th>불합격</th><th>구매자 의사 확인: 합격</th> </tr></thead><tbody><tr>     <td>모조품/가품 상품, 박스, 구성품 등</td><td>○</td><td>-</td>  </tr> <tr>  <td>손상/오염/사용감</td> <td>○</td><td>-</td></tr> <tr>  <td>상품 불일치</td><td>○</td> <td>-</td></tr><tr><td>사이즈 불일치</td> <td>○</td><td>-</td> </tr>  <tr> <td>기본 구성품 누락 (인솔, 기본끈, 박스, 덮개 등)</td><td>○</td><td>-</td></tr></tbody> </table>※ 손상/오염/사용감 판정의 경우 사용으로 인한 소재 변형, 오염, 주름, 스크래치 등의 기준을 종합하여 검수원과 검<br>수센터 책임자의 최종 판단하에 결정하게 됩니다.';
            break;
         case '테크':
            detailText = '<strong>[업데이트]2023/02/21 화<br>[적용일시] 2023/02/28 화 00:00 체결 건 부터</strong><br><br>KREAM의 검수기준은 거래 당사자간 원활한 거래와 보다 균형있는 검수기준 확립을 위해 지속적으로 업데이트 되고 있습니다. 거래에 앞서 최신 검수기준을 참고하시기 바랍니다.<br><br>회원님께서 판매 또는 구매하신 모든 상품은 KREAM의 전문 검수팀이 제품의 컨디션을 꼼꼼하게 확인한 후, 검수 합격 시에만 출고하고 있습니다.<br><br><span style="color: red;">※ 전자기기 상품 거래 관련 주의사항<br>KREAM은 정가품 판정 및 검수기준에 의한 기본 품질 확인을 수행하고 있으나, 통신판매 중개자로서 제조업체의 제품별 보증에 대해서는 책임을 지지 않습니다.<br><br>제품 기능에 관한 사항이나 기타 제품 관련 질문은 제조업체에 문의하시기 바랍니다.<br>단, 제조업체의 A/S 여부는 보장하지 않습니다. (이용약관 제22조 3항 참고)<br><br>실링/밀봉 패키지 개봉 시 가치가 하락할 수 있는 상품의 경우 내용물은 검수하지 않습니다.<br>상품 정보 확인, 박스 상태 점검 및 재포장 흔적 유무에 대한 다방면 검수가 진행됩니다.<br><br>미사용 상태 유지를 위해 정상작동 여부는 확인이 불가합니다.</span><br><br>KREAM의 검수기준으로 고지된 사항 이외 아래와 같이 제조사에서 불량으로 인정하지 않는<br> 기준, 또는 당사 검수기준에 따라 그 여부를 명확히 분별할 수 없는 상품의 경우 하자로 판단<br>하지 않으며, 이로 인한 구매취소는 불가하므로 신중한 거래 부탁드립니다.<br><br>＊유통 및 보관과정에서 발생할 수 있는 실링의 변형 혹은 교체<br>＊제조공정, 유통과정 또는 소재 특성 상 발생할 수 있는 사항<br><br>고지드린 검수 기준으로 판정하기 모호한 상품 상태, 비특정적 상품 상태, 특정 모델의 제조공정에 따른 개체차이와 관련하여서는 검수센터 책임자의 최종 판단 하에 결정하게 됩니다.<br><br>KREAM의 검수기준에 동의하지 않으실 경우 거래가 불가하오니 거래 당사자는 거래에 앞서 KREAM의 검수기준을 반드시 검토하시기 바랍니다.<br><br><table border="1"> <thead> <tr> <th>구분</th> <th>불합격</th><th>구매자 의사 확인</th> <th>합격</th>  </tr></thead>  <tbody><tr> <td>모조품/가품<br>상품, 박스, 구성품 등</td> <td>○</td><td>-</td><td>-</td></tr><tr> <td>손상/오염/사용감</td><td>○</td> <td>-</td><td>-</td> </tr><tr> <td>정보 불일치<br>품번, 상품 등</td><td>○</td> <td>-</td> <td>-</td>   </tr><tr> <td>기본 구성품 누락<br>본품, 컨트롤러, 충전 독, 전원 케이블 등</td><td>○</td> <td>-</td>  <td>-</td>  </tr> </tbody>      </table>※ 손상/오염/사용감 판정의 경우 제품 외관 컨디션, 사용으로 인한 오염 등의 기준을 종합하여 검수원과 검수센터 책<br>임자의 최종 판단하에 결정하게 됩니다.';
            break;
         case '뷰티컬렉터블캠핑가구리빙':
            detailText = '<strong>[업데이트]2023/02/21 화<br>[적용일시] 2023/02/28 화 00:00 체결 건 부터</strong><br><br>KREAM의 검수기준은 거래 당사자간 원활한 거래와 보다 균형있는 검수기준 확립을 위해 지속적으로 업데이트 되고 있습니다. 거래에 앞서 최신 검수기준을 참고하시기 바랍니다.<br><br>회원님께서 판매 또는 구매하신 모든 상품은 KREAM의 전문 검수팀이 제품의 컨디션을 꼼꼼하게 확인한 후, 검수 합격 시에만 출고하고 있습니다.<br><br><span style="color: red;">※ 뷰티 · 컬렉터블 · 캠핑 · 가구/리빙 거래 주의사항<BR>KREAM은 정가품 판정 및 검수기준에 의한 기본 품질 확인을 수행하고 있으나, 통신판매 중개자로서 제조업체의 제품별 보증에 대해서는 책임을 지지 않습니다.<br><br>제품 기능에 관한 사항이나 기타 제품 관련 질문은 제조업체에 문의하시기 바랍니다.<br>단, 제조업체의 A/S 여부는 보장하지 않습니다. (이용약관 제22조 3항 참고)<br><br>실링/밀봉 패키지 개봉 시 가치가 하락할 수 있는 상품의 경우 내용물은 검수하지 않습니다.</span><br><br>KREAM의 검수기준으로 고지된 사항 이외 아래와 같이 제조사에서 불량으로 인정하지 않는 기준, 또는 당사 검수기준에 따라 그 여부를 명확히 분별할 수 없는 상품의 경우 하자로 판단하지 않으며,이로 인한 구매 취소는 불가하므로 신중한 거래 부탁드립니다.<br><br>＊유통 및 보관과정에서 발생할 수 있는 실링의 변형 혹은 교체<br>＊제조공정, 유통과정 또는 소재 특성 상 발생할 수 있는 사항<br><br>고지드린 검수 기준으로 판정하기 모호한 상품 상태, 비특정적 상품 상태, 특정 모델의 제조<br>공정에 따른 개체차이와 관련하여서는 검수센터 책임자의 최종 판단 하에 결정하게 됩니다<br><br>KREAM의 검수기준에 동의하지 않으실 경우 거래가 불가하오니 거래 당사자는 거래에 앞서<br> KREAM의 검수기준을 반드시 검토하시기 바랍니다.<br><br><table border="1"> <thead> <tr> <th>구분</th> <th>불합격</th><th>구매자 의사 확인</th> <th>합격</th>  </tr></thead>  <tbody><tr> <td>모조품/가품<br>상품, 박스, 구성품 등</td> <td>○</td><td>-</td><td>-</td></tr><tr> <td>손상/오염/사용감</td><td>○</td> <td>-</td><td>-</td> </tr><tr> <td>정보 불일치<br>품번, 상품 등</td><td>○</td> <td>-</td> <td>-</td>  </tbody>      </table>';
            break;
         case '프리미엄시계':
            detailText = '<strong>[업데이트]2022/06/24 금<br>[적용일시]  2022/07/01 금 00:00 체결 건 부터</strong><br><br>KREAM의 검수기준은 거래 당사자간 원활한 거래와 보다 균형있는 검수기준 확립을 위해 지속적으로 업데이트 되고 있습니다. 거래에 앞서 최신 검수기준을 참고하시기 바랍니다.<br><br>회원님께서 판매 또는 구매하신 모든 상품은 KREAM의 전문 검수팀이 제품의 컨디션을 꼼꼼하게 확인한 후, 검수 합격 시에만 출고하고 있습니다.<br><br>* 구매처에서 수령한 뒤 바로 판매하신 새상품이더라도 당사 검수 기준에 따라 구매자의 의사를 확인할 수 있습니다.<br><br><span style="color: red;">※ 시계 거래 관련 주의사항<br>KREAM은 정가품 판정 및 검수기준에 의한 기본 품질 확인을 수행하고 있으나, 통신판매 중개자로서 제조업체의 제품별 보증에 대해서는 책임을 지지 않습니다.<br><br>제품 기능에 관한 사항이나 기타 제품 관련 질문은 제조업체에 문의하시기 바랍니다.<br>단, 제조업체의 A/S 여부는 보장하지 않습니다. (이용약관 제22조 3항 참고)</span><br><br>KREAM의 검수기준으로 고지된 사항 이외 아래와 같이 제조사에서 불량으로 인정하지 않는<br> 기준, 또는 당사 검수기준에 따라 그 여부를 명확히 분별할 수 없는 상품의 경우 하자로 판단<br>하지 않으며,이로 인한 구매 취소는 불가하므로 신중한 거래 부탁드립니다.<br><br>＊제조공정, 유통과정 또는 소재 특성 상 발생할 수 있는 사항고지드린 검수 기준으로 판정하기 모호한 상품 상태, 비특정적 상품 상태, 특정 모델의 제조<br>공정에 따른 개체차이와 관련하여서는 검수센터 책임자의 최종 판단 하에 결정하게 됩니다.<br><br>KREAM의 검수기준에 동의하지 않으실 경우 거래가 불가하오니 거래 당사자는 거래에 앞서<br> KREAM의 검수기준을 반드시 검토하시기 바랍니다.<br><br><table border="1"> <thead> <tr> <th>구분</th> <th>불합격</th><th>구매자 의사 확인</th> <th>합격</th>  </tr></thead>  <tbody><tr> <td>모조품/가품<br>상품, 박스, 구성품 등</td> <td>○</td><td>-</td><td>-</td></tr><tr> <td>손상/오염/사용감</td><td>○</td> <td>-</td><td>-</td> </tr> </tbody>      </table>';
            break;
         case '프리미엄가방':
            detailText = '<strong>[업데이트]2021/12/06 월<br>[적용일시]  2021/12/10 금 00:00 체결 건 부터</strong><br><br>KREAM의 검수기준은 거래 당사자간 원활한 거래와 보다 균형있는 검수기준 확립을 위해 지속적으로 업데이트 되고 있습니다. 거래에 앞서 최신 검수기준을 참고하시기 바랍니다.<br><br>회원님께서 판매 또는 구매하신 모든 상품은 KREAM의 전문 검수팀이 제품의 컨디션을 꼼꼼하게 확인한 후, 검수 합격 시에만 출고하고 있습니다.<br><br>* 구매처에서 수령한 뒤 바로 판매하신 새상품이더라도 당사 검수 기준에 따라 구매자의 의사를 확인할 수 있습니다.<br><br><span style="color: red;">※ 가방 거래 관련 주의사항<br>KREAM은 정가품 판정 및 검수기준에 의한 기본 품질 확인을 수행하고 있으나, 통신판매 중개자로서 제조업체의 제품별 보증에 대해서는 책임을 지지 않습니다.<br><br>제품 기능에 관한 사항이나 기타 제품 관련 질문은 제조업체에 문의하시기 바랍니다.<br>단, 제조업체의 A/S 여부는 보장하지 않습니다. (이용약관 제22조 3항 참고)</span><br><br>KREAM의 검수기준으로 고지된 사항 이외 아래와 같이 제조사에서 불량으로 인정하지 않는<br> 기준, 또는 당사 검수기준에 따라 그 여부를 명확히 분별할 수 없는 상품의 경우 하자로 판단<br>하지 않으며,이로 인한 구매 취소는 불가하므로 신중한 거래 부탁드립니다.<br><br>＊제조공정, 유통과정 또는 소재 특성 상 발생할 수 있는 사항고지드린 검수 기준으로 판정하기 모호한 상품 상태, 비특정적 상품 상태, 특정 모델의 제조<br>공정에 따른 개체차이와 관련하여서는 검수센터 책임자의 최종 판단 하에 결정하게 됩니다.<br><br>KREAM의 검수기준에 동의하지 않으실 경우 거래가 불가하오니 거래 당사자는 거래에 앞서<br> KREAM의 검수기준을 반드시 검토하시기 바랍니다.<br><br><table border="1"> <thead> <tr> <th>구분</th> <th>불합격</th><th>구매자 의사 확인</th> <th>합격</th>  </tr></thead>  <tbody><tr> <td>모조품/가품<br>상품, 박스, 구성품 등</td> <td>○</td><td>-</td><td>-</td></tr><tr> <td>손상/오염/사용감</td><td>○</td> <td>-</td><td>-</td> </tr> </tbody>      </table>';
            break;
         break;
      // 추가적인 카테고리에 대한 내용을 여기에 추가
      default:
         detailText = '해당 카테고리의 상세 내용이 준비되지 않았습니다.';
      }

      // 상세 내용을 모달 창에 표시
      var detailElement = document.getElementById('modalInspectionCriteria')
            .querySelector('.category-content');
      detailElement.innerHTML = '<p>' + detailText + '</p';
   }
   </script>
   
   <script>
     var selectedCell = null; // 현재 선택한 셀을 추적하기 위한 변수

   // JavaScript로 각 테이블 셀에 클릭 이벤트 리스너 추가
   var cells = document.querySelectorAll('.category-link');

   cells.forEach(function(cell) {
      cell.addEventListener('click', function() {
         // 이전에 선택한 셀이 있다면 'selected' 클래스를 제거
         if (selectedCell && selectedCell !== cell) {
            selectedCell.classList.remove('selected');
         }

         // 현재 선택한 셀에 'selected' 클래스 추가
         cell.classList.add('selected');

         // 현재 선택한 셀을 selectedCell로 설정
         selectedCell = cell;
      });
   }); 
   </script>
</body>
</html>