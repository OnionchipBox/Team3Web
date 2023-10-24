<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보처리방침</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
        }

        header {
            text-align: center;
        }

        .container {
             max-width: 800px;
             
    margin: 20px auto;
     background-color: white;
    padding: 20px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    text-align: center; /* 텍스트를 가로 중앙으로 정렬 */
        }

        h1 {
            font-size: 24px;
            text-align: center;
        }

        p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        ul {
            list-style-type: disc;
            margin-left: 30px;
        }

        ol {
            list-style-type: decimal;
            margin-left: 30px;
        }

        h5 {
            font-weight: bold;
        }
           table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
       <jsp:include page="header.jsp" />
    <div class="container">
        <!-- 여기에 개인정보처리방침 내용을 추가하세요. -->
        <h5>제 1 조 (개인정보 수집 항목)</h5>
        <p>제1조 (개인정보의 처리목적)
 
회사는 다음의 목적을 위하여 개인정보를 처리하며, 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않습니다. 이용 목적이 변경되는 경우에는 ｢개인정보 보호법｣ 에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
또한 회사는 만 14세 이상의 이용자를 대상으로 서비스를 제공하며, 만 14세 미만 아동의 개인정보가 수집된 사실을 인지하는 경우 해당 정보를 지체없이 삭제하겠습니다.
 
1. 회원 가입 및 관리
회원 가입의사 확인과 회원제 서비스 제공에 따른 회원자격 유지 및 관리, 서비스 부정이용 방지, 각종 고지와 통지, 고충처리 목적으로 개인정보를 처리합니다.
 
2. 서비스 제공
서비스 및 콘텐츠, 광고를 포함한 맞춤형 서비스 제공을 목적으로 개인정보를 처리합니다.
 
3. 고충처리
이용자의 신원 확인, 문의사항 확인, 사실조사를 위한 연락, 통지, 처리결과 통보의 목적으로 개인정보를 처리합니다.</p>

        <h5>제 2 조 (개인정보의 수집 및 이용목적)</h5>
        <p> 
① 회사는 법령에 명시되어 있거나 이용자로부터 개인정보 수집 시 동의 받은 개인정보의 보유 및 이용기간 내에서 개인정보를 처리 및 보유합니다.
 
② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
 <
1. 회원 가입 및 관리: 회원 탈퇴 시까지
다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료 시까지
1) 관계 법령 위반에 따른 수사, 조사 등이 진행 중인 경우에는 해당 수사, 조사 종료 시까지
2) 서비스 이용에 따른 채권, 채무관계 잔존 시에는 해당 채권, 채무관계 정산 시까지
 
2. 서비스 제공: 서비스 공급 완료 또는 서비스 이용 종료 시까지
다만, 다음의 사유에 해당하는 경우에는 내부 기준에 따른  보관기간 종료 시까지
1) 부정이용 방지를 위해 정보(이름, 이메일(로그인ID), 휴대전화번호, CI/DI): 3년
2) 이벤트 진행 및 경품 배송, 제세공과금 처리를 위해 정보 (이름, 주소, 휴대전화번호): 3개월
3) 거래처 등록 및 대금 지급을 위한 정보 (거래처 등록서류, 입금계좌 정보): 정보 확인 및 거래처 등록 후 3개월
 

3. 고충처리: 고충 처리 완료 시까지
다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료 시까지
</p>
    <table>
        <tr>
            <th>관련 법령</th>
            <th>수집 정보</th>
            <th>보유 기간</th>
        </tr>
        <tr>
            <td>통신비밀보호법</td>
            <td>서비스 이용 관련 정보(접속로그)</td>
            <td>3개월</td>
        </tr>
        <tr>
            <td>전자상거래 등에서의 소비자 보호에 관한 법률</td>
            <td>소비자의 불만 또는 분쟁처리에 관한 기록</td>
            <td>3년</td>
        </tr>
        <tr>
            <td rowspan="2">전자상거래 등에서의 소비자 보호에 관한 법률</td>
            <td>계약 또는 청약철회 등에 관한 기록</td>
            <td>5년</td>
        </tr>
        <tr>
            <td>대금결제 및 재화 등의 공급에 관한 기록</td>
            <td>5년</td>
        </tr>
    </table>

        <h5>제 3 조 (개인정보의 보유 및 이용기간)</h5>
