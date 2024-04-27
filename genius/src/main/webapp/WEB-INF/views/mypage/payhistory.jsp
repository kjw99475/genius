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
                    <h1 class=" text-white">결제 내역</h1>
                    <span class=" text-white">My Order</span>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ End banner area ================= -->

    <!-- ============= 결제 내역 Start ============= -->
    <section class="section-margin--small">
        <div class="container">
            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0 p-3 d-flex justify-content-between"  data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            <div class="d-flex flex-column" style="gap:10px">
                                <span><small>2024-04-27 15:09:00</small><small> | 총 3건</small></span>

                                <span> 55,000원</span>
                            </div>
                            <div class="d-flex flex-column align-items-end" style="gap:10px">
                                <small>주문완료</small>
                                <button class="btn btn-success" type="button">주문취소</button>
                            </div>
                        </h5>
                    </div>
                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table">
                                <colgroup>
                                    <col width="55%" style="width: 55% !important; box-sizing: border-box" />
                                    <col span="3" width="15%" style="width: 15% !important; box-sizing: border-box"  />
                                </colgroup>
                                <thead class="bg-geni-ft">
                                <tr>
                                    <th scope="col" >상품명</th>
                                    <th scope="col" >단가</th>
                                    <th scope="col" >수량</th>
                                    <th scope="col" >합계</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="">
                                    <td>
                                        <div class="media align-items-center">
                                            <div class="d-flex">
                                                <img class="img-w100" src="/resources/img/product/product1.jpg" alt="">
                                            </div>
                                            <div class="media-body">
                                                <p>중학 보건</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <p>10,000원</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>1</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>10,000원</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="media align-items-center">
                                            <div class="d-flex">
                                                <img class="img-w100" src="/resources/img/product/product2.jpg" alt="">
                                            </div>
                                            <div class="media-body">
                                                <p>고등학교 기본 수학</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <p>20,000원</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>1</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>20,000원</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="media align-items-center">
                                            <div class="d-flex">
                                                <img class="img-w100" src="/resources/img/product/product3.jpg" alt="">
                                            </div>
                                            <div class="media-body">
                                                <p>고등학교 기술가정</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <p>55,000원</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>1</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>55,000원</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <h5>총계</h5>
                                    </td>
                                    <td class="text-right" colspan="2">
                                        <h5>85,000원</h5>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" id="headingTwo">
                        <h5 class="mb-0 p-3 d-flex justify-content-between"  data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                            <div class="d-flex flex-column" style="gap:10px">
                                <span><small>2024-04-27 15:09:00</small><small> | 총 3건</small></span>

                                <span> 55,000원</span>
                            </div>
                            <div class="d-flex flex-column align-items-end" style="gap:10px">
                                <small>배송완료</small>
                                <button class="btn btn-outline-success" type="button">환불</button>
                            </div>
                        </h5>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table">
                                <colgroup>
                                    <col width="55%" style="width: 55% !important; box-sizing: border-box" />
                                    <col span="3" width="15%" style="width: 15% !important; box-sizing: border-box"  />
                                </colgroup>
                                <thead class="bg-geni-ft">
                                <tr>
                                    <th scope="col" >상품명</th>
                                    <th scope="col" >단가</th>
                                    <th scope="col" >수량</th>
                                    <th scope="col" >합계</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="">
                                    <td>
                                        <div class="media align-items-center">
                                            <div class="d-flex">
                                                <img class="img-w100" src="/resources/img/product/product1.jpg" alt="">
                                            </div>
                                            <div class="media-body">
                                                <p>중학 보건</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <p>10,000원</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>1</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>10,000원</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="media align-items-center">
                                            <div class="d-flex">
                                                <img class="img-w100" src="/resources/img/product/product2.jpg" alt="">
                                            </div>
                                            <div class="media-body">
                                                <p>고등학교 기본 수학</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <p>20,000원</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>1</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>20,000원</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="media align-items-center">
                                            <div class="d-flex">
                                                <img class="img-w100" src="/resources/img/product/product3.jpg" alt="">
                                            </div>
                                            <div class="media-body">
                                                <p>고등학교 기술가정</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <p>55,000원</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>1</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>55,000원</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <h5>총계</h5>
                                    </td>
                                    <td class="text-right" colspan="2">
                                        <h5>85,000원</h5>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div><div class="card">
                <div class="card-header" id="headingThree">
                    <h5 class="mb-0 p-3 d-flex justify-content-between"  data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                        <div class="d-flex flex-column" style="gap:10px">
                            <span><small>2024-04-26 18:19:00</small><small> | 총 3건</small></span>

                            <span> 55,000원</span>
                        </div>
                        <div class="d-flex flex-column align-items-end" style="gap:10px">
                            <small>주문취소</small>
                    </h5>
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                    <div class="card-body">
                        <table class="table">
                            <colgroup>
                                <col width="55%" style="width: 55% !important; box-sizing: border-box" />
                                <col span="3" width="15%" style="width: 15% !important; box-sizing: border-box"  />
                            </colgroup>
                            <thead class="bg-geni-ft">
                            <tr>
                                <th scope="col" >상품명</th>
                                <th scope="col" >단가</th>
                                <th scope="col" >수량</th>
                                <th scope="col" >합계</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="">
                                <td>
                                    <div class="media align-items-center">
                                        <div class="d-flex">
                                            <img class="img-w100" src="/resources/img/product/product1.jpg" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p>중학 보건</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="align-middle">
                                    <p>10,000원</p>
                                </td>
                                <td class="align-middle">
                                    <p>1</p>
                                </td>
                                <td class="align-middle">
                                    <p>10,000원</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="media align-items-center">
                                        <div class="d-flex">
                                            <img class="img-w100" src="/resources/img/product/product2.jpg" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p>고등학교 기본 수학</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="align-middle">
                                    <p>20,000원</p>
                                </td>
                                <td class="align-middle">
                                    <p>1</p>
                                </td>
                                <td class="align-middle">
                                    <p>20,000원</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="media align-items-center">
                                        <div class="d-flex">
                                            <img class="img-w100" src="/resources/img/product/product3.jpg" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p>고등학교 기술가정</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="align-middle">
                                    <p>55,000원</p>
                                </td>
                                <td class="align-middle">
                                    <p>1</p>
                                </td>
                                <td class="align-middle">
                                    <p>55,000원</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <h5>총계</h5>
                                </td>
                                <td class="text-right" colspan="2">
                                    <h5>85,000원</h5>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </section>
    <!--  ============= 결제 내역 End =============  -->
</main>
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!--================ 푸터 End =================-->

<script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="/resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/resources/vendors/skrollr.min.js"></script>
<script src="/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/resources/vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="/resources/vendors/jquery.ajaxchimp.min.js"></script>
<script src="/resources/vendors/mail-script.js"></script>
<script src="/resources/js/main.js"></script>
</body>

