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
                        <h3 class="d-flex justify-content-center align-items-center flex-wrap">
                            비밀번호 찾기
                        </h3>
                        <form class="row login_form mb-5" method="post" action="/login/findPwd" id="frm" >
                            <div class="col-md-12 form-group text-left">
                                <label>아이디</label>
                                <input type="text" data-name="아이디" class="form-control" id="member_id" name="member_id" value="${memberDTO['member_id']}" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'">
                                <small id="err_member_id" class="info text-danger"></small>
                            </div>
                            <div class="col-md-12 form-group text-left">
                                <label>이름</label>
                                <input type="text" data-name="이름" class="form-control" id="member_name" name="member_name" value="${memberDTO['member_name']}" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'">
                                <small id="err_member_name" class="info text-danger"></small>
                            </div>
                            <div class="col-md-12 form-group text-left">
                                <label>이메일</label>
                                <input type="email" data-name="이메일" class="form-control" id="email" name="email" placeholder="이메일" value="${memberDTO.email}" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'">
                                <small id="err_email" class="info text-danger"></small>
                            </div>
                            <div class="col-md-12 form-group d-flex flex-column" style="gap: 30px">
                                <div class="d-flex flex-column" style="gap:5px">
                                    <button type="submit" class="btn btn-success w-100 m-0">비밀번호 찾기</button>
                                    <button type="button" class="btn btn-outline-success w-100 m-0" onclick="location.href = '/login/findId'">아이디 찾기</button>
                                </div>
                                <div>
                                    <span class="mb-1">계정이 없으신가요?</span>
                                    <button type="button" class="btn btn-outline-success w-100" onclick="location.href = '/member/join'">회원가입</button>
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
    if(${!empty Err}) {
        alert('${Err}');
    }
</script>
<script src="/resources/js/commonUtil.js"></script>
<script>
    // 유효성 검사
    let checkTarget = ['member_id', 'member_name', 'email'];
    document.querySelector('#frm').addEventListener('submit', checkForm);
    function checkForm() {
        event.preventDefault();
        for (let info of document.querySelectorAll('.info')) {
            $(info).text("");
        }
        // 공란 검사
        for (let element of checkTarget) {
            let target = $('input[name=' + element + ']');
            if (!nullCheck($(target))) {
                $('#err_' + element).text($(target).data('name') + "을 입력해주세요");
                $(target).focus();
                return false;
            }
        }
        document.querySelector('#frm').submit();
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

