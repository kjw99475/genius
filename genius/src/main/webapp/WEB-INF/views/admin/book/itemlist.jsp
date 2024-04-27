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
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main id="main" class="main">
    <!-- 상품 리스트 -->
    <div class="col-12">
        <div class="card recent-sales overflow-auto">
            <div class="card-body">
                <h5 class="card-title">상품 관리 <span>| 리스트 </span></h5>

                <form>
                <div class="row mb-6">
                        <div class="col-1">
                            <select name="category_class_code" class="form-select" id="category_class_code">
                                <option value="" selected hidden>학년</option>
                                <option value="">전체</option>
                                <option value="c01">초1</option>
                                <option value="c02">초2</option>
                                <option value="c03">초3</option>
                                <option value="c04">초4</option>
                                <option value="c05">초5</option>
                                <option value="c06">초6</option>
                                <option value="c07">중1</option>
                                <option value="c08">중2</option>
                                <option value="c09">중3</option>
                                <option value="c10">고1</option>
                                <option value="c11">고2</option>
                                <option value="c12">고3</option>
                            </select>
                        </div>
                        <div class="col-1">
                            <select name="category_subject_code" class="form-select" id="category_subject_code">
                                <option value="" selected hidden>과목</option>
                                <option value="">전체</option>
                                <option value="s01">국어</option>
                                <option value="s02">영어</option>
                                <option value="s03">수학</option>
                                <option value="s04">사회</option>
                                <option value="s05">역사</option>
                                <option value="s06">도덕</option>
                                <option value="s07">과학</option>
                                <option value="s08">체육</option>
                                <option value="s09">예술</option>
                                <option value="s10">제2외국어</option>
                                <option value="s11">기술가정</option>
                                <option value="s12">음악</option>
                                <option value="s13">정보</option>
                                <option value="s14">교양</option>
                                <option value="s15">전문교과</option>
                                <option value="s16">기타</option>
                                <option value="s17">선택</option>
                                <option value="s18">실과</option>
                                <option value="s19">한문</option>
                                <option value="s20">미술</option>
                            </select>
                        </div>
                        <div class="col-1">
                            <select name="search_category" class="form-select" id="search_category">
                                <option value="" selected hidden>검색 옵션</option>
                                <option value="">전체</option>
                                <option value="book_name">책이름</option>
                                <option value="author">저자</option>
                                <option value="publisher">출판사</option>
                                <option value="book_code">상품번호</option>
                            </select>
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col-6">
                                    <input type="text" class="form-control" placeholder="검색어" name="search_word"
                                           id="search_word">
                                </div>
                                <div class="col">
                                    <button type="submit" class="bi bi-search btn btn-success"> 검색</button>
                                    <button type="button" class="btn btn-success"
                                            onclick="location.href='/admin/book/itemRegist'">등록
                                    </button>
                                </div>
                            </div>
                        </div>
                </div>
                </form>

                <div class="col-2 mb-2">
                    <select class="form-select">
                        <option value="5">5개씩 보기</option>
                        <option value="10" selected>10개씩 보기</option>
                        <option value="100">100개씩 보기</option>
                    </select>
                </div>

                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">상품번호</th>
                        <th scope="col">책이름</th>
                        <th scope="col">정가</th>
                        <th scope="col">할인율</th>
                        <th scope="col">할인가</th>
                        <th scope="col">저자</th>
                        <th scope="col">출판사</th>
                        <th scope="col">카테고리1</th>
                        <th scope="col">카테고리2</th>
                        <th scope="col">판매상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr onclick="location.href='/admin/book/itemview'">
                        <th scope="row">b0001</th>
                        <td>책이름</td>
                        <td>3000</td>
                        <td>10</td>
                        <td>2500</td>
                        <td>저자</td>
                        <td>천재교육</td>
                        <td>c01</td>
                        <td>s01</td>
                        <td><span class="badge bg-warning">판매중</span></td> <!--상태에 따라 bg-수정 -->
                    </tr>
                    <c:forEach items="${responseDTO.dtoList}" var="bookDTO">
                        <tr onclick="location.href='/admin/book/itemview'">
                            <th scope="row">${bookDTO.book_code}</th>
                            <td>${bookDTO.book_name}</td>
                            <td>${bookDTO.price}</td>
                            <td>${bookDTO.discount_per}</td>
                            <td>${bookDTO.discount_price}</td>
                            <td>${bookDTO.author}</td>
                            <td>${bookDTO.publisher}</td>
                            <td>${bookDTO.category_class_code}</td>
                            <td>${bookDTO.category_subject_code}</td>
                            <td><span class="badge bg-warning">${bookDTO.sales_status}</span></td> <!--상태에 따라 bg-수정 -->
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- END Table with stripped rows -->

                <div class="d-flex justify-content-center">
                    <!-- Pagination with icons -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav><!-- End Pagination with icons -->
                </div>
            </div>
        </div>
    </div><!-- End 상품 리스트 -->
    ${responseDTO.dtoList}
</main>
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>
<!--================ 푸터 End =================-->

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