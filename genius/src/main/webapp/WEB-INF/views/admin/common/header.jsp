<%--
  Created by IntelliJ IDEA.
  User: kjw
  Date: 2024-04-25
  Time: 오후 7:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
        <a href="/admin/admin" class="logo d-flex align-items-center">
            <img src="/resources/admin/img/logo.png" alt="logo">
            <span class="d-none d-lg-block">GeniusAdmin</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->


    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">

            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <span class="d-none d-md-block dropdown-toggle ps-2">관리자</span>

                </a><!-- End Profile Iamge Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <div class="w-200px h-200px flow-hidden text-center d-flex justify-content-center align-items-center m-auto">
                        <img class="w-100" src="/resources/upload/profile/${empty sessionScope.profile ? 'default.png' : sessionScope.profile}">
                    </div>
                    <li class="dropdown-header">
                        <h6>관리자</h6>
                        <span>${sessionScope.member_id}</span>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="/">
                            <i class="bi bi-person"></i>
                            <span>사용자 페이지로 돌아가기</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li>
                        <a class="dropdown-item d-flex align-items-center" onclick="logout()">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>로그아웃</span>
                        </a>
                    </li>

                </ul><!-- End Profile Dropdown Items -->
            </li><!-- End Profile Nav -->

        </ul>
    </nav>

    <!-- End Icons Navigation -->

</header><!-- End Header -->
<script>
    function logout() {
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
