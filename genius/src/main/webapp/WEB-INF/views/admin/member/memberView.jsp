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

    <script src="/resources/jquery/jquery-3.7.1.js"></script>
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
                                <form enctype="multipart/form-data"  id="frmInfo" action="/admin/member/memberModify" method="post">
                                    <input type="hidden" name="member_id" value="${memberDTO['member_id']}">
                                    <!-- <h5 class="card-title">Profile Details</h5> -->
                                    <div class="row">
                                        <div class="myProfile form-group d-flex justify-content-center">
                                            <div class="target w-200px h-200px">
                                                <label for="profile" class="myPhoto rounded-circle border-gray w-200px h-200px flow-hidden">
                                                    <img class="w-200px h-200px" id="profile_img" src="/resources/upload/profile/${memberDTO.profile}" alt="내 프로필 이미지"/></label>
                                                <div class="custom-file targetToOrg" style="bottom:40px !important; right: 50px !important;">
                                                    <input type="file" class="d-none" id="profile" name="file" aria-describedby="inputGroupFileAddon01" onchange="changeProfileImg(event)" accept="image/*">
                                                    <label class="bg-geni text-white rounded-circle shadow-sm icon_geni middle d-flex align-items-center justify-content-center" for="profile"><i class="ti-settings"></i></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="admin_YN" class="col-md-4 col-lg-2 col-form-label label">상태</label>
                                        <div class="col-md-8 col-lg-10 d-flex flex-column gap-5px ps-3">
                                            <c:choose>
                                                <c:when test="${memberDTO.status == 'Y'}">
                                                    정상
                                                </c:when>
                                                <c:otherwise>
                                                    탈퇴 (${memberDTO['leave_date']})
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="admin_YN" class="col-md-4 col-lg-2 col-form-label label">구분</label>
                                        <div class="col-md-8 col-lg-10 d-flex flex-column gap-5px">
                                            <select id="admin_YN" name="admin_YN" class="form-select">
                                                <option value="N" <c:if test="${memberDTO['admin_YN'] != 'Y'}">selected</c:if> >일반</option>
                                                <option value="Y" <c:if test="${memberDTO['admin_YN'] == 'Y'}">selected</c:if>>관리자</option>
                                            </select>
                                            <small id="err_admin_YN" class="info text-danger"></small>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label for="member_idx" class="col-md-4 col-lg-2 col-form-label label">회원번호</label>
                                        <div class="col-md-8 col-lg-10 d-flex flex-column gap-5px">
                                            <input name="member_idx" data-name="회원번호" id="member_idx" type="text" class="form-control"
                                                   value="${memberDTO['member_idx']}" disabled>
                                            <small id="err_member_idx" class="info text-danger"></small>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label for="member_id" class="col-md-4 col-lg-2 col-form-label label">회원아이디</label>
                                        <div class="col-md-8 col-lg-10 d-flex flex-column gap-5px">
                                            <c:choose>
                                                <c:when test="${memberDTO['social_type'] eq 'naver'}">
                                                    <div class="col-md-12 form-group">
                                                        <p class="text-geni">네이버 연동 계정입니다.</p>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <input name="member_id" data-name="아이디"  type="text" class="form-control" id="member_id" value="${memberDTO['member_id']}" disabled>
                                                </c:otherwise>
                                            </c:choose>
                                            <small id="err_member_id" class="info text-danger"></small>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label for="member_name" class="col-md-4 col-lg-2 col-form-label label">회원이름</label>
                                        <div class="col-md-8 col-lg-10 d-flex flex-column gap-5px">
                                            <input name="member_name" type="text" class="form-control" id="member_name" data-name="이름"
                                                   value="${memberDTO['member_name']}" onkeyup="replaceName(this)">
                                            <small id="err_member_name" class="info text-danger"></small>
                                        </div>
                                    </div>
                                    <c:if test="${memberDTO['social_type'] != 'naver'}">
                                        <div class="row">
                                            <label for="pwd" class="col-md-4 col-lg-2 col-form-label label">비밀번호</label>
                                            <div class="col-md-8 col-lg-10 d-flex flex-column gap-5px">
                                                <input name="pwd" type="password" class="form-control" id="pwd" data-name="비밀번호" placeholder="비밀번호 변경할 시에만 입력해 주세요"
                                                       value="">
                                                <small id="err_pwd" class="info text-danger"></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="pwdCheck" class="col-md-4 col-lg-2 col-form-label label">비밀번호 확인</label>
                                            <div class="col-md-8 col-lg-10 d-flex flex-column gap-5px">
                                                <input name="pwdCheck" type="password" class="form-control" id="pwdCheck" data-name="비밀번호 확인" placeholder="비밀번호 확인"
                                                       value="">
                                                <small id="err_pwdCheck" class="info text-danger"></small>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="row">
                                        <label for="birthday" class="col-md-4 col-lg-2 col-form-label label">생년월일</label>
                                        <div class="col-md-8 col-lg-10 d-flex flex-column gap-5px">
                                            <input name="birthday" type="date" class="form-control" data-name="생년월일" id="birthday"
                                                   value="${memberDTO['birthday']}">
                                            <small id="err_birthday" class="info text-danger"></small>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-md-4 col-lg-2 col-form-label label">성별</label>
                                        <div class="col-md-8 col-lg-10 d-flex flex-column gap-5px">
                                            <div class="d-flex" style="gap: 20px">
                                                <label for="female"><input type="radio" data-name="성별" class="pixel-radio" id="female" name="gender" value="여" <c:if test="${memberDTO.gender eq '여'}">checked</c:if> > 여</label>
                                                <label for="male"><input type="radio" data-name="성별" class="pixel-radio" id="male" name="gender" value="남" <c:if test="${memberDTO.gender eq '남'}">checked</c:if> > 남</label>
                                            </div>
                                            <small id="err_gender" class="info text-danger"></small>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label for="email" class="col-md-4 col-lg-2 col-form-label label">이메일</label>
                                        <div class="col-md-8 col-lg-10 d-flex flex-column gap-5px">
                                            <input name="email" type="email" id="email" class="form-control" data-name="이메일"
                                                   value="${memberDTO['email']}" disabled>
                                            <small id="err_email" class="info text-danger"></small>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label for="phone" class="col-md-4 col-lg-2 col-form-label label">연락처</label>
                                        <div class="col-md-8 col-lg-10 d-flex flex-column gap-5px">
                                            <input name="phone" type="tel" class="form-control" data-name="연락처" id="phone"
                                                   value="${memberDTO['phone']}" onkeyup="replacePhone(this)">
                                            <small id="err_phone" class="info text-danger"></small>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label for="frmInfo" class="col-md-4 col-lg-2 col-form-label label">주소</label>
                                        <div class="col-md-8 col-lg-10">
                                            <div class="d-flex flex-column" style="gap:10px">
                                                <div class="input-group">
                                                    <input type="text" name="zip_code" data-name="우편번호" value="${memberDTO['zip_code']}" class="form-control" placeholder="우편번호" id="sample4_postcode" aria-label="Recipient's username" aria-describedby="button-addon2"  onclick="sample4_execDaumPostcode()" readonly>
                                                    <div class="input-group-append">
                                                        <button class="btn btn-outline-success" type="button" id="button-addon2" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
                                                    </div>
                                                </div>
                                                <small id="err_zip_code" class="info text-danger"></small>
                                                <div class="form-group">
                                                    <input type="text" name="addr1" value="${memberDTO.addr1}" data-name="주소" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" readonly>
                                                </div>
                                                <small id="err_addr1" class="info text-danger"></small>
                                                <div class="form-group">
                                                    <input type="text" name="addr2" value="${memberDTO.addr2}" data-name="상세주소" class="form-control" id="sample4_detailAddress"  placeholder="상세주소">
                                                </div>
                                                <small id="err_addr2" class="info text-danger"></small>
                                                <span id="guide" style="color:#999;display:none"></span>
                                            </div>
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
                                            <c:if test="${dtoList.status == 'Y'}">
                                            <button type="button" class="btn btn-outline-success" id="btn_member_delete" onclick="leave('${memberDTO['member_id']}')">탈퇴</button>
                                            </c:if>
                                        </div>
                                    </div>
                                </form>
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
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp">
    <jsp:param name="menuGubun" value="member"/>
