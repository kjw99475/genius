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
    <style>
        th{
            border-right:1px solid #d7d5d5;
            background-color:#fbfafa;
        }
    </style>
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main class="site-main">
    <!-- ================ start banner area ================= -->
    <section class="bg-img4 p-6" id="category">
        <div class="container h-100 p-3">
            <div class="blog-banner pt-1 pb-1">
                <div class="text-center ">
                    <h1 class=" text-white">질문</h1>
                    <span class=" text-white">Question</span>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ End banner area ================= -->
    <section class="section-margin--small mb-5">
        <div class="container">
            <table class="table border-gray">
                <colgroup>
                    <col style="width:130px;"/>
                    <col style="width:auto;"/>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">게시글 번호</th>
                    <td>1</td>
                </tr>
                <tr>
                    <th scope="row">제목</th>
                    <td>초등 평가문제 과학 6-2 (이상원)_정답 및 해설</td>
                </tr>
                <tr>
                    <th scope="row">작성자</th>
                    <td> 천재교과서 <span>(아이디)</span> </td>
                </tr>
                <tr>
                    <th scope="row">작성일</th>
                    <td>2023-10-06</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div><div class=""><p>초등 평가문제 과학 6-2 (이상원)_정답 및 해설</p><p><br></p></div></div>
                    </td>
                </tr>
                <tr>
                    <th class="bg-table text-center" scope="row">첨부파일</th>
                    <td><button type="button" class="rounded-circle bg-lightgray btn btn-light"><i class="ti-file"></i></button> <a href="#none" onclick="javascript:alert('파일한개');">초등평가_과학6-2_이상원(15개정)_정답.pdf</a> </td>
                </tr>
                <tr>
                    <th class="bg-table text-center" scope="row">첨부파일</th>
                    <td><button type="button" class="rounded-circle bg-lightgray btn btn-light"><i class="ti-files"></i></button> <a href="#none" onclick="javascript:alert('파일두개 이상')">파일 두개 이상</a> </td>
                </tr>
                <tr>
                    <th scope="row">조회수</th>
                    <td><span>12</span>
                    </td>
                </tr>
                </tbody>
            </table>
            <button type="button" class="btn btn-success" onclick="location.href='/bbs/qnaList'">목록</button>
        </div>
        <div class="container mt-3">
            <table class="table border-gray">
                <colgroup>
                    <col style="width:130px;"/>
                    <col style="width:auto;"/>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row"><strong>이전글</strong><span class="ti-angle-up"></span></th>
                    <td class="card-product__title"><a href="#">이전글</a></td>
                </tr>
                <tr>
                    <th scope="row"><strong>다음글</strong><span class="ti-angle-down"></span></th>
                    <td class="card-product__title"><a href="#">다음글</a></td>
                </tr>
                </tbody>
            </table>
        </div>
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

