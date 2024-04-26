<%--
  Created by IntelliJ IDEA.
  User: kjw
  Date: 2024-04-26
  Time: 오후 3:22
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
        <h1>상품 상세</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">메인</a></li>
                <li class="breadcrumb-item">상품관리</li>
                <li class="breadcrumb-item active">상세</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
        <div class="row">

            <div class="col-xl-8">

                <div class="card">
                    <div class="card-body pt-3">
                        <div class="tab-content pt-2">
                            <div class="tab-pane fade show active profile-overview" id="profile-overview">
                            <form name="frm_book_delete" id="frm_book_delete" action="/admin/book/bookDelete">
                                <!-- <h5 class="card-title">Profile Details</h5> -->

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label ">상품번호</div>
                                    <div class="col-lg-9 col-md-8">${bookDTO.book_code}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">책이름</div>
                                    <div class="col-lg-9 col-md-8">${bookDTO.book_name}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">정가</div>
                                    <div class="col-lg-9 col-md-8">${bookDTO.price}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">할인율</div>
                                    <div class="col-lg-9 col-md-8">${bookDTO.discount_per}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">할인가</div>
                                    <div class="col-lg-9 col-md-8">${bookDTO.discount_price}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">저자</div>
                                    <div class="col-lg-9 col-md-8">${bookDTO.author}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">출판사</div>
                                    <div class="col-lg-9 col-md-8">${bookDTO.publisher}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">카테고리</div>
                                    <div class="col-lg-9 col-md-8">${bookDTO.category_code}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">판매상태</div>
                                    <div class="col-lg-9 col-md-8">${bookDTO.sales_status}</div>
                                </div>
                            </form>
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-success" onclick="location.href='admin-product-modify.html'">수정</button>
                            <button type="button" class="btn btn-success" id="btn_book_delete" onclick="book_delete();">삭제</button>
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
    const frm_delete = document.querySelector("#frm_book_delete");
    function book_delete() {
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
