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
                    <h1 class=" text-white">인사말</h1>
                    <span class=" text-white">Introduce</span>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ End banner area ================= -->

    <!--================Blog Area =================-->
    <section class="blog_area single-post-area py-80px section-margin--small">
        <div class="container">
            <div class="row">
                <div class="col-12 posts-list">
                    <div class="single-post row">
                        <div class="col-12">
                            <div class="feature-img">
                                <img class="img-fluid w-100" src="/resources/img/company/introduce.png" alt="">
                            </div>
                        </div>
                        <div class="col-12 blog_details">
                            <h2>변화와 혁신으로 미래를 이끌어가자</h2>
                            <br>
                            <p>
                                1981년 해법수학으로 출발한 천재교육은 이제 교과서와 참고서를 넘어 스마트러닝과 에듀테크 등 대한민국 교육을 선도하는 LEADING COMPANY로 성장했습니다.<br>
                                4차 산업 혁명 시대로 접어들면서 교육계도 일대 전환기를 맞이하고 있습니다.<br>
                                사회와 경제 전반에 인공 지능(AI)과 사물 인터넷, 블록체인, 빅데이터 등 첨단 정보 통신 기술이 융합되는 변화의 흐름에서 교육계 역시 예외일 수 없습니다.<br>
                                천재교육은 그간 축적된 방대한 양의 평가 자료 및 학습 콘텐츠 데이터베이스와 학습 내력을 기반으로 한 빅데이터를 적극 활용하여 새로운 개념의 학습과 맞춤형 교육 서비스를 제공하고 있습니다.<br>
                                디지털 교과서, AR, VR 및 AI를 접목한 학습 콘텐츠 개발, 교육 콘텐츠의 해외 수출에 이르기까지 천재교육의 도전에는 끝이 없습니다.<br>
                                <br><br>
                                <strong>변화와 혁신!</strong><br><br>
                                바로 오늘의 천재교육을 있게 했고 미래의 천재교육을 이끌어 갈 핵심 키워드입니다. 천재교육은 앞으로도 끊임없는 변화와 혁신으로 교육의 새로운 패러다임을 제시하겠습니다.
                                <br><br>
                                감사합니다.<br><br>
                                천재교육 회장 최정민
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <img src="/resources/img/company/introduce2.png">
        </div>
    </section>
    <!--================Blog Area =================-->
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

