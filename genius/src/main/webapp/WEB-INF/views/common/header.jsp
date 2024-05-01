<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wkdwl
  Date: 2024-04-25
  Time: 오후 2:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<header class="header_area full_wrap">
    <div class="main_menu full_wrap">
        <nav class="navbar navbar-expand-lg navbar-light flex-column full_wrap">
            <div class="bg-geni full_wrap">
                <div class="container text-white d-flex justify-content-end">
                    <c:choose>
                        <c:when test="${!empty sessionScope['member_id']}">
                            <a href="#" class="p-2 text-white" onclick="logout()">로그아웃</a>
                            <a href="/mypage/mypage" class="p-2 text-white">마이페이지</a>
                            <a href="/mypage/payhistory" class="p-2 text-white">결제내역</a>
                            <c:if test="${sessionScope['admin_YN'] == 'Y'}">
                                <a href="/admin/admin" class="p-2 text-white">관리자 사이트</a>
                            </c:if>
                            <script>
                                function logout() {
                                    event.stopPropagation();
                                    event.preventDefault()
                                    let frm = document.createElement('form');
                                    let input = document.createElement('input');
                                    frm.action = '/login/logout';
                                    frm.method = 'post';
                                    frm.id = 'frmLogout';
                                    input.name = 'member_id';
                                    input.value = '${sessionScope['member_id']}';
                                    frm.append(input);
                                    document.body.append(frm);
                                    document.getElementById('frmLogout').submit();
                                }
                            </script>
                        </c:when>
                        <c:otherwise>
                            <a href="/login/login" class="p-2 text-white">로그인</a>
                            <a href="/member/join" class="p-2 text-white">회원가입</a>
                        </c:otherwise>
                    </c:choose>
                    <a href="/company/map" class="p-2 text-white">오시는길</a>
                </div>
            </div>
            <div class="container">
                <a class="navbar-brand logo_h" href="/"><img class="mb-2" src="/resources/img/logo1.png" alt="" width="150"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
                        <li class="nav-item submenu dropdown active">
                            <a href="/company/introduce" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">회사소개</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="/company/introduce">인사말</a></li>
                                <li class="nav-item"><a class="nav-link" href="/company/history">연혁</a></li>
                                <li class="nav-item"><a class="nav-link" href="/company/map">오시는길</a></li>
                            </ul>
                        </li>
                        <li class="nav-item submenu dropdown">
                            <a href="/book/list" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">교재</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="/book/list">교재</a></li>
                            </ul>
                        </li>
                        <li class="nav-item submenu dropdown">
                            <a href="/bbs/notice" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">커뮤니티</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="/bbs/noticeList">공지사항</a></li>
                                <li class="nav-item"><a class="nav-link" href="/bbs/qnaList">QnA</a></li>
                                <li class="nav-item"><a class="nav-link" href="/bbs/faqList">FAQ</a></li>
                            </ul>
                        </li>
                        <li class="nav-item submenu dropdown">
                            <a href="/bbs/boardList" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">자료실</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="/bbs/boardList">자료실</a></li>
                            </ul>
                        </li>

                    </ul>

                    <ul class="nav-shop">
                        <li class="nav-item" onclick="location.href = '/mypage/cart'"><button><i class="ti-shopping-cart"></i>
                            <c:if test="${!empty sessionScope['member_id']}">
                                <span class="nav-shop__circle">3</span>
                            </c:if>
                        </button> </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>

