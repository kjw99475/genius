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
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="menuGubun" value="mypage"/>
</jsp:include>
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main class="site-main">
    <!-- ================ start banner area ================= -->
    <section class="bg-img2 p-6" id="category">
        <div class="container h-100 p-3">
            <div class="blog-banner pt-1 pb-1">
                <div class="text-center ">
                    <h1 class=" text-white">회원정보 수정</h1>
                    <span class=" text-white">MyInfo</span>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ end banner area ================= -->
    <!--================Login Box Area =================-->
    <section class="login_box_area section-margin">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 col-md-12 col-sm-12">
                    <div class="login_form_inner rounded pt-3">
                        <div class="container text-left pt-5 pb-5 p-lg-5">
                            <form enctype="multipart/form-data" action="/mypage/mypage" method="post" id="frm">
                                <div class="myProfile d-flex flex-column align-items-center form-group">
                                    <div class="target w-200px h-200px ">
                                        <label for="profile" class="myPhoto rounded-circle border-gray w-200px h-200px flow-hidden">
                                            <img class="w-200px h-200px" id="profile_img" src="/resources/upload/profile/${memberDTO.profile}" alt="내 프로필 이미지"/></label>
                                        <div class="custom-file targetToOrg" style="bottom:0 !important; right: -5px !important;">
                                            <input type="file" class="d-none" id="profile" name="file" aria-describedby="inputGroupFileAddon01" onchange="changeProfileImg(event)">
                                            <label class="bg-geni text-white rounded-circle shadow-sm icon_geni middle d-flex align-items-center justify-content-center" for="profile"><i class="ti-settings"></i></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-5">
                                    <c:choose>
                                        <c:when test="${memberDTO['social_type'] eq 'naver'}">
                                            <div class="col-md-12 form-group">
                                                <p class="text-geni">네이버 연동 계정입니다.</p>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-md-12 form-group">
                                                <label for="member_id">아이디</label>
                                                <input type="text" class="form-control" id="member_id" name="member_id" value="${memberDTO['member_id']}" placeholder="아이디" data-name="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" disabled>
                                            </div>
                                            <small id="err_member_id" class="info text-danger"></small>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="col-md-12 form-group">
                                        <label for="member_name">이름</label>
                                        <input type="text" class="form-control" id="member_name" name="member_name" value="${memberDTO['member_name']}" data-name="이름" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" onkeyup="replaceName(this)">
                                        <small id="err_member_name" class="info text-danger"></small>
                                    </div>
                                    <c:choose>
                                        <c:when test="${memberDTO['social_type'] eq 'naver'}">
                                            <div class="col-md-12 form-group">
                                                <input type="hidden" class="form-control" id="naver_pwd" name="pwd" value="" placeholder="비밀번호" data-name="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-md-12 form-group">
                                                <label for="pwd">비밀번호</label>
                                                <input type="password" class="form-control" id="pwd" name="pwd" data-name="비밀번호"  value="" placeholder="비밀번호 변경할 시에만 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
                                                <small id="err_pwd" class="info text-danger"></small>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <label for="pwdCheck">비밀번호 확인</label>
                                                <input type="password" class="form-control" id="pwdCheck" name="pwdCheck" value="" data-name="비밀번호 확인" placeholder="비밀번호 확인" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'">
                                                <small id="err_pwdCheck" class="info text-danger"></small>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="col-md-12 form-group">
                                        <label for="birthday">생년월일</label>
                                        <input type="date" class="form-control" id="birthday" name="birthday" data-name="생년월일" value="${memberDTO.birthday}" placeholder="생년월일" onfocus="this.placeholder = ''" onblur="this.placeholder = '생년월일'">
                                        <small id="err_birthday" class="info text-danger"></small>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>성별</label>
                                        <div class="d-flex" style="gap: 20px">
                                            <label for="female"><input type="radio" class="pixel-radio" data-name="성별" id="female" name="gender" value="여" <c:if test="${memberDTO.gender eq '여'}">checked</c:if> >여</label>
                                            <label for="male"><input type="radio" class="pixel-radio" data-name="성별" id="male" name="gender" value="남" <c:if test="${memberDTO.gender eq '남'}">checked</c:if> >남</label>

                                        </div>
                                        <small id="err_gender" class="info text-danger"></small>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="phone">이메일</label>
                                        <input type="email" class="form-control" id="email" name="email" data-name="이메일" value="${memberDTO.email}" placeholder="이메일" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'" disabled>
                                        <small id="err_email" class="info text-danger"></small>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="phone">연락처</label>
                                        <input type="tel" class="form-control" id="phone" data-name="연락처" name="phone" value="${memberDTO.phone}" placeholder="-없이 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '-없이 입력해주세요'" onkeyup="replacePhone(this)">
                                        <small id="err_phone" class="info text-danger"></small>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>주소</label>
                                        <div>
                                            <div class="input-group mb-3">
                                                <input type="text" name="zip_code" data-name="우편번호" value="${memberDTO['zip_code']}" class="form-control" placeholder="우편번호" id="sample4_postcode" aria-label="Recipient's username" aria-describedby="button-addon2"  onclick="sample4_execDaumPostcode()">
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-success" type="button" id="button-addon2" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
                                                </div>
                                            </div>
                                            <small id="err_zip_code" class="info text-danger"></small>
                                            <div class="form-group">
                                                <input type="text" name="addr1" data-name="주소" value="${memberDTO.addr1}" class="form-control" id="sample4_roadAddress" placeholder="도로명주소">
                                            </div>
                                            <small id="err_addr1" class="info text-danger"></small>
                                            <div class="form-group">
                                                <input type="text" name="addr2" data-name="상세주소"  value="${memberDTO.addr2}" class="form-control" id="sample4_detailAddress"  placeholder="상세주소">
                                            </div>
                                            <small id="err_addr2" class="info text-danger"></small>
                                            <span id="guide" style="color:#999;display:none"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="pt-3 d-flex flex-column" style="gap : 10px">
                                    <button type="submit" class="btn btn-success w-100">수정하기</button>
                                    <button type="button" class="btn btn-outline-success w-100" onclick="location.href = '/'">취소</button>
                                </div>
                                <div class="pt-3 d-flex flex-column mt-4 justify-content-center align-items-center" style="gap : 10px">
                                    <small>설마 탈퇴는 아니겠죠...?😱</small>
                                    <button type="button" class="btn btn-outline-dark w-100" onclick="leave()">탈퇴하기</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Login Box Area =================-->