<p>① 회사는 이용자의 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 법령에 명시된 경우에만 개인정보를 제3자에게 제공합니다.
 
② KREAM은 거래 중개 플랫폼으로써 등록된 제품의 거래가 체결된 경우, 당사자간 원활한 의사소통 및 배송, 상담 등 거래 이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 당사자에게 제공합니다.
이를 제외하고 제3자에게 이용자의 개인정보를 제공하게 될 경우 이용자에게 동의를 받겠습니다. </p>
   <table>
        <tr>
            <th>제공받는 자</th>
            <th>제공하는 개인정보 항목</th>
            <th>제공받는 자의 이용 목적</th>
            <th>제공받는 자의 보유 및 이용기간</th>
        </tr>
        <tr>
            <td>KREAM에 등록된 판매자</td>
            <td>KREAM ID(이메일), 이름, 휴대전화 번호, 상품 구매 정보, 주소</td>
            <td>상품 구매자 확인 및 상품 배송, 고객 상담 및 불만 처리, 환불 처리</td>
            <td>상품 배송 후 90일</td>
        </tr>
    </table>
    <H5>제4조 (개인정보처리의 위탁)</H5>
<p>① 회사는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</p>
  <table>
        <tr>
            <th>수탁업체</th>
            <th>위탁하는 업무내용</th>
            <th>개인정보의 보유 및 이용기간</th>
        </tr>
        <tr>
            <td>네이버클라우드㈜ NIT Service㈜</td>
            <td>서비스 제공을 위한 시스템 개발 및 운영</td>
            <td>회원 탈퇴 시 또는 위탁계약 종료 시</td>
        </tr>
        <tr>
            <td>(주)다날 네이버파이낸셜(주) NHN한국사이버결제(주) (주)카카오페이 (주)비바리퍼블리카 토스페이먼츠(주) (주)코리아포트원</td>
            <td>이용자 결제 대행 및 간편 결제 서비스 제공</td>
            <td>간편 결제 연동</td>
        </tr>
        <tr>
            <td>(주)케이지모빌리언스</td>
            <td>본인인증 및 실명확인</td>
            <td></td>
        </tr>
        <tr>
            <td>CJ대한통운(주) 로젠(주) (주)발렉스특수물류</td>
            <td>상품 배송</td>
            <td></td>
        </tr>
        <tr>
            <td>(주)굿스플로</td>
            <td>택배 송장 출력 및 반품 접수</td>
            <td></td>
        </tr>
        <tr>
            <td>(주)써머스플랫폼</td>
            <td>알림톡 발송 및 배송조회</td>
            <td></td>
        </tr>
        <tr>
            <td>엔에이치엔(주)</td>
            <td>고객 상담 시스템 제공</td>
            <td></td>
        </tr>
        <tr>
            <td>(주)브리지텍</td>
            <td>고객 상담 시스템 운영</td>
            <td></td>
        </tr>
        <tr>
            <td>페이머스스튜디오(주)</td>
            <td>고객 상담 및 서비스 운영</td>
            <td></td>
        </tr>
        <tr>
            <td>(주)딜리버스</td>
            <td>판매자 상품 픽업 서비스 업무 처리</td>
            <td></td>
        </tr>
        <tr>
            <td>(주)에이비일팔공</td>
            <td>서비스 이용 로그 수집</td>
            <td></td>
        </tr>
    </table>
    <p>
② 개인정보 처리위탁 중 국외법인에서 처리하는 위탁업무는 없습니다.
 
③ 회사는 위탁계약 체결 시 ｢개인정보 보호법｣에 따라 위탁업무 수행목적 외 개인정보 처리금지, 안전성 확보조치, 재위탁 제한, 수탁자에 대한 관리・감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.
 
④ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</p>

