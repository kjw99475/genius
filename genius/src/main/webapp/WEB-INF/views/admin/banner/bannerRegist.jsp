<%--
  Created by IntelliJ IDEA.
  User: kjw
  Date: 2024-04-26
  Time: 오후 2:17
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
    <title>Title</title>
    <!-- Favicons -->
    <link href="/resources/admin/img/favicon.png" rel="icon">
    <link href="/resources/admin/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

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
<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main id="main" class="main">

    <div class="pagetitle">
        <h1>배너 등록</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item">배너</li>
                <li class="breadcrumb-item active">배너 등록</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
        <div class="row">
            <div class="col-xl-8">

                <div class="card">
                    <div class="card-body pt-3">

                        <div class="tab-pane fade show active profile-overview" id="profile-overview">

                            <!-- Form -->
                            <form method="post">
                                <div class="row mb-3">
                                    <label for="banner_name" class="col-md-4 col-lg-3 col-form-label">배너 이름</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="banner_name" type="text" class="form-control" id="banner_name"
                                               value="${bannerDTO.banner_name}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="banner_start" class="col-md-4 col-lg-3 col-form-label">게시 시작일</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="banner_start" type="date" class="form-control" id="banner_start"
                                               value="${bannerDTO.banner_start}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="banner_end" class="col-md-4 col-lg-3 col-form-label">게시 종료일</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="banner_end" type="date" class="form-control" id="banner_end"
                                               value="${bannerDTO.banner_end}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="banner_rank" class="col-md-4 col-lg-3 col-form-label">우선순위</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="banner_rank" type="text" class="form-control" id="banner_rank"
                                               value="${bannerDTO.banner_rank}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="banner_use" class="col-md-4 col-lg-3 col-form-label">사용여부</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="banner_use" type="text" class="form-control" id="banner_use"
                                               value="${bannerDTO.banner_use}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <input type="file">
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-success">등록</button>
                                </div>
                            </form><!-- End Form -->

                        </div>
                    </div>
                </div><!-- End Bordered Tabs -->
            </div>
        </div>
    </section>

</main><!-- End #main -->

<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>
<!--================ 푸터 End =================-->

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
