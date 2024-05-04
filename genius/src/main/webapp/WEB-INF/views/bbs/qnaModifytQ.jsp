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
    <link href="/resources/css/summernote/summernote-lite.css" rel="stylesheet">
    <script src="/resources/js/summernote/summernote-lite.js"></script>

</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="menuGubun" value="bbs"/>
</jsp:include>
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main class="site-main">
    <section class="bg-img4 p-6" id="category">
        <div class="container h-100 p-3">
            <div class="blog-banner pt-1 pb-1">
                <div class="text-center ">
                    <h1 class=" text-white">수정</h1>
                    <span class=" text-white">Board Modify</span>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ End banner area ================= -->

    <!-- ================ 내용 Start ================= -->
    <section class="section-margin--small mb-5">
        <div class="container ">
            <form enctype="multipart/form-data" method="post" action="/bbs/qnaModifytQ" id="modifyFrm" name="modifyFrm">
                <input type="hidden" name="qna_idx" id="qna_idx", value="${qnaDTO.qna_idx}">
                <div class="border-gray mb-5 rounded bg-light pt-3 pb-3">
                    <div class="form-row ml-5 mt-3">
                        <div class="form-group col-md-5">
                            <label for="title">제목</label>
                            <input type="text" class="form-control" id="title" name="title" value="${qnaDTO.title}"/>
                            <div class="invalid-feedback" id="err_title" style="display: none">
                                2~60자 사이로 입력해주세요.
                            </div>
                        </div>
                        <div class="form-group col-md-5">
                            <label for="member_id">아이디</label>
                            <input type="text" class="form-control" id="member_id" value="${sessionScope.member_id}" name="member_id" readonly>
                        </div>
                    </div>
                    <div class="form-row ml-5">
                        <div class="form-group col-md-10 d-flex flex-column">
                            <label>첨부파일</label>
                            <div class="input-group mb-3">
                                <div class="custom-file">
                                    <input class="p-1" type="file" name="files" id="file"  multiple="multiple" onchange="fileList(this)">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ml-5">
                        <label>파일 리스트</label>
                        <ul id="file-list" class="form-group col-md-10 d-flex flex-column m-0 p-0" style="gap:5px">
                        </ul>
                    </div>
                    <div class="ml-5">
                        <label>기존 파일 리스트</label>
                        <ul id="org-file-list" class="form-group col-md-10 d-flex flex-column m-0 p-0" style="gap:5px">
                            <c:forEach items="${fileList}" var="file">
                                <li class="card d-flex flex-row justify-content-between p-2 fileListNodes"><span>${file.original_name}</span><span><a id="deleteButton" data-fileIdx="${file.file_idx}" class="text-danger font-weight-bold pr-2" href="#" onclick="deleteThisFile(this)">X</a></span></li>
                                <input id="file-${file.file_idx}" type="hidden" name="orgFiles" value="${file.file_idx}">
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <textarea id="summernote" name="contents">${qnaDTO.contents}</textarea>
                <div class="invalid-feedback" id="err_contents" style="display: none">
                    20자 이상 입력해주세요.
                </div>
                <div>
                    <div class="input-group d-flex justify-content-end mb-2">
                        <button type="button" class="btn btn-success mt-3 mr-2" onclick="location.href='/bbs/qnaList'">목록</button>
                        <button type="button" id="modifyBtn" class="btn btn-success mt-3">수정</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
</main>

<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!--================ 푸터 End =================-->
<script>
    <c:forEach items="${errors}" var="err">
    if(document.getElementById("err_${err.getField()}") != null) {
        document.getElementById("err_${err.getField()}").style.display = "block";
    }
    </c:forEach>
    let registBtn = document.getElementById("modifyBtn");
    registBtn.addEventListener("click", function(e){
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

        document.getElementById("modifyFrm").submit();
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

    // 파일 리스트 조작용(파일 추가)
    function fileList(element) {
        document.querySelector('#file-list').innerHTML = "";
        let fileList = document.querySelector('#file-list');
        console.log(element.files);
        for (let i=0; i < element.files.length; i++) {
            let list = document.createElement('li');
            list.classList.add('card', 'd-flex', 'flex-row', 'justify-content-between', 'p-2', 'fileListNodes');
            list.dataset.idx = i;
            list.innerHTML = '<span>' + element.files.item(i).name + '</span><span><a id="deleteButton" class="text-danger font-weight-bold pr-2" href="#" onclick="deleteThisFile(this)">X</a></span>'
            fileList.append(list);
        }
    }
    // 파일 리스트 개별 삭제용
    function deleteThisFile(element) {
        event.preventDefault();
        element.parentElement.parentElement.remove();
        let input = document.getElementById("file-"+element.dataset.fileidx);
        $(input).remove();
        const dataTransfer = new DataTransfer();
        let target = element.dataset.idx;
        let files = document.querySelector('#file').files;
        let fileArray = Array.from(files);
        fileArray.splice(target, 1);
        fileArray.forEach(file => {dataTransfer.items.add(file);});
        document.querySelector('#file').files = dataTransfer.files;
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

