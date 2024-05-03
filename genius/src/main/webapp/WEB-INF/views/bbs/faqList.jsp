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
        .collapse {
            transition: none;
        }
    </style>
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="menuGubun" value="bbs"/>
</jsp:include>
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
                    <form>
                    <div class="sorting d-flex">
                        <select name="type">
                            <option value="0" <c:if test="${responseDTO.type eq '0'}">selected</c:if>>전체</option>
                            <option value="1" <c:if test="${responseDTO.type eq '1'}">selected</c:if>>작성자</option>
                            <option value="2" <c:if test="${responseDTO.type eq '2'}">selected</c:if>>제목</option>
                            <option value="3" <c:if test="${responseDTO.type eq '3'}">selected</c:if>>내용</option>
                        </select>
                        <div class="col-auto">
                            <input type="date" class="form-control" name="search_date1" value="${responseDTO.search_date1}">
                        </div>
                        <div>~</div>
                        <div class="col-auto">
                            <input type="date" class="form-control" name="search_date2" value="${responseDTO.search_date2}">
                        </div>
                        <div class="filter-bar-search">
                            <input type="text" placeholder="Search" name="search_word" style="width: 100%" value="${responseDTO.search_word}">
                        </div>
                        <div>
                            <button type="submit" class="btn btn-success">검색</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>


            <table class="table table-hover accordion">
                <thead class="filter-bar">
                <tr>
                    <th scope="col" style="width: 9.8%">번호</th>
                    <th scope="col" style="width: 90.2%" >제목</th>
                </tr>
                </thead>
                <tbody id="accordionExample">

                <c:set value="${responseDTO.total_count}" var="total_count" />
                <c:if test="${responseDTO.total_count eq 0}"> <tr><td colspan="2">검색 결과가 없습니다.</td></tr></c:if>
                <c:choose>
                    <c:when test="${responseDTO ne null}">

                        <c:forEach items="${responseDTO.dtoList}" var="bbsDTO" varStatus="loop">
                            <tr>
                                <th scope="row" class=" align-content-center">${total_count -responseDTO.page_skip_count -loop.index}</th>
                                <td><button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${bbsDTO.bbs_idx}" aria-expanded="true" aria-controls="${bbsDTO.bbs_idx}">${bbsDTO.bbs_title}</button></td>
                            </tr>
                            <tr>
                                <td colspan="2" id="collapse${bbsDTO.bbs_idx}" class="collapse" aria-labelledby="heading${bbsDTO.bbs_idx}" data-parent="#accordionExample"><div>${bbsDTO.bbs_contents}</div></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                    <tr><td colspan="2">결과가 없습니다.</td></tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
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

