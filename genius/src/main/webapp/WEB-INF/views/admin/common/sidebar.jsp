<%--
  Created by IntelliJ IDEA.
  User: kjw
  Date: 2024-04-25
  Time: 오후 7:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link collapsed" href="/admin/admin">
                <i class="bi bi-grid"></i>
                <span>메인</span>
            </a>
        </li>
        <!-- End 메인 Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="/admin/member/memberList">
                <i class="bi bi-person"></i>
                <span>회원 관리</span>
            </a>
        </li>
        <!-- End 회원 관리 Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-journal-text"></i><span>게시판 관리</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/admin/banner/bannerList">
                        <i class="bi bi-circle"></i><span>배너 관리</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/announce/list">
                        <i class="bi bi-circle"></i><span>공지사항 관리</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/qna/list">
                        <i class="bi bi-circle"></i><span>QnA 관리</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/faq/list">
                        <i class="bi bi-circle"></i><span>F.A.Q 관리</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/bbs/list">
                        <i class="bi bi-circle"></i><span>자료실 관리</span>
                    </a>
                </li>
            </ul>
        </li>
        <!-- End 게시판 관리 Nav -->

        <li class="nav-heading">상품</li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="/admin/book/itemlist">
                <i class="bi bi-gem"></i><span>상품 관리</span>
            </a>
        </li>
        <!-- End 상품 관리 Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="/admin/inventory/list">
                <i class="bi bi-menu-button-wide"></i><span>재고 관리</span>
            </a>
        </li>
        <!-- End 재고 관리 Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="/admin/order/list">
                <i class="bi bi-bar-chart"></i><span>주문 관리</span>
            </a>
        </li>
        <!-- End 주문 관리 Nav -->
    </ul>
</aside><!-- End Sidebar-->

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
<script src="/resources/admin/js/main.js"></script><script src="/resources/admin/js/main.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>