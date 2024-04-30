<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-04-25
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin / member - view</title>
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
    <link rel="stylesheet" href="/resources/vendors/themify-icons/themify-icons.css">


    <!-- Template Main CSS File -->
    <link href="/resources/admin/css/style.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main id="main" class="main">

    <div class="pagetitle">
        <h1>회원 관리</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item "><a href="/admin/member/memberList">회원</a></li>
                <li class="breadcrumb-item active">회원 상세</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
        <div class="row">

            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body pt-3">
                        <div class="tab-content pt-2">
                            <div class="tab-pane fade show active profile-overview" id="profile-overview">
                                <form name="frm_member_delete" id="frm_member_delete" action="/admin/member/memberDelete">
                                    <!-- <h5 class="card-title">Profile Details</h5> -->
                                    <div class="row">
                                        <div class="myProfile form-group d-flex justify-content-center">
                                            <div class="target w-200px h-200px">
                                                <label for="profile" class="myPhoto rounded-circle border-gray w-200px h-200px flow-hidden">
                                                    <img class="w-200px h-200px" id="profile_img" src="/resources/upload/profile/${memberDTO.profile}" alt="내 프로필 이미지"/></label>
                                                <div class="custom-file targetToOrg" style="bottom:40px !important; right: 50px !important;">
                                                    <input type="file" class="d-none" id="profile" name="file" aria-describedby="inputGroupFileAddon01" onchange="changeProfileImg(event)">
                                                    <label class="bg-geni text-white rounded-circle shadow-sm icon_geni middle d-flex align-items-center justify-content-center" for="profile"><i class="ti-settings"></i></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label for="frm" class="col-md-4 col-lg-2 col-form-label label">회원번호</label>
                                        <div class="col-md-8 col-lg-10">
                                            <input name="frm" type="text" class="form-control"
                                                   value="${memberDTO['member_idx']}" disabled>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="social_type" class="col-md-4 col-lg-2 col-form-label label">구분</label>
                                        <div class="col-md-8 col-lg-10">
                                            <input name="frm" type="text" class="form-control"
                                                   value="<c:choose><c:when test="${memberDTO['admin_YN'] == 'Y'}">관리자</c:when><c:otherwise>일반</c:otherwise>
                                            </c:choose>" disabled>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label for="frm" class="col-md-4 col-lg-2 col-form-label label">회원아이디</label>
                                        <div class="col-md-8 col-lg-10">
                                            <input name="frm" type="text" class="form-control"
                                                   value="${memberDTO['member_id']}" disabled>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label for="frm" class="col-md-4 col-lg-2 col-form-label label">회원이름</label>
                                        <div class="col-md-8 col-lg-10">
                                            <input name="frm" type="text" class="form-control"
                                                   value="${memberDTO['member_name']}" disabled>
                                        </div>
                                    </div>








                                    <div class="row mb-3">
                                        <label for="social_type" class="col-md-4 col-lg-2 col-form-label label">카테고리</label>
                                        <div class="col-md-8 col-lg-10">
                                            <select name="social_type" class="form-control" id="social_type">
                                                <option value="" selected hidden>셀렉트박스</option>
                                                <option value="01">01</option>
                                                <option value="02">02</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="reg_date" class="col-md-4 col-lg-2 col-form-label label">가입일</label>
                                        <div class="col-md-8 col-lg-10">
                                            <input name="reg_date" type="date" class="form-control" id="reg_date"
                                                   value="${memberDTO.reg_date}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2 col-md-4 label">폼 아니고 값만 출력할 때</div>
                                        <div class="col-lg-10 col-md-8">출력출력</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2 col-md-4 label">회원아이디</div>
                                        <div class="col-lg-10 col-md-8">아이디${memberDTO.member_name}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2 col-md-4 label">회원이름</div>
                                        <div class="col-lg-10 col-md-8">이름${memberDTO.member_name}</div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="mt-5 d-flex justify-content-between">
                            <c:set var="linked_params">
                                <c:forEach var="key" items="${paramValues.keySet()}" varStatus="status">
                                    <c:if test="${key != 'member_id'}"><c:if test="${status.first}">${key}=${param[key]}</c:if><c:if test="${! status.first}">&${key}=${param[key]}</c:if></c:if>
                                </c:forEach>
                            </c:set>
                            <div>
                                <button type="button" class="btn btn-outline-success" onclick="location.href = '/admin/member/memberList?${linked_params}'">목록</button>
                            </div>
                            <div>
                                <button type="submit" class="btn btn-success">수정</button>
                                <button type="button" class="btn btn-outline-success" id="btn_member_delete" onclick="leave('${memberDTO['member_id']}')">탈퇴</button>
                            </div>
                        </div>
                    </div><!-- End Bordered Tabs -->

                </div>
            </div>

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
    // 프로필 이미지 변경
    function changeProfileImg(e) {
        let files = e.target.files;
        let reader = new FileReader();
        reader.onload = (e)=>{
            $('#profile_img').attr('src', e.target.result);
        }
        reader.readAsDataURL(files[0]);
    }

    // 탈퇴
    function leave(member_id) {
        if (confirm("정말로 탈퇴하실건가요?")) {
            let frm = document.createElement('form');
            let input_target = document.createElement('input');
            frm.action = '/admin/member/memberLeave';
            frm.method = 'post';
            frm.id = 'leaveFrm';
            input_target.name = 'target';
            input_target.value = member_id;
            input_target.type = 'hidden';
            frm.append(input_target);
        }
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