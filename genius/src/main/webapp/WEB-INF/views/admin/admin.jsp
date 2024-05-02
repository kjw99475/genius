<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-04-25
  Time: 오후 1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="org.fullstack4.genius.Common.CommonUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin / main</title>
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

    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

        // Load the Visualization API and the corechart package.
        google.charts.load('current', {'packages':['corechart']});
        google.charts.load('current', {'packages':['bar']});

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);
        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.

        function drawChart() {
            // Create the data table.
            var categoryData1 = new google.visualization.DataTable();
            categoryData1.addColumn('string', 'Topping');
            categoryData1.addColumn('number', 'Slices');
            <c:if test="${!empty classMap.todayClass}">
            categoryData1.addRows([
                <c:forEach var="todayClass" items="${classMap.todayClass}">
                ['${todayClass['category_name']}', ${todayClass['result']}],
                </c:forEach>
            ]);
            </c:if>

            var categoryData3 = new google.visualization.DataTable();
            categoryData3.addColumn('string', 'Topping');
            categoryData3.addColumn('number', 'Slices');
            <c:if test="${!empty classMap.totalClass}">
            categoryData3.addRows([
                <c:forEach var="totalClass" items="${classMap.totalClass}">
                ['${totalClass['category_name']}', ${totalClass['result']}],
                </c:forEach>
            ]);
            </c:if>

            let color = ['#F58A94', '#F7A8A4', '#FED2B7', '#FFFAA8', '#DCEBC2', '#ADDCCA', '#A1C2FF', '#3D80D9', '#747EE8', '#A25FFF', '#E1C6FF', '#3E5969', '#CCC7C4', '#7F6657'];

            <c:if test="${!empty subjectMap.todaySubject}">
            var categoryData2 = new google.visualization.arrayToDataTable([
                ['과목', '매출', {role: 'style'}],
                <c:forEach var="todaySubject" items="${subjectMap.todaySubject}" varStatus="status">
                ['${todaySubject['category_name']}', ${todaySubject['result']}, color[${status.index}]],
                </c:forEach>
            ]);
            </c:if>
            <c:if test="${!empty subjectMap.todaySubject}">
            var categoryData4 = new google.visualization.arrayToDataTable([
                ['과목', '매출', {role: 'style'}],
                <c:forEach var="totalSubject" items="${subjectMap.totalSubject}" varStatus="status">
                ['${totalSubject['category_name']}', ${totalSubject['result']}, color[${status.index}]],
                </c:forEach>
            ]);
            </c:if>

            <c:if test="${!empty totalRevenueMap.dayTotalRevenue}">
            var dayData = google.visualization.arrayToDataTable([
                ['일자', '매출액'],
                <c:forEach var="dto" items="${totalRevenueMap.dayTotalRevenue}">
                ['${dto.date}', ${dto.totalRevenue}],
                </c:forEach>
            ]);
            </c:if>
            <c:if test="${!empty totalRevenueMap.monthTotalRevenue}">
            var monthData = google.visualization.arrayToDataTable([
                ['월', '매출액'],
                <c:forEach var="dto" items="${totalRevenueMap.monthTotalRevenue}">
                ['${dto.date}', ${dto.totalRevenue}],
                </c:forEach>
            ]);
            </c:if>
            <c:if test="${!empty totalRevenueMap.yearTotalRevenue}">
            var yearData = google.visualization.arrayToDataTable([
                ['연도', '매출액'],
                <c:forEach var="dto" items="${totalRevenueMap.yearTotalRevenue}">
                ['${dto.date}', ${dto.totalRevenue}],
                </c:forEach>
            ]);
            </c:if>

            // Set chart options
            var categoryOptions1 = {
                animation: {
                    startup: true,
                    duration: 500,
                    easing: 'in'
                },
                'width': 700,
                'height': 400,
                backgroundColor: {
                    fill: '#f8f8f8'
                },
                slices: {
                    0: {color: '#ADDCCA'},
                    1: {color: '#DCEBC2'},
                    2: {color: '#FED2B7'},
                    3: {color: '#F7A8A4'},
                    4: {color: '#F58A94'},
                    5: {color: '#E1C6FF'},
                    6: {color: '#FFFAA8'},
                    7: {color: '#A1C2FF'},
                    8: {color: '#CCC7C4'}
                },
                tooltip: {
                    ignoreBounds: 'false',
                    textStyle: {ontSize: 16},
                    showColorCode: true
                },
                legend: {
                    position: 'right',
                    textStyle: {fontSize: 14},
                    alignment: 'center'
                },
                pieSliceText: 'none',
                chartArea: {
                    height: 400
                }
            };
            var categoryOptions2 = {
                axisTitlesPosition: 'in',
                animation: {
                    startup: true,
                    duration: 400,
                    easing: 'in'
                },
                color: '#000',
                'width': 700,
                'height': 400,
                backgroundColor: {
                    fill: '#f8f8f8'
                },
                tooltip: {
                    ignoreBounds: 'false',
                    textStyle: {ontSize: 16},
                },
                legend: {
                    position: 'none',
                },
                chartArea: {
                    height: 330,
                    backgroundColor: '#FFFFFFEF'
                }
            };
            var revenueOptions = {
                animation: {
                    startup: true,
                    duration: 500,
                    easing: 'in'
                },
                curveType: 'function',
                legend: {position: 'bottom'},
                backgroundColor: {
                    fill: '#f8f8f8'
                },
                tooltip: {
                    ignoreBounds: 'false',
                    textStyle: {ontSize: 16},
                    showColorCode: true
                },
                height: 500,
                colors: ['#ADDCCA', '#DCEBC2'],
                lineWidth: 5
            };

            var categoryClassToday = new google.visualization.PieChart(document.getElementById('category_div1'));
            categoryClassToday.draw(categoryData1, categoryOptions1);
            var categorySubjectToday = new google.visualization.BarChart(document.getElementById('category_div2'));
            categorySubjectToday.draw(categoryData2, categoryOptions2);
            var categoryClassTotal = new google.visualization.PieChart(document.getElementById('category_div3'));
            categoryClassTotal.draw(categoryData3, categoryOptions1);
            var categorySubjectTotal = new google.visualization.BarChart(document.getElementById('category_div4'));
            categorySubjectTotal.draw(categoryData4, categoryOptions2);
            var revenueDay = new google.visualization.LineChart(document.getElementById('revenue_div1'));
            revenueDay.draw(dayData, revenueOptions);
            var revenueMonth = new google.visualization.LineChart(document.getElementById('revenue_div2'));
            revenueMonth.draw(monthData, revenueOptions);
            var revenueYear = new google.visualization.LineChart(document.getElementById('revenue_div3'));
            revenueYear.draw(yearData, revenueOptions);
        }
    </script>
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main id="main" class="main">
    <div class="pagetitle">
        <h1>Dashboard</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->
    <section class="section dashboard">
        <div class="row">
            <!-- Left side columns -->
            <div class="col-lg-12">
                <div class="row">
                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">
                            <div class="card-body">
                                <h4 class="card-title">판매량 <span>| 오늘 / 누적</span></h4>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-cart"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>${summary.todayOrderCnt}<small>건</small></h6>
                                    </div>
                                    <div class="ps-3">
                                        <h6 class="text-dark">/ ${summary.totalOrderCnt}<small>건</small></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Sales Card -->
                    <!-- Revenue Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card revenue-card">
                            <div class="card-body">
                                <h4 class="card-title">매출액 <span>| 오늘 / 누적</span></h4>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-credit-card-fill"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>${CommonUtil.comma(summary.todayOrderPrice)}<small>원</small></h6>
                                    </div>
                                    <div class="ps-3">
                                        <h6 class="text-dark">/ ${CommonUtil.comma(summary.totalOrderPrice)}<small>원</small></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Revenue Card -->
                    <!-- Customers Card -->
                    <div class="col-xxl-4 col-xl-12">
                        <div class="card info-card customers-card">
                            <div class="card-body">
                                <h4 class="card-title">고객수 <span>| 오늘 / 누적</span></h4>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>${summary.todayOrderMember}<small>명</small></h6>
                                    </div>
                                    <div class="ps-3">
                                        <h6 class="text-dark">/ ${summary.totalOrderMember}<small>명</small></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Customers Card -->

                    <!-- Recent Sales -->
                    <div class="col-12">
                        <div class="card recent-sales overflow-auto">
                            <div class="card-body">
                                <div class="card-title d-flex justify-content-between">
                                    <h4>카테고리 별 매출</h4>
                                    <ul class="nav nav-pills justify-content-end category-parent">
                                        <li class="nav-item">
                                            <a class="nav-link active-geni active" aria-current="page" href="#"  data-parent="category-parent" data-type="category"  data-target="todayCategory" onclick="showThis(this)">오늘</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-geni" href="#" data-parent="category-parent"  data-target="totalCategory" data-type="category" onclick="showThis(this)">누적</a>
                                        </li>
                                    </ul>
                                </div>
                                <div id="todayCategory" class="d-flex justify-content-center category" style="gap: 20px">
                                    <!--구글 차트 Start-->
                                    <div id="category_div1" class="rounded-4 overflow-hidden">
                                    </div>
                                    <div id="category_div2" class="rounded-4 overflow-hidden">
                                    </div>
                                    <!--구글 차트 End-->
                                </div>
                                <div id="totalCategory" class="d-flex justify-content-center category" style="gap: 20px;" >
                                    <!--구글 차트 Start-->
                                    <div id="category_div3" class="rounded-4 overflow-hidden">
                                    </div>
                                    <div id="category_div4" class="rounded-4 overflow-hidden">
                                    </div>
                                    <!--구글 차트 End-->
                                </div>
                            </div>
                        </div>
                    </div><!-- End Recent Sales -->

                    <!-- Top Selling -->
                    <div class="col-12">
                        <div class="card top-selling overflow-auto">
                            <div class="card-body pb-0">
                                <div class="card-title d-flex justify-content-between">
                                    <h4>베스트 셀러</h4>
                                </div>
                                <table class="table">
                                    <colgroup>
                                        <col class="w-5" />
                                        <col class="w-10" />
                                        <col class="w-25" />
                                        <col class="w-15" />
                                        <col class="w-15" />
                                        <col class="w-15" />
                                        <col class="w-25" />
                                    </colgroup>
                                    <thead>
                                        <tr class="text-center">
                                            <th class="bg-geni-dark text-white" scope="col">순위</th>
                                            <th colspan="2" class="bg-geni-dark text-white" scope="col">상품명</th>
                                            <th class="bg-geni-dark text-white" scope="col">상품코드</th>
                                            <th class="bg-geni-dark text-white" scope="col">판매 개수</th>
                                            <th class="bg-geni-dark text-white" scope="col">총 매출 액</th>
                                            <th class="bg-geni-dark text-white" scope="col">카테고리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${!empty bookDTOList}">
                                                <c:forEach var="bookDTO" items="${bookDTOList}" varStatus="status">
                                                    <tr>
                                                        <td class="fw-bold text-center">${status.index + 1}</td>
                                                        <td><a href="/admin/book/itemview?book_code=${bookDTO['book_code']}"><img class="w-100px" src="${bookDTO['book_img']}" alt=""></a></td>
                                                        <td><a href="/admin/book/itemview?book_code=${bookDTO['book_code']}" class="text-success fw-bold">${bookDTO['book_name']}</a></td>
                                                        <td class="text-center">${bookDTO['book_code']}</td>
                                                        <td class="fw-bold text-center">${bookDTO['sales_amount']}건</td>
                                                        <td class="text-center">${CommonUtil.comma(bookDTO['sales_price'])}원</td>
                                                        <td class="text-center">${bookDTO['class_name']} &gt; ${bookDTO['subject_name']}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td colspan="7">데이터가 없습니다.</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div><!-- End Top Selling -->

                    <!-- Reports -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title d-flex justify-content-between">
                                    <h4>매출 그래프</h4>
                                    <ul class="nav nav-pills justify-content-end revenue-parent">
                                        <li class="nav-item">
                                            <a class="nav-link text-geni" href="#" data-parent="revenue-parent" data-type="revenue" data-target="revenueDay" onclick="showThis(this)">일간</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link active-geni active" href="#" data-parent="revenue-parent" data-type="revenue" data-target="revenueMonth" onclick="showThis(this)">월간</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-geni" href="#" data-parent="revenue-parent" data-type="revenue" data-target="revenueYear" onclick="showThis(this)">연간</a>
                                        </li>
                                    </ul>
                                </div>
                                <div id="revenueDay" class="revenue">
                                    <!--구글 차트 Start-->
                                    <div id="revenue_div1" class="rounded-4 overflow-hidden">
                                    </div>
                                    <!--구글 차트 End-->
                                </div>
                                <div id="revenueMonth" class="revenue">
                                    <!--구글 차트 Start-->
                                    <div id="revenue_div2" class="rounded-4 overflow-hidden">
                                    </div>
                                    <!--구글 차트 End-->
                                </div>
                                <div id="revenueYear" class="revenue">
                                    <!--구글 차트 Start-->
                                    <div id="revenue_div3" class="rounded-4 overflow-hidden">
                                    </div>
                                    <!--구글 차트 End-->
                                </div>
                            </div>

                        </div>
                    </div><!-- End Reports -->

                </div>
            </div>
            <!-- End Left side columns -->
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
    // 영역 조작
    window.onload = ()=>{
        document.querySelector('#totalCategory').classList.add('d-none');
        for (let e of document.querySelectorAll('.revenue:not(#revenueMonth)')) {
            e.classList.add('d-none');
        }
    };
    function showThis(element) {
        event.preventDefault();
        event.stopPropagation();
        let target = element.dataset.target;
        let parent = element.dataset.parent;
        let type = element.dataset.type;
        let lists = document.querySelectorAll('.'+type);
        let buttons = document.querySelectorAll('.'+parent+' .nav-link');
        for(let button of buttons) {
            button.classList.remove('active-geni', 'active', 'text-white');
            button.classList.add('text-geni');
        }
        for(let list of lists) {
            list.classList.add('d-none');
        }
        element.classList.remove('text-geni');
        element.classList.add('active-geni', 'active');
        document.querySelector('#'+target).classList.remove('d-none');
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