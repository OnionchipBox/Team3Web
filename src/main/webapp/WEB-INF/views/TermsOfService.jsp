<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이용약관</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;;
        }

        header {
        
        
            text-align: center;
          
        }

        .container {
            max-width: 800px;
        
            margin: 20px auto;
            background-color: white;;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
               
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
    </style>
</head>
<body>
    <header>
       <jsp:include page="header.jsp" />
        <h1>이용약관</h1>
    </header>
    <div class="container">
        <h5>제 1 조 (목적)</h5>
        <p>이 약관은 "회원" 개인 상호 간 또는 “제휴 사업자”, "입점 사업자"와 “회원” 개인 간에 상품 등을 매매하는 것을 중개하고, "상품" 등에 관한 정보를 상호 교환할 수 있도록 크림 주식회사(이하 "회사"라 합니다)가 운영, 제공하는 KREAM 서비스(이하 "서비스")에 대한 것으로 본 약관에서는 "서비스"의 이용과 관련하여 "회사"와 "회원"과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정합니다.</p>

        <h5>제 2 조 (용어의 정의)</h5>
       <p> 이 약관에서 사용하는 용어의 정의는 다음 각 호와 같으며, 정의되지 않은 용어에 대한 해석은 관계 법령 및 지침, 본 이용약관, 개인정보취급방침, 상관례 등에 의합니다.

"서비스"라 함은 회사가 PC 및/또는 모바일 환경에서 제공하는 KREAM 서비스 및 관련 제반 서비스를 말합니다.
"회원"이라 함은 "회사"의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
"구매자" 또는 "구매회원"이라 함은 "상품"을 구매하거나 또는 구매할 의사로 서비스를 이용하는 회원을 말합니다.
"판매자" 또는 "판매회원"이라 함은 "서비스"에 "상품"을 등록하여 판매하거나 또는 제공할 의사로 서비스를 이용하는 회원을 말합니다.
"입찰"이라 함은 "상품"을 구매하기 위하여 원하는 "상품"의 구매 가격을 제출하는 행위 또는 "상품"을 판매하기 위하여 원하는 "상품"의 판매 가격을 제출하는 행위를 말합니다.
"거래 체결"이라 함은 "입찰"에 의하여 상품의 거래가 성립되는 것을 말합니다.
"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스"상에 게시한 문자, 음성, 음향, 화상, 동영상 등의 정보 형태의 글(댓글 포함), 사진(이미지), 동영상 및 각종 파일과 링크 등 일체를 의미합니다.
"회원정보"라 함은 "서비스"를 이용하는 고객이 등록한 정보를 말합니다.
"서비스수수료"라 함은 "회원"이 "서비스"를 이용하면서 발생할 수 있는 수수료입니다. "상품"의 판매/구매 및 제반 서비스를 이용함에 따라 부과되는 시스템이용료로서 거래 수수료 또는 판매완료 수수료, 유료부가서비스수수료 등이 있으며, 관련내용은 제24조(서비스수수료)에 명시된 바에 따릅니다.
"포인트"라 함은 "서비스"의 효율적 이용을 위해 "회사"가 임의로 책정 또는 지급, 조정할 수 있는 "서비스" 상의 가상 데이터를 의미합니다. "포인트"의 적립, 지급, 사용 등과 관련한 구체적인 정책에 대해서는 이용약관 및 공지사항 등으로 별도 고지하는 바에 따릅니다.
“상품”이라 함은 본 약관에 따라 “회원” 간 거래 대상으로서 “서비스”에 등록된 재화 또는 용역을 말합니다.
“제휴 사업자”라 함은 “KREAM EXCLUSIVE DROPS” 및 “B2C 상품 페이지”에서 제공하는 통신판매중개를 이용하여 “회원”과 “제휴 사업자 판매 상품”을 거래하고자 “회사”와 별도의 계약을 체결한 사업자를 말합니다.
“입점 사업자”라 함은 “서비스”에서 제공하는 통신판매중개를 이용하여 “회원”에게 “입점 사업자 판매 상품”을 판매하거나 “회원” 또는 다른 “입점 사업자”로부터 “상품” 또는 “입점 사업자 판매 상품”을 구매하고자 “회사”와 별도 계약을 체결한 사업자를 말합니다. “입점 사업자”가 “상품” 또는 “입점 사업자 판매 상품”을 구매하는 경우 해당 구매와 관련하여서는 “구매자” 또는 “구매회원”에 대한 규정을 준용합니다.
“제휴 사업자 판매 상품”이라 함은 “상품”과는 달리 “제휴 사업자”가 “회사”와 체결한 별도의 계약에 따라 “KREAM EXCLUSIVE DROPS” 및 “B2C 상품 페이지”에서 “회원”에게 판매하는 재화 또는 용역을 말합니다.
“입점 사업자 판매 상품”이라 함은 “상품”과는 달리 “입점 사업자”가 “회사”와 체결한 별도 계약에 따라 “서비스”에서 “회원”에게 판매하는 재화 또는 용역을 말합니다.
 </p>
 <h5>제 3 조 (약관의 명시, 효력 및 변경)</h5>
 <p>1. "회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 "서비스" 초기 화면에 게시합니다.

2. "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 7일 전부터 공지합니다. 다만, "회원"에게 불리한 내용으로 약관을 개정하는 경우에는 그 적용일자 30일 전부터 공지 외에 "회원정보"에 등록된 이메일 등 전자적 수단을 통해 별도로 명확히 통지하도록 합니다.

3. "회사"가 전항에 따라 "회원"에게 통지하면서 공지 기간 이내에 거부의사를 표시하지 않으면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 "회원"이 명시적으로 거부의사를 밝히지 않거나, "서비스"를 이용할 경우에는 "회원"이 개정약관에 동의한 것으로 봅니다.

4. "회원"이 개정약관에 동의하지 않는 경우 "회사"는 개정약관의 내용을 적용할 수 없으며, 이 경우 회원은 제8조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다.

 </p>
 <h5>제 4 조 (약관의 해석)</h5>
 <p>"회사"는 개별 서비스에 대해서 별도의 이용약관 및 정책(이하 "개별 약관 등")을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "개별 약관 등"이 우선하여 적용됩니다.

이 약관에 명시되지 않은 사항은 '약관의 규제에 관한 법률'(이하 "약관법"), ‘전자상거래 등에서의 소비자보호에 관한 법률’(이하 "전자상거래법"), ‘정보통신망이용촉진및정보보호등에관한법률’(이하 "정보통신망법"), 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침(이하 "소비자보호지침") 및 관계 법령 또는 상관례에 따릅니다.
</p>
<h5>제 5 조 (이용계약의 체결)</h5>
<p>1. 이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 후 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다. "회사"는 "가입신청자"의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나, 사후에 이용계약을 해지할 수 있습니다.

가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우
타인의 명의를 도용하여 이용신청을 하는 경우
허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우
14세 미만 아동이 회원가입 시 법정대리인(부모 등)의 동의를 얻지 아니한 경우
사업자(이하 ‘사업자’에는 개인사업자 포함)가 이용신청을 하는 경우 (단, “회사”와 별도 계약을 체결한 “제휴 사업자” 또는 “입점 사업자”는 제외)
이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
2. "회사"는 "서비스" 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.

3. 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 "가입신청자"에게 알리도록 합니다.

4. 이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.

5. "회사"는 "회원"에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.

 </p>
 <h5>제 6 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)</h5>
 <p>1. "회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.

