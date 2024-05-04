<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-04-25
  Time: 오후 5:27
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
    <title>Admin / member</title>
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

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main id="main" class="main">
    <div class="pagetitle">
        <h1>회원 관리</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item active">회원</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <form action="/admin/member/memberList" method="get">
                                <div class="row me-2 ms-1 mb-4 mt-4 rounded-3 bg-light pt-1 pb-2">
                                    <div class="row mb-2">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col">
                                                    <label class="fw-bold p-3">키워드 검색</label>
                                                </div>
                                                <div class="d-flex align-items-center" style="gap: 10px">
                                                    <select name="search_category" id="search_category" class="form-select w-200px">
                                                        <option value="all" <c:if test="${pageResponseDTO['search_category'] == null || pageResponseDTO['search_category'] == 'all'}">selected</c:if>>전체</option>
                                                        <option value="member_id" <c:if test="${pageResponseDTO['search_category'] == 'member_id'}">selected</c:if>>회원 ID</option>
                                                        <option value="member_name" <c:if test="${pageResponseDTO['search_category'] == 'member_name'}">selected</c:if>>회원 이름</option>
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
                            </form>
                        </div>
                        <div class="d-flex justify-content-between row">
                            <div class="col-2 mb-2">
                                <select name="page_size" class="form-select" onchange="modifyPageSize(this)">
                                    <option value="10" <c:if test="${pageResponseDTO['page_size'] == '10'}">selected</c:if>>10개씩 보기</option>
                                    <option value="50" <c:if test="${pageResponseDTO['page_size'] == '50'}">selected</c:if>>50개씩 보기</option>
                                    <option value="100" <c:if test="${pageResponseDTO['page_size'] == '100'}">selected</c:if>>100개씩 보기</option>
                                </select>
                            </div>
                        </div>
                        <!-- Table with stripped rows -->
                        <div class="row p-2">
                            <table class="table table-bordered">
                                <colgroup>
                                    <col class="w-10" />
                                    <col class="w-10" />
                                    <col class="w-10" />
                                    <col class="w-20" />
                                    <col class="w-20" />
                                    <col class="w-20" />
                                    <col class="w-10" />
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col" class="bg-geni-dark text-white">NO</th>
                                    <th scope="col" class="bg-geni-dark text-white">회원번호</th>
                                    <th scope="col" class="bg-geni-dark text-white">구분</th>
                                    <th scope="col" class="bg-geni-dark text-white">회원아이디</th>
                                    <th scope="col" class="bg-geni-dark text-white">회원이름</th>
                                    <th scope="col" class="bg-geni-dark text-white">가입일</th>
                                    <th scope="col" class="bg-geni-dark text-white">상태</th>
                                    <th scope="col" class="bg-geni-dark text-white">관리</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${!empty pageResponseDTO.dtoList}">
                                    <c:set var="i" value="${pageResponseDTO['total_count'] - ((pageResponseDTO['page_size'])* (pageResponseDTO.page - 1))}" />
                                    <c:forEach var="dtoList" items="${pageResponseDTO.dtoList}">
                                        <tr>
                                            <td class="align-middle tex">${i}</td>
                                            <td class="align-middle">${dtoList['member_idx']}</td>
                                            <td class="align-middle">
                                                <c:choose>
                                                    <c:when test="${dtoList['admin_YN'] == 'Y'}">
                                                        관리자
                                                    </c:when>
                                                    <c:otherwise>
                                                        일반
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="align-middle">${dtoList['member_id']}</td>
                                            <td class="align-middle">${dtoList['member_name']}</td>
                                            <td class="align-middle">${dtoList['reg_date']}</td>
                                            <td class="align-middle">${dtoList.status}</td>
                                            <td class="flex justify-content-end">
                                                <button type="button" class="btn btn-success me-2" onclick="location.href = '/admin/member/memberView${pageResponseDTO['linked_params']}&page=${pageResponseDTO['page']}&member_id=${dtoList['member_id']}'">수정</button>
                                                <button type="button" class="btn btn-outline-success" onclick="leave('${dtoList['member_id']}')">탈퇴</button>
                                            </td>
                                        </tr>
                                        <c:set var="i" value="${i-1}" />
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty pageResponseDTO.dtoList}">
                                    <tr>
                                        <td colspan="8">
                                            내용이 없습니다.
                                        </td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                            <!-- End Table with stripped rows -->
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
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp">
    <jsp:param name="menuGubun" value="member"/>
</jsp:include>
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
<!--================ 푸터 End =================-->
<script>
    // 페이지 개수 보기
    function modifyPageSize(element) {
        let pageSize = element.value;
        location.href = '/admin/member/memberList?page_size='+pageSize+'&search_word=${pageResponseDTO['search_word']}&search_data1=${pageResponseDTO['search_data1']}&search_data2=${pageResponseDTO['search_data2']}';
    }

    // 탈퇴
    function leave(member_id) {
        if(confirm("정말로 탈퇴하실건가요?")) {
            let frm = document.createElement('form');
            let input_target = document.createElement('input');
            frm.action = '/admin/member/memberLeave';
            frm.method = 'post';
            frm.id = 'leaveFrm';
            input_target.name = 'target';
            input_target.value = member_id;
            input_target.type = 'hidden';
            frm.append(input_target);
            <c:if test="${!empty pageResponseDTO['page_size']}">
            let input_page_size = document.createElement('input');
            input_page_size.name = 'page_size';
            input_page_size.value = "${pageResponseDTO['page_size']}";
            input_page_size.type = 'hidden';
            frm.append(input_page_size);
            </c:if>
            <c:if test="${!empty pageResponseDTO['search_category']}">
            let input_search_category = document.createElement('input');
            input_search_category.name = 'search_category';
            input_search_category.value = "${pageResponseDTO['search_category']}";
            input_search_category.type = 'hidden';
            frm.append(input_search_category);
            </c:if>
            <c:if test="${!empty pageResponseDTO['search_word']}">
            let input_search_word = document.createElement('input');
            input_search_word.name = 'search_word';
            input_search_word.value ="${pageResponseDTO['search_word']}";
            input_search_word.type = 'hidden';
            frm.append(input_search_word);
            </c:if>
            <c:if test="${!empty pageResponseDTO['search_data1']}">
            let input_search_data1 = document.createElement('input');
            input_search_data1.name = 'search_data1';
            input_search_data1.value = "${pageResponseDTO['search_data1']}";
            input_search_data1.type = 'hidden';
            frm.append(input_search_data1);
            </c:if>
            <c:if test="${!empty pageResponseDTO['search_data2']}">
            let input_search_data2 = document.createElement('input');
            input_search_data2.name = 'search_data2';
            input_search_data2.value = "${pageResponseDTO['search_data2']}";
            input_search_data2.type = 'hidden';
            frm.append(input_search_data2);
            </c:if>
            <c:if test="${!empty pageResponseDTO['page']}">
            let input_page = document.createElement('input');
            input_page.name = 'page';
            input_page.value = "${pageResponseDTO['page']}";
            input_page.type = 'hidden';
            frm.append(input_page);
            </c:if>
            let input_link = document.createElement('input');
            input_link.name = 'link';
            input_link.value = "list";
            input_link.type = 'hidden';
            frm.append(input_link);
            document.body.append(frm);
            document.querySelector('#leaveFrm').submit();
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
