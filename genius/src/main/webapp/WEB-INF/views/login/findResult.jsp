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
    <!--================Login Box Area =================-->
    <section class="login_box_area section-margin">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8 col-sm-12">
                    <div class="login_form_inner rounded">
                        <c:if test="${param.type == 'findId'}">
                            <div class="mb-4">
                                <h3 class="d-flex justify-content-center align-items-center flex-wrap m-0 pb-1">
                                    아이디 찾기 결과
                                </h3>
                                <small class="font-weight-light pt-1">앞으로 아이디 잃어버리지말기로 약속‍🫲🏻</small>
                            </div>
                            <div class="p-5 ml-4 mr-4 mb-4 rounded bg-light d-flex justify-content-center align-items-center flex-wrap">
                                <h4 class="text-geni">${param['member_id']}</h4>
                            </div>
                            <div class="col-md-12 form-group d-flex flex-column" style="gap:5px">
                                <button type="button" class="btn btn-success w-100" onclick="location.href = '/login/login'">로그인 하러 가기</button>
                                <button type="button" class="btn btn-outline-success w-100" onclick="location.href = '/login/findPwd'">비밀번호 찾기</button>
                            </div>
                        </c:if>
                        <c:if test="${param.type == 'findPwd'}">
                            <div class="mb-4">
                                <h3 class="d-flex justify-content-center align-items-center flex-wrap m-0 pb-1">
                                    비밀번호 찾기 결과
                                </h3>
                                <small class="font-weight-light pt-1">앞으로 비밀번호 잃어버리지말기로 약속‍🫲🏻</small>
                            </div>
                            <div class="p-5 ml-4 mr-4 mb-4 rounded bg-light d-flex justify-content-center align-items-center flex-wrap">
                                비밀번호가 정상 변경 되었습니다.
                            </div>
                            <div class="col-md-12 form-group d-flex flex-column" style="gap:5px">
                                <button type="button" class="btn btn-success w-100" onclick="location.href = '/login/login'">로그인 하러 가기</button>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Login Box Area =================-->
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

