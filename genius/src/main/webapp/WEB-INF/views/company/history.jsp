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
    <section class="bg-img3 p-6" id="category">
        <div class="container h-100 p-3">
            <div class="blog-banner pt-1 pb-1">
                <div class="text-center ">
                    <h1 class=" text-white">연혁</h1>
                    <span class=" text-white">History</span>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ End banner area ================= -->
    <!--================Product Description Area =================-->
    <section class="product_description_area">
        <div class="container text-center mb-5">
                <p class="mb-2 display-4"><img src="/resources/img/historyofgenius.png" width="400px"></p>
                <p>끊임없는 변화와 혁신으로 교과서·이러닝 분야의 최강자가 되다.</p>
        </div>
        <div class="container d-flex w-100 border bg-geni-ft p-0">
            <ul class="nav nav-tabs d-flex flex-column w-25 p-3 justify-content-center text-center border-0 bg-transparent" id="myTab" role="tablist" style="gap: 10px">
                <li class="nav-item align-self-center d-flex justify-content-center text-center p-0 m-0">
                    <a class="nav-link active pl-4 pr-4" id="y2020-tab" data-toggle="tab" href="#y2020" role="tab" aria-controls="home"
                       aria-selected="true">2020년</a>
                </li>
                <li class="nav-item align-self-center d-flex justify-content-center  text-center p-0 m-0">
                    <a class="nav-link pl-4 pr-4" id="y2021-tab" data-toggle="tab" href="#y2021" role="tab" aria-controls="profile"
                       aria-selected="false">2021년</a>
                </li>
                <li class="nav-item align-self-center d-flex justify-content-center  text-center p-0 m-0">
                    <a class="nav-link pl-4 pr-4" id="y2022-tab" data-toggle="tab" href="#y2022" role="tab" aria-controls="contact"
                       aria-selected="false">2022년</a>
                </li>
                <li class="nav-item align-self-center d-flex justify-content-center  text-center p-0 m-0">
                    <a class="nav-link pl-4 pr-4" id="y2023-tab" data-toggle="tab" href="#y2023" role="tab" aria-controls="review"
                       aria-selected="false">2023년</a>
                </li>
                <li class="nav-item align-self-center d-flex justify-content-center  text-center p-0 m-0">
                    <a class="nav-link pl-4 pr-4" id="y2024-tab" data-toggle="tab" href="#y2024" role="tab" aria-controls="review"
                       aria-selected="false">2024년</a>
                </li>
            </ul>
            <div class="tab-content w-75 border-0 bg-white" id="myTabContent">
                <div class="tab-pane fade active show" id="y2020" role="tabpanel" aria-labelledby="y2020-tab">
                    <div>
                        <h4 class="text-geni">12</h4>
                        2015 개정 교육과정 인정 교과서 고등 2책 합격<br>
                        초등 교사 매거진 계간 &lt;-talk&gt; 창간
                    </div>
                    <div>
                        <h4 class="text-geni">11</h4>
                        2015 개정 교육과정 인정 교과서 고등 2책 합격<br>
                        2015 개정 교육과정 고등학교 인정 교과용 도서 2책 합격
                    </div>
                    <div>
                        <h4 class="text-geni">08</h4>
                        '해법영어교실' 제2회 SPEECH CONTEST 개최<br>
                        'e해법수학·셀파수학교실' 제 2회 개념말하기 UCC 콘테스트 개최
                    </div>
                    <div>
                        <h4 class="text-geni">07</h4>
                        HME 해법수학 학력평가 실시<br>
                        'e해법수학' 4년 연속 '매경 100대 프랜차이즈' 선정
                    </div>
                </div>
                <div class="tab-pane fade" id="y2021" role="tabpanel" aria-labelledby="y2021-tab">
                    <div>
                        <h4 class="text-geni">12</h4>
                        2015 개정 교육과정 인정 교과서 고등 2책 합격<br>
                        초등 교사 매거진 계간 &lt;-talk&gt; 창간
                    </div>
                    <div>
                        <h4 class="text-geni">11</h4>
                        2015 개정 교육과정 인정 교과서 고등 2책 합격<br>
                        2015 개정 교육과정 고등학교 인정 교과용 도서 2책 합격
                    </div>
                    <div>
                        <h4 class="text-geni">08</h4>
                        '해법영어교실' 제2회 SPEECH CONTEST 개최<br>
                        'e해법수학·셀파수학교실' 제 2회 개념말하기 UCC 콘테스트 개최
                    </div>
                    <div>
                        <h4 class="text-geni">07</h4>
                        HME 해법수학 학력평가 실시<br>
                        'e해법수학' 4년 연속 '매경 100대 프랜차이즈' 선정
                    </div>
                </div>
                <div class="tab-pane fade" id="y2022" role="tabpanel" aria-labelledby="y2022-tab">
                    <div>
                        <h4 class="text-geni">12</h4>
                        2015 개정 교육과정 인정 교과서 고등 2책 합격<br>
                        초등 교사 매거진 계간 &lt;-talk&gt; 창간
                    </div>
                    <div>
                        <h4 class="text-geni">11</h4>
                        2015 개정 교육과정 인정 교과서 고등 2책 합격<br>
                        2015 개정 교육과정 고등학교 인정 교과용 도서 2책 합격
                    </div>
                    <div>
                        <h4 class="text-geni">08</h4>
                        '해법영어교실' 제2회 SPEECH CONTEST 개최<br>
                        'e해법수학·셀파수학교실' 제 2회 개념말하기 UCC 콘테스트 개최
                    </div>
                    <div>
                        <h4 class="text-geni">07</h4>
                        HME 해법수학 학력평가 실시<br>
                        'e해법수학' 4년 연속 '매경 100대 프랜차이즈' 선정
                    </div>
                </div>
                <div class="tab-pane fade" id="y2023" role="tabpanel" aria-labelledby="y2023-tab">
                    <div>
                        <h4 class="text-geni">12</h4>
                        2015 개정 교육과정 인정 교과서 고등 2책 합격<br>
                        초등 교사 매거진 계간 &lt;-talk&gt; 창간
                    </div>
                    <div>
                        <h4 class="text-geni">11</h4>
                        2015 개정 교육과정 인정 교과서 고등 2책 합격<br>
                        2015 개정 교육과정 고등학교 인정 교과용 도서 2책 합격
                    </div>
                    <div>
                        <h4 class="text-geni">08</h4>
                        '해법영어교실' 제2회 SPEECH CONTEST 개최<br>
                        'e해법수학·셀파수학교실' 제 2회 개념말하기 UCC 콘테스트 개최
                    </div>
                    <div>
                        <h4 class="text-geni">07</h4>
                        HME 해법수학 학력평가 실시<br>
                        'e해법수학' 4년 연속 '매경 100대 프랜차이즈' 선정
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Product Description Area =================-->

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

