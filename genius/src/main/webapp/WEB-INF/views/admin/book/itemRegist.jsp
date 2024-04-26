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
    <title>Admin / book - regist</title>
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
                <li class="breadcrumb-item"><a href="index.html">메인</a></li>
                <li class="breadcrumb-item">상품관리</li>
                <li class="breadcrumb-item active">수정</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
        <div class="row">
            <div class="col-xl-8">

                <div class="card">
                    <div class="card-body pt-3">

                        <div class="tab-pane fade show active profile-overview" id="profile-overview">

                            <!-- Profile Edit Form -->
                            <form id="frm_book_regist" method="post" action="/admin/book/regist">
                                <div class="row mb-3">
                                    <label for="book_name" class="col-md-4 col-lg-3 col-form-label">책 이름</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="book_name" type="text" class="form-control" id="book_name"
                                               value="${bookDTO.book_name}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="price" class="col-md-4 col-lg-3 col-form-label">정가</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="price" type="text" class="form-control" id="price"
                                               value="${bookDTO.price}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="discount_per" class="col-md-4 col-lg-3 col-form-label">할인율</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="discount_per" type="text" class="form-control" id="discount_per" value="${bookDTO.discount_per}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="author" class="col-md-4 col-lg-3 col-form-label">저자</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="author" type="text" class="form-control" id="author"
                                               value="${bookDTO.author}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="publication_date" class="col-md-4 col-lg-3 col-form-label">출판일</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="publication_date" type="date" class="form-control" id="publication_date"
                                               value="${bookDTO.publication_date}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="publisher" class="col-md-4 col-lg-3 col-form-label">출판사</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="publisher" type="text" class="form-control" id="publisher"
                                               value="${bookDTO.publisher}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="book_img" class="col-md-4 col-lg-3 col-form-label">책 이미지</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input type="file" name="book_img" id="book_img">
                                        <img src="https://mall.chunjaetext.co.kr/web/product/small/202402/ec403c214546c9879a3ba8cc4119e817.jpg"
                                             alt="Profile">
                                        <div class="pt-2">
                                            <a href="#" class="btn btn-primary btn-sm"
                                               title="Upload new profile image"><i class="bi bi-upload"></i></a>
                                            <a href="#" class="btn btn-danger btn-sm"
                                               title="Remove my profile image"><i class="bi bi-trash"></i></a>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="category_class_code" class="col-md-4 col-lg-3 col-form-label">카테고리 - 학년</label>
                                    <div class="col-md-8 col-lg-9">
                                        <select name="category_class_code" class="form-control" id="category_class_code">
                                            <option value="" selected hidden>학년</option>
                                            <option value="c01">초1</option>
                                            <option value="c02">초2</option>
                                            <option value="c03">초3</option>
                                            <option value="c04">초4</option>
                                            <option value="c05">초5</option>
                                            <option value="c06">초6</option>
                                            <option value="c07">중1</option>
                                            <option value="c08">중2</option>
                                            <option value="c09">중3</option>
                                            <option value="c10">고1</option>
                                            <option value="c11">고2</option>
                                            <option value="c12">고3</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="category_subject_code" class="col-md-4 col-lg-3 col-form-label">카테고리 - 과목</label>
                                    <div class="col-md-8 col-lg-9">
                                        <select name="category_subject_code" class="form-control" id="category_subject_code">
                                            <option value="" selected hidden>과목</option>
                                            <option value="s01">국어</option>
                                            <option value="s02">영어</option>
                                            <option value="s03">수학</option>
                                            <option value="s04">사회</option>
                                            <option value="s05">역사</option>
                                            <option value="s06">도덕</option>
                                            <option value="s07">과학</option>
                                            <option value="s08">체육</option>
                                            <option value="s09">예술</option>
                                            <option value="s10">제2외국어</option>
                                            <option value="s11">기술가정</option>
                                            <option value="s12">음악</option>
                                            <option value="s13">정보</option>
                                            <option value="s14">교양</option>
                                            <option value="s15">전문교과</option>
                                            <option value="s16">기타</option>
                                            <option value="s17">선택</option>
                                            <option value="s18">실과</option>
                                            <option value="s19">한문</option>
                                            <option value="s20">미술</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="contents" class="col-md-4 col-lg-3 col-form-label">목차</label>
                                    <div class="col-md-8 col-lg-9">
                                            <textarea name="contents" class="form-control" id="contents"
                                                      style="height: 100px">${bookDTO.contents}</textarea>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="book_info" class="col-md-4 col-lg-3 col-form-label">소개글</label>
                                    <div class="col-md-8 col-lg-9">
                                            <textarea name="book_info" class="form-control" id="book_info"
                                                      style="height: 100px">${bookDTO.book_info}</textarea>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="isbn" class="col-md-4 col-lg-3 col-form-label">ISBN</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="isbn" type="text" class="form-control" id="isbn" value="${bookDTO.isbn}"
                                               maxlength="13">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-4 col-lg-3 col-form-label">상품소개영상</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="video" type="file" class="form-control" id="Phone" value="video"
                                               maxlength="13">
                                    </div>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-success">수정 완료</button>
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
