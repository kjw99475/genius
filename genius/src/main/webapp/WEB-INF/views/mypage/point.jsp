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
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

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
                    <h1 class=" text-white">포인트 충전</h1>
                    <span class=" text-white">Point</span>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ end banner area ================= -->

    <!--================충전 내역 Area =================-->
    <section class="order_details section-margin--small">
        <div class="container">
            <div>
                <div>
                    <div class="confirmation-card text-center">
                        <h4 class="h4">나의 포인트</h4>
                        <h3 class="h3">${point} 포인트</h3>
                        <div class="d-grid mt-4">
                            <button type="button" class="btn btn-success w-50 closeModal" data-toggle="modal" data-target="#exampleModalCenter">
                                충전하기
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-4 mb-4 mb-xl-0">

                </div>
            </div>
            <div class="order_details_table bg-light">
                <div class="row justify-content-end align-items-center pb-3">
                    <div class="col-auto">
                        <input type="date" class="form-control" id="startDay" name="startDay">
                    </div>
                    <div>~</div>
                    <div class="col-auto">
                        <input type="date" class="form-control" id="endDay" name="endDay">
                    </div>
                    <div>
                        <button class="btn btn-success" type="button">조회</button>
                    </div>
                </div>
                <c:forEach items="${mypaymentlist}" var="list">
                    ${list.price}
                </c:forEach>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">총 0${total_count}건</th>
                                <th scope="col">종류</th>
                                <th scope="col">결제 일자</th>
                                <th scope="col">금액</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items= "${mypaymentlist}" var="list">
                            <tr>
                                <td class="border-0">
                                    <p>${list.title}</p>
                                </td>
                                <td class="border-0">
                                    <h5>${list.use_type}</h5>
                                </td>
                                <td class="border-0">
                                    <p>${list.reg_date}</p>
                                </td>
                                <td class="border-0">
                                    <c:if test="${list.price > 0}">
                                    <p class="text-geni">+${list.price}</p>
                                    </c:if>
                                    <c:if test="${list.price < 0}">
                                    <p>${list.price}</p>
                                    </c:if>
                                </td>
                            </tr>
                            </c:forEach>
<%--                            <tr>--%>
<%--                                <td>--%>
<%--                                    <p>포인트 충전</p>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <h5>충전</h5>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <p>2024-04-26 00:00:00</p>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <p class="text-geni">+10,000</p>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>--%>
<%--                                    <p>포인트 충전</p>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <h5>충전</h5>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <p>2024-04-26 00:00:00</p>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <p class="text-geni">+10,000</p>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>--%>
<%--                                    <p>포인트 충전</p>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <h5>충전</h5>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <p>2024-04-26 00:00:00</p>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <p class="text-geni">+10,000</p>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>--%>
<%--                                    <p>포인트 충전</p>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <h5>충전</h5>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <p>2024-04-26 00:00:00</p>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <p class="text-geni">+10,000</p>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td class="border-0">--%>
<%--                                    <p>포인트 충전</p>--%>
<%--                                </td>--%>
<%--                                <td class="border-0">--%>
<%--                                    <h5>충전</h5>--%>
<%--                                </td>--%>
<%--                                <td class="border-0">--%>
<%--                                    <p>2024-04-26 00:00:00</p>--%>
<%--                                </td>--%>
<%--                                <td class="border-0">--%>
<%--                                    <p class="text-geni">+10,000</p>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <!--================충전 내역 End =================-->

    <!--================페이징 내역 Start =================-->
    <nav class="blog-pagination justify-content-center d-flex">
        <ul class="pagination">
            <li class="page-item">
                <a href="#" class="page-link" aria-label="Previous">&lt;</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">01</a>
            </li>
            <li class="page-item active">
                <a href="#" class="page-link">02</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">03</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">04</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">09</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link" aria-label="Next">&gt;</a>
            </li>
        </ul>
    </nav>

    <!--================페이징 내역 End =================-->