<H5>  
제5조 (이용자와 법정대리인의 권리・의무 및 행사방법)</H5>
<p> ① 이용자는 회사에 대해 언제든지 개인정보 열람, 정정, 삭제, 처리정지 요구 등의 권리를 행사할 수 있습니다.
다만, 판매자센터의 경우, 회원가입 시 수집되는 ID(이메일)와 비밀번호, 로그인 관련 정보 이외의 정보는 KREAM(https://kream.co.kr)에서 정정과 삭제가 가능합니다.

1. 개인정보 열람: 판매자센터 > 해당 메뉴 선택 시

판매자 정보: 이메일주소, 비밀번호, 휴대폰 번호
거래 정보: 반송 주소, 결제 카드 정보, 은행, 계좌번호

2. 개인정보 정정: 판매자센터 > 해당 메뉴 선택 시

비밀번호 변경: 비밀번호

3. KREAM에서 연동된 정보 이외의 판매자센터 로그인 정보의 정정 및 삭제

KREAM 1:1 문의 또는 고객센터(1588-7813, help@kream.co.kr) 문의

② 개인정보 열람 및 처리정지 요구는 개인정보보호법에 의하여 이용자의 권리가 제한될 수 있습니다.
 
③ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.
 
④ 회사는 이용자 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인할 수 있습니다.
 
⑤ 제4항에 따른 권리행사 주체가 대리인(이용자의 법정대리인이나 위임을 받은 자)인 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
 </p>
 <h5>제6조 (처리하는 개인정보 항목)</h5>
<p> 
① 회사는 다음의 개인정보 항목을 처리하고 있습니다.</p>
 <table>
        <tr>
            <th>구분</th>
            <th>수집·이용목적</th>
            <th>필수/선택</th>
            <th>수집 및 이용 항목</th>
        </tr>
        <tr>
            <td>로그인</td>
            <td>회원가입</td>
            <td>필수</td>
            <td>ID(이메일), 비밀번호</td>
        </tr>
        <tr>
            <td>NAVER</td>
            <td>이용자 고유 식별자, ID(이메일)</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>APPLE</td>
            <td>이용자 고유 식별자, ID(이메일)</td>
            <td>선택</td>
            <td>신발 사이즈</td>
        </tr>
        <tr>
            <td>본인 확인</td>
            <td>이용자 본인 확인</td>
            <td>필수</td>
            <td>이름, 생년월일, 성별, DI, CI, 휴대전화번호, 내・외국인 정보</td>
        </tr>
        <tr>
            <td>프로필</td>
            <td>프로필 관리</td>
            <td>선택</td>
            <td>프로필 이미지</td>
        </tr>
        <!-- 나머지 항목 추가 -->
    </table>

        <!-- 필요한 내용 계속해서 추가 -->
<p>② 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.

IP주소, 쿠키, 서비스 이용기록, 메타 데이터
 
③ 서비스 이용과정에서 개인정보는 아니지만 아래의 정보가 생성되어 수집될 수 있습니다.

광고식별자, 방문기록, 기기 정보(유형, 모델명, OS 버전, APP 버전, 기기 식별자, 언어 및 국가)
 </p>
 <h5>제7조 (개인정보의 파기)
 </h5>
 <p>① 회사는 이용자로부터 동의 받은 개인정보의 보유기간이 경과하거나 처리목적을 달성하여 더 이상 개인정보가 필요하지 않게 된 경우 지체없이 해당 개인정보를 파기합니다.
 
② 제1항 해당됨에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다. (법령에 따른 보관 기간은 제2조를 참조하시기 바랍니다)
 
③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.
 
1. 파기절차
1) 개인정보 도용 등으로 인한 피해 발생 시 복구와 피해자 보호 등을 위하여 회원가입 시 수집한 개인정보를 14일 동안 임시로 보관할 수 있습니다.
2) 회사는 파기 사유가 발생한 개인정보를 선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.
 
2. 파기방법
1) 전자적 파일의 형태: 복구 및 재생이 되지 않도록 기술적인 방법 이용
2) 종이 문서: 분쇄기로 분쇄하거나 소각
 </p>
 <h5>제8조 (개인정보의 안전성 확보조치)</h5>
 <p> 
