<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-04-25
  Time: 오후 1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>genius</title>
    <link rel="icon" href="/resources/img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="/resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="/resources/vendors/nice-select/nice-select.css">
    <link rel="stylesheet" href="/resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/vendors/owl-carousel/owl.carousel.min.css">

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/swiper-bundle.min.css"/>

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main class="site-main">
    <!-- ================ start banner area ================= -->
    <section class="bg-img2 p-6" id="category">
        <div class="container h-100 p-3">
            <div class="blog-banner pt-1 pb-1">
                <div class="text-center ">
                    <h1 class=" text-white">주문/결제</h1>
                    <span class=" text-white">Order</span>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ End banner area ================= -->

    <!--================Checkout Area =================-->
    <section class="checkout_area section-margin--small">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-8">
                        <h3>주문자 정보</h3>
                        <form class="row contact_form" action="#" method="post" novalidate="novalidate" id="userfrm" name="userfrm">
                            <div class="col-md-12 form-group d-flex align-items-baseline">
                                <label class="w-100px">이름 : </label><input value="${memberdto.member_name}" type="text" class="form-control border-0" id="name" name="name" placeholder="이름을 입력해주세요" disabled>
                            </div>
                            <div class="col-md-12 form-group d-flex align-items-baseline">
                                <label class="w-100px">연락처 : </label><input value="${memberdto.phone}" type="tel" class="form-control border-0" id="phone" name="phone" placeholder="연락처를 입력해주세요" disabled>
                            </div>
                            <div class="col-md-12 form-group">
                                <div class="creat_account">
                                    <h3>나의 포인트</h3>
                                </div>
                                <div>
                                    <p> 현재 포인트 : <span>${memberdto.point}</span></p>
                                    <p> 결제 후 포인트 : <span id="total">${memberdto.point-totalprice}</span></p>
                                </div>
                            </div>
                            <div class="col-md-12 form-group">
                                <div class="creat_account">
                                    <h3>배송지 정보</h3>
                                    <div class="col-md-12 form-group d-flex align-items-baseline">
                                        <label class="w-100px">이름 : </label><input type="text" class="form-control" id="order_name" name="name" value="${memberdto.member_name}">
                                    </div>
                                    <div class="col-md-12 form-group d-flex align-items-baseline">
                                        <label class="w-100px">연락처 : </label><input type="tel" class="form-control" id="order_phone" name="phone" value="${memberdto.phone}">
                                    </div>
                                    <div  class="col-md-12 form-group d-flex w-100  align-items-baseline">
                                        <label class="w-100px">주소 : </label>
                                        <div class="form-control border-0 p-0">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" name="order_zip_code" placeholder="우편번호" id="sample4_postcode" aria-label="Recipient's username" aria-describedby="button-addon2"  onclick="sample4_execDaumPostcode()" value="${memberdto.zip_code}">
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-success" type="button" id="button-addon2" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="order_addr1" value="${memberdto.addr1}">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="sample4_detailAddress"  placeholder="상세주소" name="order_addr2" value="${memberdto.addr2}">
                                            </div>
                                            <span id="guide" style="color:#999;display:none"></span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-4">
                        <div class="order_box">
                            <h2>주문 정보</h2>
                            <table class="list table bg-white rounded">
                                <colgroup>
                                    <col style="width: 50%" />
                                    <col style="width: 20%" />
                                    <col style="width: 30%" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th class="border-0" scope="col"><small>상품명</small></th>
                                        <th class="border-0" scope="col"><small>수량</small></th>
                                        <th class="border-0" scope="col"><small>합계</small></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${dtolist}" var="list">
                                    <tr>
                                        <td><small>${list.book_name}</small></td>
                                        <td><small>${list.quantity}</small></td>
                                        <td><small>${list.price}원</small></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <ul class="list list_2">
                                <li>총합 <span>${totalprice}원</span></li>
                            </ul>
                            <div class="payment_item">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option5" name="selector">
                                    <label for="f-option5">아래 내용을 확인하였습니다.</label>
                                    <div class="check"></div>
                                </div>
                                <p>위 주문 내용을 확인하였으며, 회원 본인은 개인정보 이용 및 제공 및 결제에 동의합니다.</p>
                            </div>
                            <div class="text-center">
                                <button class="button button-paypal" onclick="purchase()">결제하기</button>
<%--                                <a class="button button-paypal" href="#">결제하기</a>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Checkout Area =================-->
</main>
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!--================ 푸터 End =================-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

    function purchase(){
        var cart_idx = [];
        <c:forEach items="${dtolist}" var="list">
            cart_idx.push(${list.cart_idx});
        </c:forEach>
        let frmData = $("form[name=userfrm]").serialize();
        frmData = decodeURIComponent(frmData);
        $.ajax({
            url:"/order/cartpayment.dox?"+frmData,
            dataType:"json",
            type : "POST",
            data : {
                "member_id":"${sessionScope['member_id']}",
                "price":"${totalprice}",
                "cart_idx": JSON.stringify(cart_idx)
            },
            success : function(data) {
                if(data.result == "success"){
                    alert("성공");
                    location.href="/mypage/payhistory";
                }else{
                    alert("포인트가 모자랍니다");
                }
            },
            fail : function (data){

            }

        });
    }
</script>


<script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="/resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/resources/vendors/skrollr.min.js"></script>
<script src="/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/resources/vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="/resources/vendors/jquery.ajaxchimp.min.js"></script>
<script src="/resources/vendors/mail-script.js"></script>
<script src="/resources/js/main.js"></script>
</body>