</main>
<!--================ 본문 END =================-->

<!--================결체 창 Start =================-->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">충전하기</h5>
                <button type="button" class="close closeModal" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body d-flex flex-column" style="gap:15px">
                <form action="/mypage/point" method="post" name="frmCharge" id="frmCharge">
                    <div class="form-group">
                        <label for="target">충전 금액</label>
                        <input type="text" class="form-control" id="target" name="point" aria-describedby="emailHelp" value="0">
                        <small id="emailHelp" class="form-text text-muted">아래의 금액단위를 클릭해 충전금액을 입력해주세요</small>
                    </div>
                    <div class="d-flex justify-content-center pb-2" role="group" style="gap:5px">
                        <button type="button" class="btn btn-default btn-price" data-price="1">+1</button>
                        <button type="button" class="btn btn-default btn-price" data-price="10000">+1만</button>
                        <button type="button" class="btn btn-default btn-price" data-price="50000">+5만</button>
                        <button type="button" class="btn btn-default btn-price" data-price="100000">+10만</button>
                        <button type="button" class="btn btn-default btn-price" data-price="1000000">+100만</button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary closeModal" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-success" onclick="requestPay()">충전</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--================결체 창 End =================-->


<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!--================ 푸터 End =================-->
<script>
    let buttons = document.querySelectorAll('.btn-price');
    const target = document.querySelector('#target');
    for (let button of buttons) {
        button.addEventListener('click', () => {
            if (target.value == null || target.value == '') {
                target.value = 0;
            }
            let price = parseInt(uncomma(button.dataset.price));
            let targetVal = parseInt(uncomma(target.value));
            console.log(targetVal);
            let total = targetVal + price;
            target.value = comma(total);
        })
    }

    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }

    let closes = document.querySelectorAll('.closeModal');
    for (let close of closes) {
        close.addEventListener('click', () => {
            target.value = 0;
        })
    }
    //////////////////////////////////////////결제 모듈////////////////////////////////////


    var list;
    $.ajax({
        url:"/member/viewMember.dox",
        dataType:"json",
        type : "GET",
        data : {
            "member_id":"${sessionScope['member_id']}"
        },
        success : function(data) {
            list = data.dto;
            console.log(list);
        }
    });



    var IMP = window.IMP;
        IMP.init("imp78587533");

        function requestPay() {
            let targetVal = parseInt(uncomma(target.value));
            let today = new Date();
            let rand = Math.floor(Math.random()*(1000000-0)+1);
            let hours = today.getHours(); // 시
            let minutes = today.getMinutes();  // 분
            let seconds = today.getSeconds();  // 초
            let milliseconds = today.getMilliseconds();
            let now = hours+minutes+seconds+milliseconds;
            console.log(list);
                IMP.request_pay({
                    pg: 'html5_inicis',
                    pay_method: 'card',
                    merchant_uid: now+"-"+rand,
                    name: '포인트',
                    amount: targetVal,
                    buyer_email: list.email,
                    buyer_name: list.member_name,
                    buyer_tel: list.phone,
                    buyer_addr: list.addr1 +" " +list.addr2,
                    buyer_postcode: list.zipcode
                }, function (rsp) { // callback
                    if(rsp.success){
                        console.log(rsp.amount);
                        $.ajax({
                            url:"/mypage/point.dox",
                            dataType:"json",
                            type : "POST",
                            data : {
                                "payment_num":rsp.merchant_uid
                                ,"member_id":"test"
                                ,"price":rsp.paid_amount
                                ,"method":rsp.pay_method
                                ,"company":rsp.pg_provider
                            },
                            success : function(data) {
                                alert("포인트 충전 성공");
                                location.href="/mypage/point";
                            }
                        });
                        console.log(rsp);
                    }else {
                        console.log(rsp);
                    }
                    //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                });
        }

    //////////////////////////////////////////결제 모듈////////////////////////////////////

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