회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.
 
1. 관리적 조치
내부관리계획 수립 및 시행, 정기적 임직원 교육, 정기적인 접속기록 점검, 수탁사 점검 등
 
2. 기술적 조치
개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 내부 관리계획에 따른 암호화 (전송구간 및 저장 시), 보안프로그램 설치
 
3. 물리적 조치
데이터센터, 자료보관실 등의 접근통제
 
 </p>
 <h5>제9조 (개인정보 자동 수집 장치의 설치・운영 및 거부에 관한 사항)</h5>
 <p> 
회사는 이용자들에게 적합하고 보다 유용한 서비스를 제공하기 위해서 이용자의 쿠키(Cookie)와 분석 소프트웨어를 사용하고 있습니다.
 
① 쿠키는 웹사이트를 운영하는데 이용되는 서버(https)가 이용자의 컴퓨터 브라우저에 보내는 소량의 정보이며 이용자들의 기기 내 저장공간에 저장되기도 합니다.
 
1. 쿠키의 사용목적
이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부 등을 파악하여 이용자에게 최적화된 정보를 제공하기 위해 사용됩니다.
 
2. 쿠키의 설치∙운영 및 거부

Internet Explorer: [도구>인터넷 옵션>개인정보>고급]에서 쿠키의 사용 거부
MS Edge: 웹 브라우저 상단의 “설정 및 기타” > “설정” > “쿠키 및 사이트 권한” > 쿠키 및 저장된 데이터 등에 관한 개인 설정 입력
Chrome: [설정>개인정보 및 보안>쿠키 및 기타 사이트 데이터>일반 설정]에서 쿠키의 사용 거부
Android: [설정->인터넷 설정>개인정보 보호 및 보안>기타] 에서 “쿠키 허용” 거부
iOS: [설정>Safari>개인정보 보호 및 보안]에서 “모든 쿠키 차단” 선택  

3. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.
 
② 분석 소프트웨어는 이용자가 웹 사이트를 방문하거나 모바일 서비스를 이용할 때 자동으로 생성되는 정보를 분석하기 위해 사용되며, 이용자는 이를 거부할 수 있습니다.

Internet Explorer: 웹 브라우저 상단의 “도구” > “안전” > “Do Not Track 요청 켜기” 선택
MS Edge: 웹 브라우저 상단의 “설정 및 기타” > “설정” > “개인정보, 검색 및 서비스” > “추적 방지” 끄기 또는 “개인정보” > “추적 안 함” 요청 보내기 선택
Chrome: [설정>개인정보 및 보안>쿠키 및 기타 사이트 데이터>일반 설정]에서 탐색 트래픽과 함께 '추적 안함' 요청 선택
Android: [설정->인터넷 설정>개인정보 보호 및 보안] 에서 “스마트 추적 방지” 또는 “사이트에서 추적하지 못하도록 요청” 선택
iOS: [설정->개인정보 보호-> 추적]에서 “앱이 추척을 요청하도록 허용” 선택 해제</p>
    </div>

    <footer>
        <!-- 여기에 푸터 내용을 추가하세요. -->
    </footer>
    
 <a href="#site-header" id="top">
    <img src="<%=request.getContextPath()%>/resources/img/icon/top.png" alt="TOP" width="50px"height="50px">
</a>

<style>
#top { position: fixed; bottom: 3rem; right: 2rem; ;
      border-radius:50%;        
 color:white;
    background-color: black;
 /* 이미지 파일 경로를 지정합니다. */
 background-size: 20px; /* 이미지의 가로 및 세로 크기를 50px로 지정 */
    background-repeat: no-repeat;
    background-position: center center;
   }
   </style>
    <script>
document.addEventListener("DOMContentLoaded", function () {
    let Top = document.querySelector('#top');
    
    window.addEventListener('scroll', function () {
        if (window.scrollY > 200) {
            Top.classList.add('on');
        } else {
            Top.classList.remove('on');
        }
    });

    Top.addEventListener('click', function (e) {
        e.preventDefault();
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
});
</script>
</body>
</html>