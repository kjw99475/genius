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
    <title>Admin / QnA - regist</title>
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
        <h1>QnA 등록</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item"><a href="/admin/qna/list">QnA</a></li>
                <li class="breadcrumb-item active">QnA 등록</li>
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
                            <form method="post" id="registFrm" action="/admin/qna/contentregist" enctype="multipart/form-data">
                                <div class="row mb-3">
                                    <label for="category_code" class="col-md-4 col-lg-2 col-form-label">카테고리</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="category_code" type="text" class="form-control" id="category_code"
                                               value="QnA" disabled>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="title" class="col-md-4 col-lg-2 col-form-label">제목</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="title" type="text" class="form-control" id="title"
                                               value="${qnaDTO.title}" placeholder="2~60자 사이로 입력해주세요.">
                                        <div class="invalid-feedback" id="err_title" style="display: none">
                                            2~60자 사이로 입력해주세요.
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="member_id" class="col-md-4 col-lg-2 col-form-label">작성자</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="member_id" type="text" class="form-control" id="member_id"
                                               value="${sessionScope.member_id}" readonly>
                                    </div>
                                </div>

                                <%--<div class="row mb-3">
                                    <label for="reg_date" class="col-md-4 col-lg-2 col-form-label">작성일</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="reg_date" type="date" class="form-control" id="reg_date"
                                               value="${qnaDTO.reg_date}">
                                    </div>
                                </div>--%>

                                <div class="row mb-3">
                                    <label class="col-md-4 col-lg-2 col-form-label">파일</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input class="p-1" type="file" name="files" id="file" multiple onchange="fileList(this)">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="file-list" class="col-md-4 col-lg-2 col-form-label">파일 리스트</label>
                                    <div class="col-md-8 col-lg-9">
                                        <ul id="file-list" class="form-group d-flex flex-column m-0 p-0">
                                        </ul>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="summernote" class="col-md-4 col-lg-2 col-form-label">내용</label>
                                    <div class="col-md-8 col-lg-10">
                                        <textarea id="summernote" name="contents" >${qnaDTO.contents}</textarea>
                                        <div class="invalid-feedback" id="err_contents" style="display: none">
                                            20자 이상 입력해주세요.
                                        </div>
                                    </div>

                                </div>

                                <div class="d-flex text-center mt-5 justify-content-end">
                                    <button type="submit" id="registBtn" class="btn btn-success me-2">등록</button>
                                    <button type="button" class="btn btn-light" onclick="location.href='/admin/qna/list'">취소</button>
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
    <jsp:param name="menuGubun" value="bbs_qna"/>
</jsp:include>
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
<!--================ 푸터 End =================-->

<!-- include summernote css/js -->
<link href="/resources/css/summernote/summernote-lite.css" rel="stylesheet">
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script>
    let registBtn = document.getElementById("registBtn");
    <c:forEach items="${errors}" var="err">
        if(document.getElementById("err_${err.getField()}") != null) {
            document.getElementById("err_${err.getField()}").style.display = "block";
        }
    </c:forEach>//서머노트
    $('#summernote').summernote({
        placeholder: '20자 이상 입력해주세요',
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
    registBtn.addEventListener("click",function(e){
        e.preventDefault();
        if(document.getElementById("title").value.trim().length < 2 ||document.getElementById("title").value.trim().length > 60){
            document.getElementById("err_title").style.display = "block";
            return;
        }
        else{
            document.getElementById("err_title").style.display = "none";
        }
        let contentsText = (document.getElementById("summernote").value.replace(/<[^>]+>/g, '')).replaceAll("&nbsp;",'').trim();

        if(contentsText.length <20){
            document.getElementById("err_contents").style.display = "block";
            return;
        }
        else{
            document.getElementById("err_contents").style.display = "none";
        }
        document.getElementById("registFrm").submit();
    });

    // 파일 리스트 조작용(파일 추가)
    function fileList(element) {
        document.querySelector('#file-list').innerHTML = "";
        let fileList = document.querySelector('#file-list');
        for (let i=0; i < element.files.length; i++) {
            let list = document.createElement('li');
            list.classList.add('card', 'mb-1', 'shadow-none', 'border', 'border-gray', 'd-flex', 'flex-row', 'justify-content-between', 'p-2', 'fileListNodes');
            list.dataset.idx = i;
            list.innerHTML = '<span>' + element.files.item(i).name + '</span><span><a id="deleteButton" class="text-danger font-weight-bold pr-2" href="#" onclick="deleteThisFile(this)">X</a></span>'
            fileList.append(list);
        }
    }
    // 파일 리스트 개별 삭제용
    function deleteThisFile(element) {
        event.preventDefault();
        element.parentElement.parentElement.remove();
        const dataTransfer = new DataTransfer();
        let target = element.dataset.idx;
        let files = document.querySelector('#file').files;
        let fileArray = Array.from(files);
        fileArray.splice(target, 1);
        fileArray.forEach(file => {dataTransfer.items.add(file);});
        document.querySelector('#file').files = dataTransfer.files;
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
