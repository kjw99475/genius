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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
                        <h3 class="d-flex justify-content-center align-items-center flex-wrap"><img src="/resources/img/login.png" width="400px"></h3>
                        <form class="row login_form mb-5" method="post" action="/login/login" id="frm" >
                            <input type="hidden" name="acc_url" value="/">
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control" id="member_id" name="member_id" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'">
                            </div>
                            <div class="col-md-12 form-group">
                                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
                            </div>
                            <div class="col-md-12 form-group">
                                <div class="creat_account">
                                    <input type="checkbox" id="auto_login" name="auto_login">
                                    <label for="auto_login">자동 로그인</label>
                                </div>
                            </div>
                            <div class="col-md-12 form-group d-flex flex-column" style="gap:10px">
                                <button type="submit" class="btn btn-success w-100">로그인</button>
                                <c:set var="client_id">9GW7lkN31ckPUUZa1KsK</c:set>
                                <c:set var="redirect_uri">http://localhost:8080/login/naver</c:set>
                                <c:set var="state">genius</c:set>
                                <button type="button" class="btn btn-success w-100"
                                        onclick="location.href = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=${client_id}&state=${state}&redirect_uri=${redirect_uri}'">네이버 로그인</button>
                                <button type="button" class="btn btn-outline-success w-100" onclick="location.href = '/member/join'">회원가입</button>
                                <div class="d-flex justify-content-center" style="gap:10px">
                                    <a href="/login/findId">아이디 찾기</a><a href="/login/findPwd">비밀번호 찾기</a>
                                </div>
                            </div>
                        </form>
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
<script>
    if(${!empty loginErr}) {
        alert("${loginErr}");
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

