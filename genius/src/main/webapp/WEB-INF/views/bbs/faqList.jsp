<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-04-25
  Time: 오후 1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>genius</title>
    <link rel="icon" href="/resources/img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="/resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="/resources/vendors/nice-select/nice-select.css">
    <link rel="stylesheet" href="/resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/vendors/owl-carousel/owl.carousel.min.css">

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/swiper-bundle.min.css"/>

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main class="site-main">
    <section class="bg-img4 p-6" id="category">
        <div class="container h-100 p-3">
            <div class="blog-banner pt-1 pb-1">
                <div class="text-center ">
                    <h1 class=" text-white">자주묻는 질문</h1>
                    <span class=" text-white">FAQ</span>
                </div>
            </div>
        </div>
    </section>
    <section class="section-margin--small mb-5">
        <div class="container">
            <div class="filter-bar">
                <div class="input-group d-flex justify-content-end">
                    <div class="sorting d-flex">
                        <select name="sales_status">
                            <option value="1">전체</option>
                            <option value="2">작성자</option>
                            <option value="3">제목</option>
                            <option value="4">내용</option>
                        </select>
                        <div class="col-auto">
                            <input type="date" class="form-control" id="startDay" name="startDay">
                        </div>
                        <div>~</div>
                        <div class="col-auto">
                            <input type="date" class="form-control" id="endDay" name="endDay">
                        </div>
                        <div class="filter-bar-search">
                            <input type="text" placeholder="Search" style="width: 100%">
                        </div>
                        <div>
                            <button type="button" class="btn btn-success">검색</button>
                        </div>
                    </div>
                </div>
<%--                <div class="row justify-content-end align-items-center pb-3">--%>
<%--                    <div class="col-auto">--%>
<%--                        <input type="date" class="form-control" id="startDay" name="startDay">--%>
<%--                    </div>--%>
<%--                    <div>~</div>--%>
<%--                    <div class="col-auto">--%>
<%--                        <input type="date" class="form-control" id="endDay" name="endDay">--%>
<%--                    </div>--%>
<%--                    <div>--%>
<%--                        <button class="btn btn-success" type="button">조회</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
            <table class="table table-hover">
                <thead class="filter-bar">
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col" style="width:50%">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                    <th scope="col">조회</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">6</th>
                    <td>Mark<span class="ti-file"></span></td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>12</td>
                </tr>
                <tr>
                    <th scope="row">5</th>
                    <td>Jacob<span class="ti-file"></span></td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>12</td>
                </tr>
                <tr>
                    <th scope="row">4</th>
                    <td>Larry the<span class="ti-file"></span></td>
                    <td>Thornton</td>
                    <td>@twitter</td>
                    <td>12</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>12</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>12</td>
                </tr>
                <tr>
                    <th scope="row">1</th>
                    <td>Larry the Bird</td>
                    <td>Thornton</td>
                    <td>@twitter</td>
                    <td>12</td>
                </tr>
                </tbody>
            </table>
        </div>
        <nav class="blog-pagination justify-content-center d-flex">
            <ul class="pagination">
                <li class="page-item">
                    <a href="#" class="page-link" aria-label="Previous">&lt;</a>
                </li>
                <li class="page-item">
                    <a href="#" class="page-link">01</a>
                </li>
                <li class="page-item active">
                    <a href="#" class="page-link">02</a>
                </li>
                <li class="page-item">
                    <a href="#" class="page-link">03</a>
                </li>
                <li class="page-item">
                    <a href="#" class="page-link">04</a>
                </li>
                <li class="page-item">
                    <a href="#" class="page-link">09</a>
                </li>
                <li class="page-item">
                    <a href="#" class="page-link" aria-label="Next">&gt;</a>
                </li>
            </ul>
        </nav>
    </section>
</main>
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!--================ 푸터 End =================-->

<script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="/resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/resources/vendors/skrollr.min.js"></script>
<script src="/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/resources/vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="/resources/vendors/jquery.ajaxchimp.min.js"></script>
<script src="/resources/vendors/mail-script.js"></script>
<script src="/resources/js/main.js"></script>
</body>

