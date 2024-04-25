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
                    <a class="p-2">로그인</a>
                    <a class="p-2">회원가입</a>
                    <a class="p-2">오시는길</a>
                    <a class="p-2">로그아웃</a>
                    <a class="p-2">마이페이지</a>
                    <a class="p-2">관리자 사이트</a>
                    <a></a>
                </div>
            </div>
            <div class="container">
                <a class="navbar-brand logo_h" href="#"><img class="mb-2" src="/resources/img/logo.png" alt="" width="150"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
                        <li class="nav-item submenu dropdown active">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">회사소개</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="#">인사말</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">연혁</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">오시는길</a></li>
                            </ul>
                        </li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">교재</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="#">교재</a></li>
                            </ul>
                        </li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">커뮤니티</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">QnA</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">FAQ</a></li>
                            </ul>
                        </li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">자료실</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="#">자료실</a></li>
                            </ul>
                        </li>

                    </ul>

                    <ul class="nav-shop">
                        <li class="nav-item"><button><i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span></button> </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>

