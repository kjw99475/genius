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

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
                <li class="breadcrumb-item"><a href="/admin/banner/bannerList">배너 관리</a></li>
                <li class="breadcrumb-item active">배너 등록</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body pt-3">
                        <div class="tab-pane fade show active profile-overview" id="profile-overview">
                            <!-- Form -->
                            <form enctype="multipart/form-data" method="post" action="/admin/banner/bannerRegist">
                                <div class="row mb-3">
                                    <label for="title" class="col-md-4 col-lg-2 col-form-label">배너 이름</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="title" type="text" class="form-control" id="title"
                                               value="${bannerDTO['title']}">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="banner_start" class="col-md-4 col-lg-2 col-form-label">게시 시작일</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="post_start_date" type="date" class="form-control" id="banner_start"
                                               value="${bannerDTO['post_start_date']}">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="banner_end" class="col-md-4 col-lg-2 col-form-label">게시 종료일</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="post_end_date" type="date" class="form-control" id="banner_end"
                                               value="${bannerDTO['post_end_date']}">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="banner_rank" class="col-md-4 col-lg-2 col-form-label">순서</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="order" type="text" class="form-control" id="banner_rank"
                                               value="순서는 등록 후 리스트에서 변경할 수 있습니다." disabled>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="file" class="col-md-4 col-lg-2 col-form-label">파일</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="file" type="file" class="form-control" id="file" value="" onchange="changeImg(event)">
                                    </div>
                                </div>

                                <div class="row m-1">
                                    <div class="p-1 border-gray bg-light text-dark rounded-top-2">
                                        <span class="d-block p-1 text-center">이미지 미리보기</span>
                                    </div>

                                    <div class="p-1 border-gray rounded-bottom-2" style="min-height: 200px">
                                        <img id="preview" class="d-block w-100" src="/resources/img/no_image.png">
                                    </div>
                                </div>
                                <div class="mt-5 d-flex justify-content-between">
                                    <c:set var="linked_params">
                                        <c:forEach var="key" items="${paramValues.keySet()}" varStatus="status">
                                            <c:if test="${key != 'banner_img_idx'}"><c:if test="${status.first}">${key}=${param[key]}</c:if><c:if test="${! status.first}">&${key}=${param[key]}</c:if></c:if>
                                        </c:forEach>
                                    </c:set>
                                    <div>
                                        <button type="button" class="btn btn-outline-success" onclick="location.href = '/admin/banner/bannerList?${linked_params}'">목록</button>
                                    </div>
                                    <div>
                                        <button type="submit" class="btn btn-success">등록</button>
                                        <button type="button" class="btn btn-outline-success" id="btn_banner_delete" onclick="delete('${bannerDTO['banner_img_idx']}')">삭제</button>
                                    </div>
                                </div>
                            </form>
                            <!-- End Form -->
                        </div>
                    </div>
                </div>
                <!-- End Bordered Tabs -->
            </div>
        </div>
    </section>

</main><!-- End #main -->

<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp">
    <jsp:param name="menuGubun" value="bbs_banner"/>
</jsp:include>
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>
<!--================ 푸터 End =================-->
<script>
    // 미리보기 이미지 변경
    function changeImg(e) {
        let files = e.target.files;
        let reader = new FileReader();
        reader.onload = (e)=>{
            $('#preview').attr('src', e.target.result);
        }
        reader.readAsDataURL(files[0]);
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
