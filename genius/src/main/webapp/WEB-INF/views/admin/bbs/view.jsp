<%--
  Created by IntelliJ IDEA.
  User: kjw
  Date: 2024-04-27
  Time: 오후 2:43
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
    <title>Admin / bbs - view</title>
    <!-- Favicons -->
    <link href="/resources/admin/img/favicon.png" rel="icon" type="image/png">
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

    <script src="/resources/jquery/jquery-3.7.1.js"></script>
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main id="main" class="main">

    <div class="pagetitle">
        <h1>자료실 상세</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item"><a href="/admin/bbs/list">자료실</a></li>
                <li class="breadcrumb-item active">자료실 상세</li>
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
                            <form method="post" id="frm_bbs_delete" action="/admin/bbs/delete">
                                <input type="hidden" name="bbs_idx" value="${bbsDTO.bbs_idx}">


                                <div class="row mb-3">
                                    <label for="category_code" class="col-md-4 col-lg-2 col-form-label label">카테고리</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="category_code" type="text" class="form-control" id="category_code"
                                               value="bc01" disabled>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="bbs_title" class="col-md-4 col-lg-2 col-form-label label">제목</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="bbs_title" type="text" class="form-control" id="bbs_title"
                                               value="${bbsDTO.bbs_title}" disabled>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="member_id" class="col-md-4 col-lg-2 col-form-label label">작성자</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="member_id" type="text" class="form-control" id="member_id"
                                               value="${bbsDTO.member_name}" disabled>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-4 col-lg-2 col-form-label label">파일</label>
                                    <div class="col-md-8 col-lg-9">
                                        <ul id="org-file-list" class="form-group d-flex flex-column m-0 p-0" style="gap:5px">
                                            <c:forEach items="${fileList}" var="file">
                                                <li class="card mb-1 shadow-none border border-gray d-flex flex-row justify-content-between p-2 fileListNodes"><span><a href="/bbs/qnaFileDownload?file_idx=${file.file_idx}&qna_idx=${qnaDTO.qna_idx}" >${file.original_name}</a></span></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-4 col-lg-2 col-form-label label">내용</label>
                                    <div class="col-md-8 col-lg-9 overflow-auto mx-2 border border-gray rounded p-2" style="max-height: 500px;">
                                        ${bbsDTO.bbs_contents}
                                    </div>
                                </div>


                                <div class="mt-5 d-flex justify-content-between">
                                    <div>
                                        <button type="button" class="btn btn-outline-success" onclick="location.href='/admin/bbs/list'">목록</button>
                                    </div>
                                    <div>
                                    <button type="button" class="btn btn-success me-2"
                                            onclick="location.href='/admin/bbs/contentmodify?bbs_idx=${bbsDTO.bbs_idx}'">
                                        수정
                                    </button>
                                    <button type="button" class="btn btn-outline-success" onclick="bbs_delete()">
                                        삭제
                                    </button>
                                    </div>
                                </div>
                            </form><!-- EndForm -->

                            <div class="mt-5">
                                <table class="table table-borderless text-start">
                                    <colgroup>
                                        <col width="20%">
                                        <col width="65%">
                                        <col width="15%">
                                    </colgroup>

                                    <c:choose>
                                        <c:when test="${postbbsDTO eq null}">
                                            <tr class=" border-bottom mb-0">
                                                <td>다음글</td>
                                                <td>다음 글이 없습니다.</td>
                                                <td></td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr class=" border-bottom mb-0" onclick="location.href='/admin/bbs/view?bbs_idx='+${postbbsDTO.bbs_idx}">
                                                <td>다음글</td>
                                                <td>${postbbsDTO.bbs_title}<c:if
                                                        test="${postbbsDTO.fileYN eq 'Y'}"><span
                                                        class="bi bi-paperclip"></span></c:if></td>
                                                <td>${postbbsDTO.reg_date}</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${prebbsDTO eq null}">
                                            <tr>
                                                <td>이전글</td>
                                                <td>이전 글이 없습니다.</td>
                                                <td></td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr onclick="location.href='/admin/bbs/view?bbs_idx='+${prebbsDTO.bbs_idx}">
                                                <td>이전글</td>
                                                <td>${prebbsDTO.bbs_title}
                                                    <c:if test="${prebbsDTO.fileYN eq 'Y'}"><span class="bi bi-paperclip"></span></c:if></td>
                                                <td>${prebbsDTO.reg_date}</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>

                                </table>
                            </div>
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
    <jsp:param name="menuGubun" value="bbs_bbs"/>
</jsp:include>
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>
<!--================ 푸터 End =================-->

<script>
    //삭제버튼
    const frm_delete = document.querySelector("#frm_bbs_delete");

    function bbs_delete() {
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