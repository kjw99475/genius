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
    <title>Title</title>
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
    <!-- 재고 리스트 -->
    <div class="col-12">
        <div class="card recent-sales overflow-auto">

            <div class="card-body">
                <h5 class="card-title">재고 관리 <span>| 리스트</span></h5>

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
                        <th scope="col">카테고리</th>
                        <th scope="col">판매상태</th>
                        <th scope="col">판매시작일</th>
                        <th scope="col">판매종료일</th>
                        <th scope="col">재고수량</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="bookDTOlist" var="bookDTO">
                    <tr>
                        <th scope="row">${bookDTO.book_code}</th>
                        <td>${bookDTO.book_name}</td>
                        <td>${bookDTO.price}</td>
                        <td>${bookDTO.discount_per}</td>
                        <td>${bookDTO.discount_price}</td>
                        <td>${bookDTO.author}</td>
                        <td>${bookDTO.publisher}</td>
                        <td>${bookDTO.category_code}</td>
                        <td><span class="badge bg-warning">${bookDTO.sales_status}</span></td><!--상태에 따라 bg-수정 -->
                        <td>${bookDTO.sales_start_date}</td>
                        <td>${bookDTO.sales_end_date}</td>
                        <td>${bookDTO.quantity}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>

        </div>
    </div><!-- End 재고 리스트 -->
</main>
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
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
