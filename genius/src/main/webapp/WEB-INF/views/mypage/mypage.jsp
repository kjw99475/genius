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
                            <form action="/mypage/mypage" method="post" id="frm">
                                <div class="myProfile d-flex flex-column align-items-center form-group">
                                    <div class="target w-200px h-200px ">
                                        <label for="profile" class="myPhoto rounded-circle border-gray w-200px h-200px flow-hidden">
                                            <img class="w-200px h-200px" id="profile_img" src="/resources/upload/profile/${memberDTO.profile}" alt="내 프로필 이미지"/></label>
                                        <div class="custom-file targetToOrg" style="bottom:0 !important; right: -5px !important;">
                                            <input type="file" class="d-none" id="profile" name="profile" aria-describedby="inputGroupFileAddon01" onchange="changeProfileImg(event)">
                                            <label class="bg-geni text-white rounded-circle shadow-sm icon_geni middle d-flex align-items-center justify-content-center" for="profile"><i class="ti-settings"></i></label>
                                        </div>
                                    </div>

                                </div>
                                <div class="mb-5">
                                    <div class="col-md-12 form-group">
                                        <label for="member_id">아이디</label>
                                        <input type="text" class="form-control" id="member_id" name="member_id" value="${memberDTO['member_id']}" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" disabled>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="member_name">이름</label>
                                        <input type="text" class="form-control" id="member_name" name="member_name" value="${memberDTO['member_name']}" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="pwd">비밀번호</label>
                                        <input type="password" class="form-control" id="pwd" name="pwd" value="${memberDTO.pwd}" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="pwdCheck">비밀번호 확인</label>
                                        <input type="password" class="form-control" id="pwdCheck" name="pwdCheck" value="${memberDTO.pwd}" placeholder="비밀번호 확인" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="birthday">생년월일</label>
                                        <input type="date" class="form-control" id="birthday" name="birthday" value="${memberDTO.birthday}" placeholder="생년월일" onfocus="this.placeholder = ''" onblur="this.placeholder = '생년월일'">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>성별</label>
                                        <div class="d-flex" style="gap: 20px">
                                            <label for="female"><input type="radio" class="pixel-radio" id="female" name="gender" value="여" <c:if test="${memberDTO.gender eq '여'}">checked</c:if> >여</label>
                                            <label for="male"><input type="radio" class="pixel-radio" id="male" name="gender" value="남" <c:if test="${memberDTO.gender eq '남'}">checked</c:if> >남</label>
                                        </div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="phone">이메일</label>
                                        <input type="email" class="form-control" id="email" name="email" value="${memberDTO.email}" placeholder="이메일" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="phone">연락처</label>
                                        <input type="tel" class="form-control" id="phone" name="phone" value="${memberDTO.phone}" placeholder="-없이 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '-없이 입력해주세요'">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>주소</label>
                                        <div>
                                            <div class="input-group mb-3">
                                                <input type="text" name="zip_code" value="${memberDTO['zip_code']}" class="form-control" placeholder="우편번호" id="sample4_postcode" aria-label="Recipient's username" aria-describedby="button-addon2"  onclick="sample4_execDaumPostcode()">
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-success" type="button" id="button-addon2" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" name="addr1" value="${memberDTO.addr1}" class="form-control" id="sample4_roadAddress" placeholder="도로명주소">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" name="addr2" value="${memberDTO.addr2}" class="form-control" id="sample4_detailAddress"  placeholder="상세주소">
                                            </div>
                                            <span id="guide" style="color:#999;display:none"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="pt-3 d-flex flex-column" style="gap : 10px">
                                    <button type="submit" class="btn btn-success w-100">수정하기</button>
                                    <button type="button" class="btn btn-outline-success w-100" onclick="location.href = '/'">취소</button>
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
    function changeProfileImg(e) {
        let files = e.target.files;
        let reader = new FileReader();
        reader.onload = (e)=>{
            $('#profile_img').attr('src', e.target.result);
        }
        reader.readAsDataURL(files[0]);
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

