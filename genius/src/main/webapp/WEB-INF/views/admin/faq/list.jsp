<%--
  Created by IntelliJ IDEA.
  User: kjw
  Date: 2024-04-26
  Time: 오후 7:33
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
        <h1>FAQ 관리</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">메인</a></li>
                <li class="breadcrumb-item">게시판 관리</li>
                <li class="breadcrumb-item active">FAQ 관리</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">FAQ 관리</h5>
                        <p>FAQ를 관리하는 페이지 입니다.</p>
                        <div class="row">
                            <form>
                                <div class="col-3">
                                    <input type="checkbox" class="form-check-input" name="search_type" id="member_id"><label
                                        for="member_id" class="form-check-label">작성자</label>
                                </div>
                                <div class="col-3">
                                    <input type="checkbox" class="form-check-input" name="search_type" id="bbs_title"><label
                                        for="bbs_title" class="form-check-label">제목</label>
                                </div>
                                <div class="col-3">
                                    <input type="checkbox" class="form-check-input" name="search_type" id="bbs_contents"><label
                                        for="bbs_contents" class="form-check-label">내용</label>
                                </div>
                                <div class="col-3">
                                    <input type="text" class="input" placeholder="검색어" name="search_word" id="search_word">
                                    <button type="submit" class="bi bi-search">검색</button>
                                </div>
                            </form>
                        </div>

                        <!-- Table with stripped rows -->
                        <table class="table">
                            <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${bbsDTOlist ne null}">
                                <c:forEach items="${bbsDTOlist}" var="bbsDTO">
                                    <tr>
                                        <td>${bbsDTO.bbs_idx}</td>
                                        <td>${bbsDTO.bbs_title}</td>
                                        <td>${bbsDTO.member_id}</td>
                                        <td>${bbsDTO.reg_date}</td>
                                        <td>${bbsDTO.read_cnt}</td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            </tbody>
                            <tr>
                                <td>31</td>
                                <td>글제목입니당</td>
                                <td>작성자아이디입니다</td>
                                <td>작성일입니다</td>
                                <td>99</td>
                            </tr>

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
