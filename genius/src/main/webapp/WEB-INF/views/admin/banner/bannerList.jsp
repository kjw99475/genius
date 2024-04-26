<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-04-25
  Time: 오후 5:26
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
    <title>Admin / banner</title>
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
        <h1>배너 관리</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admin/admin">메인</a></li>
                <li class="breadcrumb-item">게시판 관리</li>
                <li class="breadcrumb-item active">배너 관리</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">배너 관리</h5>
                        <p>배너를 관리하는 페이지 입니다.</p>

                        <form>
                            <div class="row mb-3">
                                <div class="col">
                                    <div class="row mb-3">
                                        <div class="col-3"><input class="form-control" type="date" name="search_type" id="banner_start">
                                        </div>
                                        ~
                                        <div class="col-3"><input class="form-control" type="date" name="search_type" id="banner_end">
                                        </div>

                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-1">
                                        <select name="search_category" id="search_category" class="form-select">
                                            <option selected>전체</option>
                                            <option value="banner_name">배너 이름</option>
                                            <option value="banner_use">사용 여부</option>
                                        </select>
                                    </div>

                                    <div class="col-6">
                                        <input type="text" class="form-control" placeholder="검색어" name="search_word" id="search_word">
                                    </div>
                                    <div class="col">
                                        <button type="submit" class="bi bi-search btn btn-success"> 검색</button>
                                        <button type="button" class="btn btn-success"
                                                onclick="location.href='/admin/banner/bannerRegist'">등록</button>
                                    </div>
                                </div>

                            </div>
                        </form>


                        <!-- Table with stripped rows -->
                        <table class="table " style="overflow: scroll;">
                            <thead>
                            <tr>
                                <th>배너 이름</th>
                                <th>게시 기간</th>
                                <th>우선순위</th>
                                <th>사용여부</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${bammerDTOList}" var="bannerDTO">
                            <tr onclick="location.href='/admin/banner/bannerModify'">
                                <td>${bannerDTO.banner_name}</td>
                                <td>${bannerDTO.banner_start} ~ ${bannerDTO.banner_end}</td>
                                <td>${bannerDTO.banner_rank}</td>
                                <td>${bannerDTO.banner_use}</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!-- End Table with stripped rows -->
                    </div>
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
