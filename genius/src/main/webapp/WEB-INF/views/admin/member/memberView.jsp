<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-04-25
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin / member - view</title>
    <!-- Favicons -->
    <link href="/resources/admin/img/favicon.png" rel="icon">
    <link href="/resources/admin/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="/resources/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/admin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="/resources/admin/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="/resources/admin/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="/resources/admin/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="/resources/admin/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="/resources/admin/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="/resources/admin/css/style.css" rel="stylesheet">
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main id="main" class="main">

    <div class="pagetitle">
        <h1>회원 관리</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item "><a href="/admin/member/memberList">회원</a></li>
                <li class="breadcrumb-item active">회원 상세</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
        <div class="row">

            <div class="col-xl-12">

                <div class="card">
                    <div class="card-body pt-3">
                        <div class="tab-content pt-2">
                            <div class="tab-pane fade show active profile-overview" id="profile-overview">
                                <form name="frm_member_delete" id="frm_member_delete" action="/admin/member/memberDelete">
                                    <!-- <h5 class="card-title">Profile Details</h5> -->

                                    <div class="row">
                                        <label for="frm" class="col-md-4 col-lg-2 col-form-label label">회원번호</label>
                                        <div class="col-md-8 col-lg-10">
                                            <input name="frm" type="text" class="form-control" id="frm"
                                                   value="폼으로 된 형태${memberDTO.member_idx}" readonly>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-2 col-md-4 label ">이미지</div>
                                        <div class="col-lg-10 col-md-8">
                                            <img src="https://mall.chunjaetext.co.kr/web/product/small/202402/c92bb75807729444600df21b9257ccf9.jpg" alt="이미지">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="file" class="col-md-4 col-lg-2 col-form-label label">파일</label>
                                        <div class="col-md-8 col-lg-10">
                                            <input name="file" type="file" class="form-control" id="file"
                                                   value="${memberDTO.book_img}">
                                        </div>
                                    </div>



                                    <div class="row mb-3">
                                        <label for="social_type" class="col-md-4 col-lg-2 col-form-label label">카테고리</label>
                                        <div class="col-md-8 col-lg-10">
                                            <select name="social_type" class="form-control" id="social_type">
                                                <option value="" selected hidden>셀렉트박스</option>
                                                <option value="01">01</option>
                                                <option value="02">02</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="reg_date" class="col-md-4 col-lg-2 col-form-label label">가입일</label>
                                        <div class="col-md-8 col-lg-10">
                                            <input name="reg_date" type="date" class="form-control" id="reg_date"
                                                   value="${memberDTO.reg_date}">
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-lg-2 col-md-4 label">폼 아니고 값만 출력할 때</div>
                                        <div class="col-lg-10 col-md-8">출력출력</div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-2 col-md-4 label">회원아이디</div>
                                        <div class="col-lg-10 col-md-8">아이디${memberDTO.member_name}</div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-2 col-md-4 label">회원이름</div>
                                        <div class="col-lg-10 col-md-8">이름${memberDTO.member_name}</div>
                                    </div>

                                </form>
                            </div>
                        </div>

                        <div class="text-center mt-5">
                            <button type="submit" class="btn btn-success" onclick="location.href='/admin/member/memberModify?member_id=${memberDTO.member_id}'">수정</button>
                            <button type="button" class="btn btn-success" id="btn_member_delete" onclick="member_delete();">삭제</button>
                        </div>
                    </div><!-- End Bordered Tabs -->

                </div>
            </div>

        </div>
    </section>

</main><!-- End #main -->
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
<!--================ 푸터 End =================-->

<script>
    const frm_delete = document.querySelector("#frm_member_delete");
    function member_delete() {
        let flag_delete = confirm("정말 삭제하시겠습니까?");
        if (flag_delete) {
            frm_delete.submit();
        }
    }
</script>


<!-- Vendor JS Files -->
<script src="/resources/admin/vendor/apexcharts/apexcharts.min.js"></script>
<script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/admin/vendor/chart.js/chart.umd.js"></script>
<script src="/resources/admin/vendor/echarts/echarts.min.js"></script>
<script src="/resources/admin/vendor/quill/quill.js"></script>
<script src="/resources/admin/vendor/simple-datatables/simple-datatables.js"></script>
<script src="/resources/admin/vendor/tinymce/tinymce.min.js"></script>
<script src="/resources/admin/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="/resources/admin/js/main.js"></script>
</body>
</html>