</jsp:include>
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
            <c:if test="${!empty param['page_size']}">
            let input_page_size = document.createElement('input');
            input_page_size.name = 'page_size';
            input_page_size.value = "${param['page_size']}";
            input_page_size.type = 'hidden';
            frm.append(input_page_size);
            </c:if>
            <c:if test="${!empty param['search_category']}">
            let input_search_category = document.createElement('input');
            input_search_category.name = 'search_category';
            input_search_category.value = "${param['search_category']}";
            input_search_category.type = 'hidden';
            frm.append(input_search_category);
            </c:if>
            <c:if test="${!empty param['search_word']}">
            let input_search_word = document.createElement('input');
            input_search_word.name = 'search_word';
            input_search_word.value ="${param['search_word']}";
            input_search_word.type = 'hidden';
            frm.append(input_search_word);
            </c:if>
            <c:if test="${!empty param['search_data1']}">
            let input_search_data1 = document.createElement('input');
            input_search_data1.name = 'search_data1';
            input_search_data1.value = "${param['search_data1']}";
            input_search_data1.type = 'hidden';
            frm.append(input_search_data1);
            </c:if>
            <c:if test="${!empty param['search_data2']}">
            let input_search_data2 = document.createElement('input');
            input_search_data2.name = 'search_data2';
            input_search_data2.value = "${param['search_data2']}";
            input_search_data2.type = 'hidden';
            frm.append(input_search_data2);
            </c:if>
            <c:if test="${!empty param['page']}">
            let input_page = document.createElement('input');
            input_page.name = 'page';
            input_page.value = "${param['page']}";
            input_page.type = 'hidden';
            frm.append(input_page);
            </c:if>
            let input_link = document.createElement('input');
            input_link.name = 'link';
            input_link.value = "view";
            input_link.type = 'hidden';
            frm.append(input_link);
            document.body.append(frm);
            document.querySelector('#leaveFrm').submit();
        }
    }
