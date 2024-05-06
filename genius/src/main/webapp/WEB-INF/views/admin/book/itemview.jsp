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
    <title>Admin / book - view</title>
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

    <script src="/resources/jquery/jquery-3.7.1.js"></script>

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
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item"><a href="/admin/book/itemlist">상품관리</a></li>
                <li class="breadcrumb-item active">상세</li>
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
                            <form name="frm_book_delete" method="post" id="frm_book_delete" action="/admin/book/delete">
                                <!-- <h5 class="card-title">Profile Details</h5> -->
                                <input type="hidden" name="book_idx" value="${bookDTO.book_idx}">
                                <input type="hidden" name="book_code" value="${bookDTO.book_code}">

                                <div class="row">
                                    <div class="col-lg-2 col-md-4 label">책이름</div>
                                    <div class="col-lg-9 col-md-8">
                                        <input name="book_name" type="text" class="form-control" id="book_name" value="${bookDTO.book_name}" disabled />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-2 col-md-4 label">정가</div>
                                    <div class="col-lg-9 col-md-8">
                                        <input name="price" type="text" class="form-control" id="price" value="${bookDTO.price}" disabled />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-2 col-md-4 label">할인율</div>
                                    <div class="col-lg-9 col-md-8">
                                        <input name="discount_per" type="text" class="form-control" id="discount_per" value="${bookDTO.discount_per}" disabled />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-2 col-md-4 label">저자</div>
                                    <div class="col-lg-9 col-md-8">
                                        <input name="author" type="text" class="form-control" id="author" value="${bookDTO.author}" disabled />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-2 col-md-4 label">출판일</div>
                                    <div class="col-lg-9 col-md-8">
                                        <input name="publication_date" type="date" class="form-control" id="publication_date" value="${bookDTO.publication_date}" disabled />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-2 col-md-4 label">출판사</div>
                                    <div class="col-lg-9 col-md-8">
                                        <input name="publisher" type="text" class="form-control" id="publisher" value="${bookDTO.publisher}" disabled />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-2 col-md-4 label ">이미지</div>
                                    <div class="col-lg-9 col-md-8">
                                        <img class=" border-gray" src="/resources/upload/book/${bookDTO.book_img}" alt="이미지">
                                    </div>
                                </div>

                            </form>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between mt-5">
                            <button type="button" class="btn btn-outline-success" onclick="location.href='/admin/book/itemlist'">목록</button>

                            <div class="text-center">
                                <button type="submit" class="btn btn-success" onclick="location.href='/admin/book/itemModify?book_code=${bookDTO.book_code}'">수정</button>
<%--                                <button type="button" class="btn btn-outline-success" id="btn_book_delete" onclick="book_delete();">삭제</button>--%>
                            </div>
                        </div>
                    </div><!-- End Bordered Tabs -->

                </div>
            </div>

        </div>
    </section>

</main><!-- End #main -->
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp">
    <jsp:param name="menuGubun" value="book"/>
</jsp:include>
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
