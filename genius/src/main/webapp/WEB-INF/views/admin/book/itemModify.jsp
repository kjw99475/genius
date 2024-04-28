<%--
  Created by IntelliJ IDEA.
  User: kjw
  Date: 2024-04-26
  Time: 오후 3:35
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
    <title>Admin / book - modify</title>
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
        <h1>상품 수정</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item"><a href="/admin/book/itemlist">상품관리</a></li>
                <li class="breadcrumb-item active">수정</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
        <div class="row">
            <div class="col-xl-12">

                <div class="card">
                    <div class="card-body pt-3">

                        <div class="tab-pane fade show active profile-overview" id="profile-overview">

                            <!-- Profile Edit Form -->
                            <form id="frm_book_modify" method="post" action="/admin/book/itemModify">
                                <div class="row mb-3">
                                    <label for="book_name" class="col-md-4 col-lg-2 col-form-label">책 이름</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="book_name" type="text" class="form-control" id="book_name"
                                               value="${bookDTO.book_name}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="price" class="col-md-4 col-lg-2 col-form-label">정가</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="price" type="text" class="form-control" id="price"
                                               value="${bookDTO.price}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="discount_per" class="col-md-4 col-lg-2 col-form-label">할인율</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="discount_per" type="text" class="form-control" id="discount_per" value="${bookDTO.discount_per}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="author" class="col-md-4 col-lg-2 col-form-label">저자</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="author" type="text" class="form-control" id="author"
                                               value="${bookDTO.author}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="publication_date" class="col-md-4 col-lg-2 col-form-label">출판일</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="publication_date" type="date" class="form-control" id="publication_date"
                                               value="${bookDTO.publication_date}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="publisher" class="col-md-4 col-lg-2 col-form-label">출판사</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="publisher" type="text" class="form-control" id="publisher"
                                               value="${bookDTO.publisher}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="file" class="col-md-4 col-lg-2 col-form-label">책 이미지</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="file" type="file" class="form-control" id="file"
                                               value="${bookDTO.book_img}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="category_class_code" class="col-md-4 col-lg-2 col-form-label">카테고리 - 학년</label>
                                    <div class="col-md-8 col-lg-10">
                                        <select name="category_class_code" class="form-control" id="category_class_code" value="${bookDTO.category_class_code}">
                                            <c:forEach items="${classList}" var="list">
                                                <option value="${list.category_code}"
                                                    <c:if test="${list.category_code eq bookDTO.category_class_code}">
                                                        selected
                                                    </c:if>
                                                >${list.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="category_subject_code" class="col-md-4 col-lg-2 col-form-label">카테고리 - 과목</label>
                                    <div class="col-md-8 col-lg-10">
                                        <select name="category_subject_code" class="form-control" id="category_subject_code" value="${bookDTO.category_subject_code}">
                                            <c:forEach items="${subjectList}" var="list">
                                                <option value="${list.category_code}"
                                                        <c:if test="${list.category_code eq bookDTO.category_subject_code}">
                                                            selected
                                                        </c:if>
                                                >${list.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="contents" class="col-md-4 col-lg-2 col-form-label">목차</label>
                                    <div class="col-md-8 col-lg-10">
                                            <textarea name="contents" class="form-control" id="contents"
                                                      style="height: 100px; resize: none;">${bookDTO.contents}</textarea>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="book_info" class="col-md-4 col-lg-2 col-form-label">소개글</label>
                                    <div class="col-md-8 col-lg-10">
                                            <textarea name="book_info" class="form-control" id="book_info"
                                                      style="height: 100px; resize: none;">${bookDTO.book_info}</textarea>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="isbn" class="col-md-4 col-lg-2 col-form-label">ISBN</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="isbn" type="text" class="form-control" id="isbn" value="${bookDTO.isbn}"
                                               maxlength="13">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-4 col-lg-2 col-form-label">상품소개영상</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="video" type="file" class="form-control" id="Phone" value="video"
                                               maxlength="13">
                                    </div>
                                </div>

                                <div class="text-center mt-5">
                                    <button type="submit" class="btn btn-success me-2">수정 완료</button>
                                    <button type="button" class="btn btn-light" onclick="history.back()">취소</button>
                                </div>
                            </form><!-- End Profile Edit Form -->

                        </div>
                    </div>
                </div><!-- End Bordered Tabs -->
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
