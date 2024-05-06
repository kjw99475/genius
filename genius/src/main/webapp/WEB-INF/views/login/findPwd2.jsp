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
                        <div class="mb-4">
                            <h3 class="d-flex justify-content-center align-items-center flex-wrap m-0 pb-1">
                                비밀번호 변경
                            </h3>
                        </div>
                        <div class="p-4 ml-4 mr-4 mb-4 rounded bg-light d-flex justify-content-center align-items-center flex-wrap">
                            <p class="p-0 m-0">확인된 계정 : ${param['member_id']}</p>
                        </div>
                        <form class="row login_form mb-5" method="post" action="/login/changePwd" id="frmPwd" >
                            <input type="hidden" name="member_id" value="${param['member_id']}">
                            <div class="col-md-12 form-group text-left">
                                <label>새 비밀번호</label>
                                <input type="password" data-name="새 비밀번호" class="form-control" id="pwd" name="pwd" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
                                <small id="err_pwd" class="info text-danger"></small>
                            </div>
                            <div class="col-md-12 form-group text-left">
                                <label>비밀번호 확인</label>
                                <input type="password" data-name="비밀번호 확인" class="form-control" id="pwdCheck" name="pwdCheck" placeholder="비밀번호 확인" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'">
                                <small id="err_pwdCheck" class="info text-danger"></small>
                            </div>
                            <div class="col-md-12 form-group d-flex flex-column" style="gap:50px">
                                <button type="submit" class="btn btn-success w-100">비밀번호 변경</button>
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
<script src="/resources/js/commonUtil.js"></script>
<script>
    // 유효성 검사
    let checkTarget = ['pwd', 'pwdCheck'];
    document.querySelector('#frmPwd').addEventListener('submit', checkForm);
    function checkForm() {
        event.preventDefault();
        for(let info of document.querySelectorAll('.info')) {
            $(info).text("");
        }
        // 공란 검사
        for (let element of checkTarget) {
            let target = $('input[name='+element+']');
            if (!nullCheck($(target))) {
                $('#err_'+element).text($(target).data('name') + "을 입력해주세요");
                $(target).focus();
                return false;
            }
        }
        // 정규식 검사
        if(!passwordRegCheck($('input[name=pwd]'))){
            $('#err_pwd').text("비밀번호는 영문 소/대문자 + 숫자 + 특수문자를 조합하여 8글자 이상, 20글자 이하로 입력해주세요. 가능한 특수문자 : !@#$%^*+=-");
            $('input[name=pwd]').focus();
            return false;
        }
        // 중복 체크 및 일치 여부 검사
        if (!passwordMatch($('input[name=pwd]'), $('input[name=pwdCheck]'))) {
            $('#err_pwdCheck').text("비밀번호가 일치하지 않습니다.");
            $('input[name=pwdCheck]').focus();
            return false;
        }
        document.querySelector('#frmPwd').submit();
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

