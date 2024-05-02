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
                    <h1 class=" text-white">질문과 답변</h1>
                    <span class=" text-white">QnA</span>
                </div>
            </div>
        </div>
    </section>
    <section class="section-margin--small mb-5">
        <div class="container">
            <div class="filter-bar">
                <form action="/bbs/qnaList" method="get" id="frmSearch">
                    <div class="input-group d-flex justify-content-end">
                        <div class="sorting d-flex">
                            <select name="type">
                                <option value="0" <c:if test="${responseDTO.type == '0'}"> selected</c:if>>전체</option>
                                <option value="1" <c:if test="${responseDTO.type == '1'}"> selected</c:if>>작성자</option>
                                <option value="2" <c:if test="${responseDTO.type == '2'}"> selected</c:if>>제목</option>
                                <option value="3" <c:if test="${responseDTO.type == '3'}"> selected</c:if>>내용</option>
                            </select>
                            <div class="col-auto">
                                <input type="date" class="form-control" id="startDay" value="${responseDTO.search_date1}" name="search_date1">
                            </div>
                            <div>~</div>
                            <div class="col-auto">
                                <input type="date" class="form-control" id="endDay"value="${responseDTO.search_date2}" name="search_date2">
                            </div>
                            <div class="filter-bar-search">
                                <input type="text" name="search_word" value="${responseDTO.search_word}" placeholder="Search" style="width: 100%">
                            </div>
                            <div>
                                <button type="submit" class="btn btn-success">검색</button>
                            </div>
                        </div>
                    </div>
                </form>
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
                <c:set value="${responseDTO.total_count}" var="total_count"/>

                <c:forEach items="${responseDTO.dtoList}" var="qnaDTO" varStatus="i">
                    <c:if test="${qnaDTO.answerYN == 'N'}">
                        <tr>
                            <th scope="row">${total_count - i.index - responseDTO.page_skip_count}</th>
                            <td><a class="text-dark" href="/bbs/qnaViewQ?qna_idx=${qnaDTO.qna_idx}&no=${total_count - i.index - responseDTO.page_skip_count}">${qnaDTO.title}</a></td>
                            <td>${qnaDTO.member_name}</td>
                            <td>${qnaDTO.reg_date}</td>
                            <td>${qnaDTO.read_cnt}</td>
                        </tr>
                    </c:if>
                    <c:if test="${qnaDTO.answerYN == 'Y'}">
                        <tr>
                            <th scope="row">${total_count - i.index - responseDTO.page_skip_count}</th>
                            <td><a class="text-dark" href="/bbs/qnaViewA?qna_idx=${qnaDTO.qna_idx}&no=${total_count - i.index - responseDTO.page_skip_count}"><span class="badge badge-success">답변</span>${qnaDTO.title}</a></td>
                            <td>${qnaDTO.member_id}</td>
                            <td>${qnaDTO.reg_date}</td>
                            <td>${qnaDTO.read_cnt}</td>
                        </tr>
                    </c:if>
                </c:forEach>



                </tbody>
            </table>
            <div class="input-group d-flex justify-content-end">
                <button type="button" class="btn btn-outline-success mr-3" onclick="location.href='/mypage/myquestions'">나의 문의내역</button>
                <button type="button" class="btn btn-success" onclick="location.href='/bbs/qnaRegistQ'">질문 글쓰기</button>
            </div>
        </div>


        <nav class="blog-pagination justify-content-center d-flex">
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

