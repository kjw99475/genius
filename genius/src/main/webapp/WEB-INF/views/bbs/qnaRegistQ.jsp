<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-04-25
  Time: 오후 1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>genius</title>
    <link rel="icon" href="/resources/img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="/resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="/resources/vendors/nice-select/nice-select.css">
    <link rel="stylesheet" href="/resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/vendors/owl-carousel/owl.carousel.min.css">

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <!-- include summernote css/js -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!--================ 헤더 End =================-->

<main class="site-main">
    <!-- ================ start banner area ================= -->
    <section class="bg-img4 p-6" id="category">
        <div class="container h-100 p-3">
            <div class="blog-banner pt-1 pb-1">
                <div class="text-center ">
                    <h1 class=" text-white">글쓰기</h1>
                    <span class=" text-white">Board Write</span>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ End banner area ================= -->

    <!-- ================ 내용 Start ================= -->
    <section class="section-margin--small mb-5">
        <div class="container ">
            <div>
                <div class="input-group d-flex justify-content-end mb-2">
                    <button type="button" class="btn btn-success mt-3 mr-2" onclick="location.href='/bbs/qnaList'">목록</button>
                    <button type="button" class="btn btn-success mt-3" onclick="location.href='/bbs/qnaRegistQ'">등록</button>
                </div>
            </div>
            <hr>
            <form method="post" action="/bbs/qnaRegistQ" id="registFrm" name="registFrm">
                <div class="border-gray mb-5">
                    <div class="form-row ml-5">
                        <div class="form-group col-md-5">
                            <label for="inputCity">제목</label>
                            <input type="text" class="form-control" id="inputCity" name="title" value=""/>
                        </div>
                        <div class="form-group col-md-5">
                            <label for="inputZip">${sessionScope.member_id}</label>
                            <input type="text" class="form-control" id="inputZip" value="${sessionScope.member_id}" name="member_id" readonly>
                        </div>
                    </div>
                    <div class="form-row ml-5">
                        <div class="form-group col-md-10 d-flex flex-column">
                            <%--                            <label for="inputState">게시판 종류를 선택하세요</label>--%>
                            <select id="inputState" class="form-control">
                                <option>Choose...</option>
                                <option>자유 게시판</option>
                                <option selected>QnA</option>
                            </select>
                        </div>
                    </div>
                </div>
                <textarea id="summernote" name="contents"></textarea>
                <div>
                    <div class="input-group d-flex justify-content-end mb-2">
                        <button type="button" class="btn btn-success mt-3 mr-2" onclick="location.href='/bbs/qnaList'">목록</button>
                        <button type="button" id="registBtn" class="btn btn-success mt-3">등록</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- ================ 내용 End ================= -->
</main>
<!--================ 본문 END =================-->
<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!--================ 푸터 End =================-->
<script>
    document.getElementById("registBtn").addEventListener("click", function(e){
        e.preventDefault();
        console.log(document.getElementById("inputCity").value)
        //document.getElementById("registFrm").submit();
    });

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
            ['view', ['fullscreen', 'codeview', 'help']]
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

<script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="/resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/resources/vendors/skrollr.min.js"></script>
<script src="/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/resources/vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="/resources/vendors/jquery.ajaxchimp.min.js"></script>
<script src="/resources/vendors/mail-script.js"></script>
<script src="/resources/js/main.js"></script>
</body>

