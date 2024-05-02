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
            var data1 = new google.visualization.DataTable();
            data1.addColumn('string', 'Topping');
            data1.addColumn('number', 'Slices');
            data1.addRows([
                ['Mushrooms', 3] ,
                ['Onions', 1],
                ['Olives', 1],
                ['Zucchini', 1],
                ['Pepperoni', 2]
            ]);

            let color = ['#F58A94', '#F7A8A4', '#FED2B7', '#FFFAA8', '#DCEBC2', '#ADDCCA', '#A1C2FF', '#3D80D9', '#747EE8', '#A25FFF', '#E1C6FF', '#3E5969','#CCC7C4', '#7F6657'];

            var data2 = new google.visualization.arrayToDataTable([
                ['Year', 'Visitations', { role: 'style' } ],
                ['2004', 1000,'#ADDCCA'] ,
                ['2005', 1170,'#DCEBC2'],
                ['2006',  860,'#FED2B7'],
                ['2007', 1030, '#F7A8A4'],
                ['2007', 1030, '#FFFAA8']
            ]);

            var data3 = google.visualization.arrayToDataTable([
                ['Year', 'Sales', 'Expenses'],
                ['2004',  1000,      400],
                ['2005',  1170,      460],
                ['2006',  660,       1120],
                ['2007',  1030,      540]
            ]);

            // Set chart options
            var options1 = {
                animation: {
                    startup: true,
                    duration: 500,
                    easing: 'in'
                },
                'width':700,
                'height':400,
                backgroundColor: {
                    fill: '#f8f8f8'
                },
                chartArea: {
                    height: 300
                },
                slices: {
                    0: { color: '#ADDCCA' },
                    1: { color: '#DCEBC2' },
                    2: { color: '#FED2B7' },
                    3: { color: '#F7A8A4' },
                    4: { color: '#F58A94' },
                    5: { color: '#E1C6FF' },
                    6: { color: '#FFFAA8' },
                    7: { color: '#A1C2FF' },
                    8: { color: '#CCC7C4'}
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
                pieSliceText: 'none'
            };
            var options2 = {
                animation: {
                    startup : true,
                    duration: 400,
                    easing: 'in'
                },
                'width':700,
                'height':400,
                backgroundColor: {
                    fill: '#f8f8f8'
                },
                tooltip: {
                    ignoreBounds: 'false',
                    textStyle: {ontSize: 16},
                    showColorCode: true
                },
                legend: {
                    position: 'none'
                },
            };

            var options3 = {
                animation: {
                    startup: true,
                    duration: 500,
                    easing: 'in'
                },
                curveType: 'function',
                legend: { position: 'bottom' },
                backgroundColor: {
                    fill: '#f8f8f8'
                },
                tooltip: {
                    ignoreBounds: 'false',
                    textStyle: {ontSize: 16},
                    showColorCode: true
                },
                height: 500,
                colors : ['#ADDCCA', '#DCEBC2'],
                lineWidth: 5
            };

            var chart1 = new google.visualization.PieChart(document.getElementById('chart_div1'));
            chart1.draw(data1, options1);
            var chart2 = new google.visualization.BarChart(document.getElementById('chart_div2'));
            chart2.draw(data2, options2);
            var chart3 = new google.visualization.LineChart(document.getElementById('chart_div3'));
            chart3.draw(data3, options3);
        }
    </script>
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
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
                                <h5 class="card-title">판매량 <span>| 오늘 / 누적</span></h5>
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
                                <h5 class="card-title">매출액 <span>| 오늘 / 누적</span></h5>
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
                                <h5 class="card-title">고객수 <span>| 오늘 / 누적</span></h5>
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
                                    <h5>카테고리 별 매출</h5>
                                    <ul class="nav nav-pills justify-content-end">
                                        <li class="nav-item">
                                            <a class="nav-link active-geni active" aria-current="page" href="#" data-target="today" onclick="showThis(this)">오늘</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-geni" href="#" data-target="total" onclick="showThis(this)">누적</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="d-flex justify-content-center" style="gap: 20px">
                                    <!--구글 차트 Start-->
                                    <div id="chart_div1" class="rounded-4 overflow-hidden">
                                    </div>
                                    <div id="chart_div2" class="rounded-4 overflow-hidden">
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
                                    <h5>베스트 셀러</h5>
                                    <ul class="nav nav-pills justify-content-end">
                                        <li class="nav-item">
                                            <a class="nav-link active-geni active" aria-current="page" href="#" data-target="today" onclick="showThis(this)">오늘</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-geni" href="#" data-target="total" onclick="showThis(this)">누적</a>
                                        </li>
                                    </ul>
                                </div>

                                <table class="table table-borderless">
                                    <thead>
                                    <tr>
                                        <th scope="col">Preview</th>
                                        <th scope="col">상품명</th>
                                        <th scope="col">가격</th>
                                        <th scope="col">판매 개수</th>
                                        <th scope="col">판매 금액</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row"><a href="#"><img src="/resources/admin/img/product-1.jpg" alt=""></a></th>
                                        <td><a href="#" class="text-primary fw-bold">{상품명}</a></td>
                                        <td>\{가격}</td>
                                        <td class="fw-bold">{개수}</td>
                                        <td>\{판매 금액}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><a href="#"><img src="/resources/admin/img/product-2.jpg" alt=""></a></th>
                                        <td><a href="#" class="text-primary fw-bold">Exercitationem similique doloremque</a></td>
                                        <td>$46</td>
                                        <td class="fw-bold">98</td>
                                        <td>$4,508</td>
                                    </tr>
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
                                    <h5>월 별 매출</h5>
                                    <ul class="nav nav-pills justify-content-end">
                                        <li class="nav-item">
                                            <a class="nav-link active-geni active" aria-current="page" href="#" data-target="today" onclick="showThis(this)">오늘</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-geni" href="#" data-target="total" onclick="showThis(this)">누적</a>
                                        </li>
                                    </ul>
                                </div>

                                <!--구글 차트 Start-->
                                <div id="chart_div3" class="rounded-4 overflow-hidden">
                                </div>
                                <!--구글 차트 End-->

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