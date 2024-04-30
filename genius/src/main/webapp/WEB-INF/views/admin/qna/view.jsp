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
    <title>Admin / QnA - view</title>
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
        <h1>QnA 상세</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item">QnA</li>
                <li class="breadcrumb-item active">QnA 상세</li>
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
                            <form method="post" id="frm_qna_delete" action="/admin/qna/delete">
                                <div class="row mb-3">
                                    <label for="category_code" class="col-md-4 col-lg-2 col-form-label">카테고리</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="category_code" type="text" class="form-control" id="category_code"
                                               value="qna" readonly>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="bbs_title" class="col-md-4 col-lg-2 col-form-label">제목</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="bbs_title" type="text" class="form-control" id="bbs_title"
                                               value="${qnaDTO.title}" readonly>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="member_id" class="col-md-4 col-lg-2 col-form-label">작성자</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="member_id" type="text" class="form-control" id="member_id"
                                               value="${qnaDTO.member_id}" readonly>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="reg_date" class="col-md-4 col-lg-2 col-form-label">작성일</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="reg_date" type="date" class="form-control" id="reg_date"
                                               value="${qnaDTO.reg_date}" readonly>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-4 col-lg-2 col-form-label">내용</label>
                                    <div class="col-md-8 col-lg-10">
                                        <p>${qnaDTO.contents}</p>
<%--                                        <input name="bbs_contents" type="text" class="form-control" id="bbs_contents"--%>
<%--                                               value="${qnaDTO.contents}" readonly>--%>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-4 col-lg-2 col-form-label">파일</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="file" type="file" class="form-control" id="file" value="" readonly>
                                    </div>
                                </div>

                                <div class="row mt-5">
                                    <div class="col-4"></div>
                                    <div class="col-4">
                                        <div class="text-center d-flex justify-content-center">
                                            <button type="button" class="btn btn-success me-2" onclick="location.href='/admin/qna/list'">
                                                답변 등록
                                            </button>
                                            <button type="button" class="btn btn-success" onclick="location.href='/admin/qna/list'">
                                                목록
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="text-center d-flex justify-content-end">
                                            <button type="button" class="btn btn-success me-2"
                                                    onclick="location.href='/admin/qna/contentmodify?qna_idx=${qnaDTO.qna_idx}'">수정
                                            </button>
                                            <button type="button" class="btn btn-success" onclick="qna_delete()">
                                                삭제
                                            </button>
                                        </div>
                                    </div>
                                </div>

                            </form><!-- EndForm -->

                            <div class="mt-5">
                                <table class="table">
                                    <tr>
                                        <td class="col-2">이전글</td>
                                        <c:if test="${prevDTO != null}">
                                            <td class="col-1">${param.no - 1}</td>
                                            <td class="col-6" onclick="location.href='/admin/qna/view?qna_idx=${prevDTO.qna_idx}&no=${param.no-1}'">${prevDTO.title}</td>
                                            <td class="col-3">${prevDTO.reg_date}</td>
                                        </c:if>
                                        <c:if test="${prevDTO == null}">
                                            <td colspan="3">이전 글이 없습니다.</td>
                                        </c:if>
                                    </tr>
                                    <tr>
                                        <td class="col-2">다음글</td>
                                        <c:if test="${nextDTO != null}">
                                            <td class="col-1">${param.no +1}</td>
                                            <td class="col-6"  onclick="location.href='/admin/qna/view?qna_idx=${nextDTO.qna_idx}&no=${param.no+1}'">${nextDTO.title}</td>
                                            <td class="col-3">${nextDTO.reg_date}</td>
                                        </c:if>
                                        <c:if test="${nextDTO == null}">
                                            <td colspan="3">다음 글이 없습니다.</td>
                                        </c:if>
                                    </tr>
                                </table>
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
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
<!--================ 푸터 End =================-->

<script>
    const frm_delete = document.querySelector("#frm_qna_delete");
    function qna_delete() {
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