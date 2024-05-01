<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-04-25
  Time: 오후 5:26
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
    <title>Admin / banner</title>
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
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main id="main" class="main">

    <div class="pagetitle">
        <h1>배너 관리</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item">게시판 관리</li>
                <li class="breadcrumb-item active">배너 관리</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <form action="/admin/banner/bannerList">
                            <div class="row me-2 ms-1 mb-4 mt-4 rounded-3 bg-light pt-1 pb-2">
                                <div class="col">
                                    <div class="row mb-2">
                                        <label class="fw-bold p-3">게시기간</label>
                                        <div class="row justify-content-start align-items-center">
                                            <div class="col-3">
                                                <input class="form-control" type="date" name="search_data1" id="banner_start" value="${pageResponseDTO['search_data1']}">
                                            </div>
                                            ~
                                            <div class="col-3">
                                                <input class="form-control" type="date" name="search_data2" id="banner_end" value="${pageResponseDTO['search_data2']}">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col">
                                        <div class="row">
                                            <label class="fw-bold p-3">키워드 검색</label>
                                            <div class="d-flex align-items-center" style="gap: 10px">
                                                <select name="search_category" id="search_category" class="form-select w-200px">
                                                    <option value="all" <c:if test="${pageResponseDTO['search_category'] == null || pageResponseDTO['search_category'] == 'all'}">selected</c:if>>전체</option>
                                                    <option value="title" <c:if test="${pageResponseDTO['search_category'] == 'title'}">selected</c:if>>배너 이름</option>
                                                    <option value="member_id" <c:if test="${pageResponseDTO['search_category'] == 'member_id'}">selected</c:if>>등록아이디</option>
                                                    <option value="member_name" <c:if test="${pageResponseDTO['search_category'] == 'member_name'}">selected</c:if>>등록자</option>
                                                </select>
                                                <input type="text" class="form-control" placeholder="검색어" name="search_word" id="search_word" value="${pageResponseDTO['search_word']}">
                                                <div class="w-200px">
                                                    <button type="submit" class="bi bi-search btn btn-success"> 검색</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="d-flex justify-content-between">
                            <div class="col-2 mb-2">
                                <select name="page_size" class="form-select" onchange="modifyPageSize(this)">
                                    <option value="10" <c:if test="${pageResponseDTO['page_size'] == '10'}">selected</c:if>>10개씩 보기</option>
                                    <option value="50" <c:if test="${pageResponseDTO['page_size'] == '50'}">selected</c:if>>50개씩 보기</option>
                                    <option value="100" <c:if test="${pageResponseDTO['page_size'] == '100'}">selected</c:if>>100개씩 보기</option>
                                </select>
                            </div>
                            <div class="col-2 mb-2">
                                <div class="btn-group d-flex ">
                                    <button class="btn btn-outline-success" onclick="deleteThese()">삭제</button>
                                    <button class="btn btn-success">순서변경</button>
                                </div>
                            </div>
                        </div>
                        <!-- Table with stripped rows -->
                        <table class="w-100 table">
                            <colgroup>
                                <col class="w-5"/>
                                <col class="w-5"/>
                                <col class="w-25"/>
                                <col class="w-10"/>
                                <col class="w-10"/>
                                <col class="w-25"/>
                                <col class="w-5"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col" class="bg-geni-dark text-white" >
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="checkAll">
                                    </div>
                                </th>
                                <th scope="col" class="bg-geni-dark text-white" >No</th>
                                <th scope="col" class="bg-geni-dark text-white" >배너 이름</th>
                                <th scope="col" class="bg-geni-dark text-white" >등록자</th>
                                <th scope="col" class="bg-geni-dark text-white" >등록일</th>
                                <th scope="col" class="bg-geni-dark text-white" >게시 기간</th>
                                <th scope="col" class="bg-geni-dark text-white" >순서</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${!empty pageResponseDTO.dtoList}">
                                <c:set var="i" value="${pageResponseDTO['total_count'] - ((pageResponseDTO['page_size'])* (pageResponseDTO.page - 1))}" />
                                <c:forEach var="dtoList" items="${pageResponseDTO.dtoList}">
                                    <tr onclick="location.href='/admin/banner/bannerModify?banner_img_idx=${dtoList['banner_img_idx']}'">
                                        <td>
                                            <div class="form-check">
                                                <input class="form-check-input check-box" name="banner_img_idx" type="checkbox" value="${dtoList['banner_img_idx']}" id="check${dtoList['banner_img_idx']}" onclick="event.stopPropagation()">
                                            </div>
                                        </td>
                                        <td>${i}</td>
                                        <td>${dtoList['title']}</td>
                                        <td>${dtoList['member_name']}</td>
                                        <td>${dtoList['reg_date']}</td>
                                        <td>${dtoList['post_start_date']} ~ ${dtoList['post_end_date']}</td>
                                        <td>${dtoList['order']}</td>
                                    </tr>
                                    <c:set var="i" value="${i-1}" />
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty pageResponseDTO.dtoList}">
                                <tr>
                                    <td colspan="7">
                                        내용이 없습니다.
                                    </td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                        <!-- End Table with stripped rows -->

                        <div class="d-flex justify-content-end">
                            <button type="button" class="btn btn-success" onclick="location.href='/admin/banner/bannerRegist'">등록
                            </button>
                        </div>


                        <div class="d-flex justify-content-center">
                            <!-- Pagination with icons -->
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item <c:if test="${!pageResponseDTO.prev_page_flag}">disabled</c:if>">
                                        <a class="page-link" href="${pageResponseDTO.linked_params}&page=${((pageResponseDTO.page - pageResponseDTO.page_block_size) >= 1) ? (pageResponseDTO.page - pageResponseDTO.page_block_size) : 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <c:forEach var="li" begin="${pageResponseDTO.page_block_start}" end="${pageResponseDTO.page_block_end}">
                                        <li class="page-item <c:if test="${pageResponseDTO.page eq li}">active</c:if> ">
                                            <a class="page-link" href="${pageResponseDTO.linked_params}&page=${li}">${li}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item <c:if test="${!pageResponseDTO.next_page_flag}">disabled</c:if>">
                                        <a class="page-link" href="${pageResponseDTO.linked_params}&page=${(pageResponseDTO.page + pageResponseDTO.page_block_size) <= pageResponseDTO.total_page ? (pageResponseDTO.page + pageResponseDTO.page_block_size) : pageResponseDTO.total_page}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <!-- End Pagination with icons -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</main><!-- End #main -->
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>
<!--================ 푸터 End =================-->
<script>
    // 페이지 개수 보기
    function modifyPageSize(element) {
        let pageSize = element.value;
        let queryString = "?page_size='+pageSize+'&search_word=${pageResponseDTO['search_word']}&search_data1=${pageResponseDTO['search_data1']}&search_data2=${pageResponseDTO['search_data2']}&status=${pageResponseDTO['status']}";
        location.href = '/admin/banner/bannerList';
    }

    // 현재 페이지 전체 선택
    const checkAll = document.getElementById('checkAll');
    checkAll.addEventListener('change', ()=>{
        let checkYN = checkAll.checked;
        let checkboxes = document.querySelectorAll('.check-box');
        if(checkYN) {
            for (let checkbox of checkboxes) {
                checkbox.checked = true;
            }
        } else {
            for (let checkbox of checkboxes) {
                checkbox.checked = false;
            }
        }
    })

    // 삭제 POST
    function deleteThese() {
        let selectedItems = document.querySelectorAll('.check-box:checked');
        if (selectedItems.length > 0) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                let frm = document.createElement('form');
                frm.action = '/admin/banner/bannerDeleteAll'
                frm.method = 'post';
                frm.id = 'deleteFrm';
                for (let element of selectedItems) {
                    let input = document.createElement('input');
                    input.name = 'banner_img_idx';
                    input.type = 'hidden';
                    input.value = element.value;
                    frm.append(input);
                }
                document.body.append(frm);
                document.getElementById('deleteFrm').submit();
            }
        } else {
            alert("선택된 건이 없습니다.")
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
