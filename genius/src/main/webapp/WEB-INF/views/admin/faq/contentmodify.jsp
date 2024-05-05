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
    <title>Admin / F.A.Q - modify</title>
    <!-- Favicons -->
    <link href="/resources/admin/img/favicon.png" rel="icon" type="image/png">
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
        <h1>F.A.Q 수정</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item"><a href="/admin/faq/list">F.A.Q</a></li>
                <li class="breadcrumb-item active">F.A.Q 수정</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
        <div class="row">
            <div class="col-xl-12">

                <div class="card">
                    <div class="card-body pt-3">

                        <div class="tab-pane fade show active profile-overview" id="profile-overview">

                            <!--Form -->
                            <form method="post" id="modifyFrm" action="/admin/faq/contentmodify">
                                <input type="hidden" name="bbs_idx" value="${bbsDTO.bbs_idx}">
                                <div class="row mb-3">
                                    <label for="category_code" class="col-md-4 col-lg-2 col-form-label">카테고리</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="category_code" type="text" class="form-control" id="category_code"
                                               value="bc02" readonly>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="bbs_title" class="col-md-4 col-lg-2 col-form-label">제목</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="bbs_title" type="text" class="form-control" id="bbs_title"
                                               value="${bbsDTO.bbs_title}">
                                        <div class="invalid-feedback" id="err_bbs_title" style="display: none">
                                            2~60자 사이로 입력해주세요.
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="member_id" class="col-md-4 col-lg-2 col-form-label">작성자</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="member_id" type="text" class="form-control" id="member_id"
                                               value="${bbsDTO.member_id}" readonly>
                                    </div>
                                </div>

                                <%--<div class="row mb-3">
                                    <label for="reg_date" class="col-md-4 col-lg-2 col-form-label">작성일</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="reg_date" type="date" class="form-control" id="reg_date"
                                               value="${bbsDTO.reg_date}" >
                                    </div>
                                </div>--%>

<%--                                <div class="row mb-3">--%>
<%--                                    <label for="file" class="col-md-4 col-lg-2 col-form-label">파일</label>--%>
<%--                                    <div class="col-md-8 col-lg-9">--%>
<%--                                        <c:choose>--%>
<%--                                            <c:when test="${bbsDTO.fileYN == 'Y'}">--%>
<%--                                                <input name="file" type="file" class="form-control" id="file"--%>
<%--                                                       value="${bbsDTO.fileYN}">--%>
<%--                                            </c:when>--%>
<%--                                            <c:otherwise>--%>
<%--                                                <input name="file" type="file" class="form-control" id="file">--%>
<%--                                            </c:otherwise>--%>
<%--                                        </c:choose>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                                <div class="row mb-3">
                                    <label for="summernote" class="col-md-4 col-lg-2 col-form-label">내용</label>
                                    <div class="col-md-8 col-lg-9">
                                        <textarea id="summernote" name="bbs_contents">${bbsDTO.bbs_contents}</textarea>
                                        <div class="invalid-feedback" id="err_bbs_contents" style="display: none">
                                            20자 이상 입력해주세요.
                                        </div>
                                    </div>
                                </div>

                                <div class="d-flex text-center mt-5 justify-content-end">
                                    <button type="submit" id="modifyBtn" class="btn btn-success me-2">수정 완료</button>
                                    <button type="button" class="btn btn-outline-success" onclick="location.href='/admin/faq/view?bbs_idx=${bbsDTO.bbs_idx}'">취소</button>
                                </div>
                            </form><!-- EndForm -->

                        </div>
                    </div>
                </div><!-- End Bordered Tabs -->
            </div>
        </div>
    </section>

</main><!-- End #main -->
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp">
    <jsp:param name="menuGubun" value="bbs_faq"/>
</jsp:include>
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
<!--================ 푸터 End =================-->

<!-- include summernote css/js -->
<link href="/resources/css/summernote/summernote-lite.css" rel="stylesheet">
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script>
    <c:forEach items="${errors}" var="err">
    if(document.getElementById("err_${err.getField()}") != null) {
        document.getElementById("err_${err.getField()}").style.display = "block";
    }
    </c:forEach>
    let modifyBtn = document.getElementById("modifyBtn");
    modifyBtn.addEventListener("click",function(e){
        e.preventDefault();
        if(document.getElementById("bbs_title").value.trim().length < 2 ||document.getElementById("bbs_title").value.trim().length > 60){
            document.getElementById("err_bbs_title").style.display = "block";
            return;
        }
        else{
            document.getElementById("err_bbs_title").style.display = "none";
        }
        let contentsText = (document.getElementById("summernote").value.replace(/<[^>]+>/g, '')).replaceAll("&nbsp;",'').trim();

        if(contentsText.length <20){
            document.getElementById("err_bbs_contents").style.display = "block";
            return;
        }
        else{
            document.getElementById("err_bbs_contents").style.display = "none";
        }
        document.getElementById("modifyFrm").submit();
    });
    //서머노트
    $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 500,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['codeview', 'help']]
        ]
    });

    function imageUploader(file, el) {
        var formData = new FormData();
        formData.append('file', file);
        $.ajax({
            data : formData,
            type : "POST",
            //아래 url 수정 필요
            url : '/',
            contentType : false,
            processData : false,
            enctype : 'multipart/form-data',
            success : function(data) {
                $(el).summernote('insertImage', "${pageContext.request.contextPath}/assets/images/upload/"+data, function($image) {
                    $image.css('width', "100%");
                });
                // 값이 잘 넘어오는지 콘솔 확인 해보셔도됩니다.
                console.log(data);
            }
        });
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
