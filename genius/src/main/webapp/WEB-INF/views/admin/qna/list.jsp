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
    <title>Admin / QnA</title>
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
    <c:if test="${param.deleteOK == '1'}">
        <script>
            alert("삭제 되었습니다.");
        </script>
    </c:if>

    <div class="pagetitle">
        <h1>QnA 관리</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item active">QnA</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <form action="/admin/qna/list">
                                <div class="row me-2 ms-1 mb-4 mt-4 rounded-3 bg-light pt-1 pb-2">
                                    <div class="col">
                                        <div class="row mb-2">
                                            <label class="fw-bold p-3">검색 기간</label>
                                            <div class="row justify-content-start align-items-center">
                                                <div class="col-3">
                                                    <input class="form-control" type="date" name="search_date1" id="banner_start" value="${responseDTO['search_date1']}">
                                                </div>
                                                ~
                                                <div class="col-3">
                                                    <input class="form-control" type="date" name="search_date2" id="banner_end" value="${responseDTO['search_date2']}">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col">
                                                    <label class="fw-bold p-3 me-3">답변 상태 검색</label>
                                                    <label class="fw-bold p-3 ">키워드 검색</label>
                                                </div>
                                                <div class="d-flex align-items-center" style="gap: 10px">
                                                    <select name="status" id="answerStatus" class="form-select w-200px">
                                                        <option value="" <c:if test="${responseDTO.status eq ''}">selected</c:if>>전체</option>
                                                        <option value="0" <c:if test="${responseDTO.status eq '0'}">selected</c:if>>대기중</option>
                                                        <option value="1" <c:if test="${responseDTO.status eq '1'}">selected</c:if>>답변완료</option>
                                                    </select>

                                                    <select name="type" id="search_category" class="form-select w-200px">
                                                        <option value="0" <c:if test="${responseDTO.type eq '0'}">selected</c:if>>전체</option>
                                                        <option value="1" <c:if test="${responseDTO.type eq '1'}">selected</c:if>>작성자</option>
                                                        <option value="2" <c:if test="${responseDTO.type eq '2'}">selected</c:if>>제목</option>
                                                        <option value="3" <c:if test="${responseDTO.type eq '3'}">selected</c:if>>내용</option>
                                                    </select>
                                                    <input type="text" class="form-control" placeholder="검색어" name="search_word" id="search_word" value="${responseDTO['search_word']}">
                                                    <div class="w-200px">
                                                        <button type="submit" class="bi bi-search btn btn-success"> 검색</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-2 mb-2">
                                    <select name="page_size" class="form-select" onchange="this.form.submit()">
                                        <option value="10" <c:if test="${responseDTO.page_size eq '10'}">selected</c:if> >10개씩 보기</option>
                                        <option value="50" <c:if test="${responseDTO.page_size eq '50'}">selected</c:if> >50개씩 보기</option>
                                        <option value="100" <c:if test="${responseDTO.page_size eq '100'}">selected</c:if> >100개씩 보기</option>
                                    </select>
                                </div>
                            </form>
                        </div>



                        <form id="frm_qna_delete" method="post" action="/admin/qna/delete">
                            <!-- Table with stripped rows -->
                            <table class="w-100 table">

                                <colgroup>
                                    <col class="w-5">
                                    <col class="w-5">
                                    <col class="w-25">
                                    <col class="w-10">
                                    <col class="w-10">
                                    <col class="w-5">
                                    <col class="w-10">
                                    <col class="w-10">
                                </colgroup>
                                <thead>

                                <tr>
                                    <th scope="col" class="bg-geni-dark text-white">
                                        <div>
                                            <input id="chk_all" type="checkbox" class="form-check-input">
                                        </div>
                                    </th>
                                    <th scope="col" class="bg-geni-dark text-white">No</th>
                                    <th scope="col" class="bg-geni-dark text-white">제목</th>
                                    <th scope="col" class="bg-geni-dark text-white">작성자</th>
                                    <th scope="col" class="bg-geni-dark text-white">작성일</th>
                                    <th scope="col" class="bg-geni-dark text-white">조회수</th>
                                    <th scope="col" class="bg-geni-dark text-white">구분</th>
                                    <th scope="col" class="bg-geni-dark text-white">답변여부</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set value="${responseDTO.total_count}" var="total_count"/>

                                <c:forEach items="${responseDTO.dtoList}" var="qnaDTO" varStatus="i">
                                    <tr>
                                        <td><input class="chk_del form-check-input" type="checkbox" name="del_chk" value="${qnaDTO.qna_idx}" ></td>
                                        <td>${total_count - i.index - responseDTO.page_skip_count}</td>
                                        <td><a href="/admin/qna/view?qna_idx=${qnaDTO.qna_idx}">${qnaDTO.title}</a><c:if test="${qnaDTO.fileYN eq 'Y'}"><span class="bi bi-paperclip"></span></c:if></td>
                                        <td>${qnaDTO.member_name}</td>
                                        <td>${qnaDTO.reg_date}</td>
                                        <td>${qnaDTO.read_cnt}</td>
                                        <td>
                                            <c:if test="${qnaDTO.answerYN == 'N'}">
                                                <span class="badge bg-warning text-white" >질문글</span>
                                            </c:if>
                                            <c:if test="${qnaDTO.answerYN == 'Y'}">
                                                <span class="badge bg-success text-white" >답변글</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:if test="${qnaDTO.answerStatus == '0'}">
                                                <span class="badge bg-secondary text-white" >답변 대기</span>
                                            </c:if>
                                            <c:if test="${qnaDTO.answerStatus == '1'}">
                                                <span class="badge bg-info " >답변 완료</span>
                                            </c:if>
                                            <c:if test="${qnaDTO.answerStatus == '2'}">
                                                <span class="badge bg-success-subtle text-black" >답변</span>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!-- End Table with stripped rows -->
                        </form>

                        <div class="d-flex justify-content-end">
                            <button type="button" class="btn btn-success me-2"
                                    onclick="location.href='/admin/qna/contentregist'">등록</button>
                            <button type="button" class="btn btn-outline-success"
                                    onclick="qna_delete()">삭제</button>
                        </div>


                        <div class="d-flex justify-content-center">
                            <!-- Pagination with icons -->
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item <c:if test="${responseDTO.page_block_start - responseDTO.page_block_size < '1'}"> disabled</c:if>" >
                                        <a href="<c:if test="${responseDTO.page_block_start - responseDTO.page_block_size >= '1'}">${responseDTO.linked_params}&page=${responseDTO.page_block_start - responseDTO.page_block_size}</c:if>"
                                           class="page-link" aria-label="Previous">&laquo;
                                        </a>
                                    </li>
                                    <c:forEach begin="${responseDTO.page_block_start}"
                                               end="${responseDTO.page_block_end}"
                                               var="page_num">
                                        <c:choose>
                                            <c:when test="${responseDTO.page == page_num}">
                                                <li class="page-item active">
                                                    <a href="#" class="page-link">${page_num}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a href="${responseDTO.linked_params}&page=${page_num}" class="page-link">${page_num}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <li class="page-item <c:if test="${responseDTO.page_block_start + responseDTO.page_block_size > responseDTO.total_page}"> disabled</c:if>">
                                        <a href="<c:if test="${responseDTO.page_block_start + responseDTO.page_block_size < responseDTO.total_page}">${responseDTO.linked_params}&page=${responseDTO.page_block_start + responseDTO.page_block_size}</c:if>
                        " class="page-link" aria-label="Next">&raquo;</a>
                                    </li>
                                </ul>
                            </nav><!-- End Pagination with icons -->
                        </div>
                    </div>
                </div>

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


<script>
    // 삭제 스크립트
    const frm_delete = document.querySelector("#frm_qna_delete");
    function qna_delete() {
        let flag_delete = confirm("정말 삭제하시겠습니까?");
        if (flag_delete) {
            frm_delete.submit();
        }
    }

    // 체크박스 스크립트
    const chk_all = document.querySelector("#chk_all");
    const chk_group = document.querySelectorAll(".chk_del");

    chk_all.addEventListener('click', (e)=> {
        if ( chk_all.checked ) {
            for(let i=0; i<chk_group.length; i++) {
                chk_group[i].checked = true;
            }
        }
        else {
            for(let i=0; i<chk_group.length; i++) {
                chk_group[i].checked = false;
            }
        }
    })

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
