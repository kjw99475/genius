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
    <title>Admin / book</title>
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

    <script src="/resources/jquery/jquery-3.7.1.js"></script>
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main id="main" class="main">

    <div class="pagetitle">
        <h1>상품 관리</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item active">상품 관리</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <!-- 상품 리스트 -->
    <div class="col-12">
        <div class="card recent-sales overflow-auto">
            <div class="card-body">

                <form action="/admin/book/itemlist">
                    <div class="row me-2 ms-1 mb-4 mt-4 rounded-3 bg-light pt-1 pb-2">
                        <div class="col">
                            <div class="row mb-2">
                                <label class="fw-bold p-3">검색 기간</label>
                                <div class="row justify-content-start align-items-center">
                                    <div class="col-3">
                                        <input class="form-control" type="date" name="search_data1" id="banner_start" value="${responseDTO['search_data1']}">
                                    </div>
                                    ~
                                    <div class="col-3">
                                        <input class="form-control" type="date" name="search_data2" id="banner_end" value="${responseDTO['search_data2']}">
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <label class="fw-bold p-3" style="margin-right: 45px">주문상태</label>
                                        <label class="fw-bold p-3" style="margin-right: 80px">학년</label>
                                        <label class="fw-bold p-3" style="margin-right: 80px">과목</label>
                                        <label class="fw-bold p-3">키워드 검색</label>
                                    </div>
                                    <div class="d-flex align-items-center" style="gap: 10px">
                                        <select name="status" class="form-select sales_status w-200px">
                                            <option value="0" selected>전체</option>
                                            <option value="1" >판매중</option>
                                            <option value="2" >판매준비중</option>
                                            <option value="3" >판매종료</option>
                                            <option value="4" >품절</option>
                                        </select>
                                        <select name="class_code" class="form-select w-200px" id="category_class_code">
                                            <option value="">전체</option>
                                            <c:forEach items="${classList}" var="list">
                                                <option value="${list.category_code}"
                                                        <c:if test="${list.category_code eq responseDTO.class_code}">
                                                            selected
                                                        </c:if>
                                                >${list.name}</option>
                                            </c:forEach>
                                        </select>

                                        <select name="subject_code" class="form-select w-200px" id="category_subject_code">
                                            <option value="">전체</option>
                                            <c:forEach items="${subjectList}" var="list">
                                                <option value="${list.category_code}"
                                                        <c:if test="${list.category_code eq responseDTO.subject_code}">
                                                            selected
                                                        </c:if>
                                                >${list.name}</option>
                                            </c:forEach>
                                        </select>

                                        <select name="type" class="form-select w-200px" id="search_category">
                                            <option value="0" <c:if test="${responseDTO.type == '0'}"> selected</c:if>>전체</option>
                                            <option value="1" <c:if test="${responseDTO.type == '1'}"> selected</c:if>>책이름</option>
                                            <option value="2" <c:if test="${responseDTO.type == '2'}"> selected</c:if>>작성자</option>
                                            <option value="3" <c:if test="${responseDTO.type == '3'}"> selected</c:if>>출판사</option>
                                            <option value="4" <c:if test="${responseDTO.type == '4'}"> selected</c:if>>상품번호</option>
                                        </select>


                                        <input type="text" class="form-control" placeholder="검색어" name="search_word" id="search_word" value="${responseDTO['search_word']}">
                                        <div class="w-200px">
                                            <button type="submit" class="bi bi-search btn btn-success"> 검색</button>
                                        </div>
                                        <div class="w-200px">
                                            <button type="button" class="btn btn-success"
                                                    onclick="location.href='/admin/book/itemRegist'">등록
                                            </button>
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
                            <option value="10" <c:if test="${responseDTO['page_size'] == '10'}">selected</c:if>>10개씩 보기</option>
                            <option value="50" <c:if test="${responseDTO['page_size'] == '50'}">selected</c:if>>50개씩 보기</option>
                            <option value="100" <c:if test="${responseDTO['page_size'] == '100'}">selected</c:if>>100개씩 보기</option>
                        </select>
                    </div>
                </div>

                <table class="table table-bordered w-100">
                    <thead>
                        <tr>
                            <th scope="col" class="bg-geni-dark text-white">상품번호</th>
                            <th scope="col" class="bg-geni-dark text-white">책이름</th>
                            <th scope="col" class="bg-geni-dark text-white">정가</th>
                            <th scope="col" class="bg-geni-dark text-white">할인율</th>
                            <th scope="col" class="bg-geni-dark text-white">할인가</th>
                            <th scope="col" class="bg-geni-dark text-white">저자</th>
                            <th scope="col" class="bg-geni-dark text-white">출판사</th>
                            <th scope="col" class="bg-geni-dark text-white">카테고리-학년</th>
                            <th scope="col" class="bg-geni-dark text-white">카테고리-과목</th>
                            <th scope="col" class="bg-geni-dark text-white">판매상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${responseDTO.dtoList}" var="bookDTO">
                        <tr>
                            <th scope="row">${bookDTO.book_code}</th>
                            <td><a href="/admin/book/itemview?book_code=${bookDTO.book_code}">${bookDTO.book_name}</a></td>
                            <td>${bookDTO.price}</td>
                            <td>${bookDTO.discount_per}</td>
                            <td>${bookDTO.discount_price}</td>
                            <td>${bookDTO.author}</td>
                            <td>${bookDTO.publisher}</td>
                            <td>${bookDTO.class_name}</td>
                            <td>${bookDTO.subject_name}</td>
                            <td><span class="badge
                                <c:choose>
                                    <c:when test="${bookDTO.sales_status == '1'}">
                                        bg-success
                                    </c:when>
                                    <c:when test="${bookDTO.sales_status == '2'}">
                                        bg-warning
                                    </c:when>
                                    <c:when test="${bookDTO.sales_status == '3'}">
                                        bg-secondary
                                    </c:when>
                                    <c:when test="${bookDTO.sales_status == '4'}">
                                        bg-danger
                                    </c:when>
                                </c:choose>
                                ">
                                <c:choose>
                                    <c:when test="${bookDTO.sales_status == '1'}">
                                        판매중
                                    </c:when>
                                    <c:when test="${bookDTO.sales_status == '2'}">
                                        판매 준비중
                                    </c:when>
                                    <c:when test="${bookDTO.sales_status == '3'}">
                                        판매 종료
                                    </c:when>
                                    <c:when test="${bookDTO.sales_status == '4'}">
                                        품절
                                    </c:when>
                                </c:choose>
                                </span></td> <!--상태에 따라 bg-수정 -->
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- END Table with stripped rows -->

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
    </div><!-- End 상품 리스트 -->
</main>
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp">
    <jsp:param name="menuGubun" value="book"/>
</jsp:include>
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>
<!--================ 푸터 End =================-->

<script>
    // 페이지 개수 보기
    function modifyPageSize(element) {
        let pageSize = element.value;
        let queryString = '?page_size='+pageSize+"&search_data1=${responseDTO['search_data1']}&search_data2=${responseDTO['search_data2']}&class_code=${responseDTO['class_code']}&subject_code=${responseDTO['subject_code']}&type=${responseDTO['type']}&search_word=${responseDTO['search_word']}";
        location.href = '/admin/book/itemlist'+queryString;
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