</main>
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
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
    function leave() {
        if(confirm("정말로 탈퇴하실건가요?")) {
            let frm = document.createElement('form');
            frm.action = '/member/leave';
            frm.method = 'post';
            frm.id = 'leaveFrm';
            document.body.append(frm);
            document.querySelector('#leaveFrm').submit();
        }
    }
</script>
<script src="/resources/js/commonUtil.js"></script>
<script>
    // 유효성 검사
    let checkTarget = ['member_name', 'pwd', 'pwdCheck', 'birthday', 'gender', 'phone', 'zip_code', 'addr1'];
    document.querySelector('#frm').addEventListener('submit', checkForm);
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
                if ($('input[name=pwd]').val().length > 0 || $('input[name=pwdCheck]').val().length > 0 ) {
                    if (!nullCheck($(target))) {
                        $('#err_'+element).text($(target).data('name') + "을 입력해주세요");
                        $(target).focus();
                        return false;
                    }
                }
            }  else if(element == 'addr1') {
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
        if ($('input[name=pwd]').val().length > 0 || $('input[name=pwdCheck]').val().length > 0 ) {
            if(!passwordRegCheck($('input[name=pwd]'))){
                $('#err_pwd').text("비밀번호는 영문 소/대문자 + 숫자 + 특수문자를 조합하여 8글자 이상, 20글자 이하로 입력해주세요. 가능한 특수문자 : !@#$%^*+=-");
                $('input[name=pwd]').focus();
                return false;
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
        if ($('input[name=pwd]').val().length > 0 || $('input[name=pwdCheck]').val().length > 0 ) {
            if (!passwordMatch($('input[name=pwd]'), $('input[name=pwdCheck]'))) {
                $('#err_pwdCheck').text("비밀번호가 일치하지 않습니다.");
                $('input[name=pwdCheck]').focus();
                return false;
            }
        }
        document.querySelector('#frm').submit();
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
<script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="/resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/resources/vendors/skrollr.min.js"></script>
<script src="/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/resources/vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="/resources/vendors/jquery.ajaxchimp.min.js"></script>
<script src="/resources/vendors/mail-script.js"></script>
<script src="/resources/js/main.js"></script>
</body>