2. "회사"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 회사 및 회사의 운영자로 오인한 우려가 있는 경우 등 "회원" 및 "서비스" 보호에 필요한 경우 해당 "아이디"의 이용을 제한할 수 있습니다.

3. "회원"은 "아이디"및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다.

4. 제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.

 </p>
 <h5>제 7 조 (이용제한 등)</h5>
 <p>1. "회사"는 "회원"이 이 약관 또는 관련 법령을 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지, 이용계약 해지(재가입 제한 조치 포함) 등(이하 "이용제한 등")으로 "서비스" 이용을 단계적으로 제한할 수 있습니다.

2. "회사"는 전항에도 불구하고, "회원"의 의무 위반 행위나 "서비스" 운영 방해 행위에 대하여 사안의 중대성이나 긴급성 등을 토대로 "서비스"에 미치는 영향을 고려하여 경고 등의 단계적인 조치를 거치지 않고 곧바로 일시 정지나 영구이용정지, 이용계약 해지(재가입 제한 조치 포함)를 할 수 있습니다.
특히, ‘주민등록법'을 위반한 명의도용 및 결제도용, '저작권법'을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반하여 서비스에 중대한 영향을 끼친 경우에는 즉시 영구이용정지를 할 수 있으며, 영구이용정지를 할 수 있는 위반행위는 이에 제한되지 않습니다. 본 항에 따른 영구이용정지 시 "서비스" 이용을 통해 획득한 "포인트" 및 기타 혜택 등도 모두 소멸되며, "회사"는 이에 대해 별도로 보상하지 않습니다.

3. 본 조에 따른 "이용제한 등"의 사유는 아래의 사항을 포함하나 이에 한하지 아니하며, 구체적인 제한의 조건 및 세부내용은 본 약관 또는 운영 정책 및 개별 서비스 상의 이용약관이나 운영정책에서 정하는 바에 의합니다.
(관련정책 : 링크)

일정 횟수 이상의 가품 판정 또는 손상/오염/사용감 있는 상품 거래
부정거래(시세조작 행위, 자전거래 등) 시도
이용정지 중인 계정을 소유한 "회원"과 동일인임이 확인되는 활성계정
“제휴 사업자” 또는 “입점 사업자” 아닌 사업자의 “서비스” 이용
“제휴 사업자” 또는 “입점 사업자”가 해당 사업자에게 허용되지 않은 경로로 “서비스”를 이용한 경우
“제휴 사업자” 또는 “입점 사업자”가 사업자 아닌 개인임을 가장하여 “서비스”를 이용한 경우
본 약관 또는 관련 법령 위반
4. "회원"은 본 조에 따른 이용제한 등에 대해 "회사"가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "회사"가 인정하는 경우 "회사"는 즉시 "서비스"의 이용을 재개합니다.

5. "포인트" 및 기타 혜택은 "회원"이 "서비스"를 정상적으로 이용할 수 있는 경우에만 사용할 수 있습니다. 사유를 불문하고 이용정지 등의 제재 처분을 받은 경우 "포인트" 및 기타 혜택은 이용정지 등 제재가 해소되는 때까지 이용이 제한되고, "포인트" 및 기타 혜택의 유효기간은 연장되지 않으며, 기존 유효기간 등 부여 조건에 따라 소멸됩니다. 또한, "회사"는 이에 대하여 별도의 보상을 하지 않습니다.</p>
    </div>
     <jsp:include page="footer.jsp" />
     

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