</script>
<script src="/resources/js/commonUtil.js"></script>
<script>
    // 유효성 검사
    let checkTarget = ['member_name', 'pwd', 'birthday', 'gender', 'phone', 'zip_code', 'addr1'];
    document.querySelector('#frmInfo').addEventListener('submit', checkForm);
    function checkForm() {
        event.preventDefault();
        for(let info of document.querySelectorAll('.info')) {
            $(info).text("");
        }
        // 공란 검사
        for (let element of checkTarget) {
            let target = $('input[name='+element+']');
            if (element == 'gender') {
                if(!$('input#male').is(":checked") && !$('input#female').is(":checked")) {
                    $('#err_'+element).text($(target).data('name') + "을 선택해주세요");
                    $(target).focus();
                    return false;
                }
            } else if(element == 'pwd' || element == 'pwdCheck') {
                if(${memberDTO['social_type'] != 'naver'}) {
                    if ($('input[name=pwd]').val().length > 0 || $('input[name=pwdCheck]').val().length > 0 ) {
                        if (!nullCheck($(target))) {
                            $('#err_'+element).text($(target).data('name') + "을 입력해주세요");
                            $(target).focus();
                            return false;
                        }
                    }
                }
            } else if(element == 'addr1') {
                if (!nullCheck2($(target))) {
                    $('#err_'+element).text($(target).data('name') + "을 입력해주세요");
                    $(target).focus();
                    return false;
                }
            } else {
                if (!nullCheck($(target))) {
                    $('#err_'+element).text($(target).data('name') + "을 입력해주세요");
                    $(target).focus();
                    return false;
                }
            }
        }
        // 정규식 검사
        if(!nameRegCheck($('input[name=member_name]'))){
            $('#err_member_name').text("이름은 한글로 최소 2글자 이상, 20글자 이하로 작성하세요.");
            $('input[name=member_name]').focus();
            return false;
        }
        if(${memberDTO['social_type'] != 'naver'}) {
            if ($('input[name=pwd]').val().length > 0 || $('input[name=pwdCheck]').val().length > 0 ) {
                if(!passwordRegCheck($('input[name=pwd]'))){
                    $('#err_pwd').text("비밀번호는 영문 소/대문자 + 숫자 + 특수문자를 조합하여 8글자 이상, 20글자 이하로 입력해주세요. 가능한 특수문자 : !@#$%^*+=-");
                    $('input[name=pwd]').focus();
                    return false;
                }
            }
        }
        if(!phoneRegCheck($('input[name=phone]'))){
            $('#err_phone').text("'-' 없이 올바른 전화번호 형식을 사용해주세요. 예시: 01012345678");
            $('input[name=phone]').focus();
            return false;
        }
        // 유효한 생년월일 검사
        if(!dateCheck($('input[name=birthday]'))) {
            $('#err_birthday').text("생년월일은 오늘보다 미래일 수 없습니다.");
            $('input[name=birthday]').focus();
            return false;
        }
        // 중복 체크 및 일치 여부 검사
        if(${memberDTO['social_type'] != 'naver'}) {
            if ($('input[name=pwd]').val().length > 0 || $('input[name=pwdCheck]').val().length > 0 ) {
                if (!passwordMatch($('input[name=pwd]'), $('input[name=pwdCheck]'))) {
                    $('#err_pwdCheck').text("비밀번호가 일치하지 않습니다.");
                    $('input[name=pwdCheck]').focus();
                    return false;
                }
            }
        }
        document.querySelector('#frmInfo').submit();
    }

    // Back단 유효성 검사
    if(${!empty err}) {
        let errArr = [];
        <c:forEach var="item" items="${err}">
        if(${item.getField() != null}) {
            errArr.push('${item.getField()}');
        }
        </c:forEach>
        if (errArr.length > 0) {
            for (let err of errArr) {
                $('#err_'+err).text("입력 내용을 확인해주세요");
            }
            alert("모든 항목을 입력해주세요!");
        }
    }

    if(${!empty result}) {
        alert("${result}");
    }
</script>
<!-- 다음 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<!-- 다음 주소 api -->

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