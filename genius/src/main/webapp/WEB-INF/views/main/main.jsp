<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.fullstack4.genius.Common.CommonUtil" %>
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

  <!--================ 배너 start =================-->
  <section>
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <c:forEach var="dto" items="${mainDTO.bannerDTOList}">
          <div class="swiper-slide background-option h-750px" style="background-image: url('${dto.path}${dto ["save_name"]}')"></div>
        </c:forEach>
      </div>
      <div class="swiper-pagination"></div>
    </div>
  </section>
  <!--================ 배너 start =================-->

  <!-- ================ 랭킹 start ================= -->
  <section class="section-margin calc-60px">
    <div class="container">
      <div class="section-intro pb-4">
        <p>도서 판매 랭킹</p>
        <h2><span class="section-intro__style">Best</span>Seller</h2>
      </div>
      <div class="pb-4">
        <ul class="nav nav-pills justify-content-end">
          <li class="nav-item">
            <a class="nav-link active-geni active" aria-current="page" href="#" data-target="yesterday" onclick="showThis(this)">최근 7일 기준</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-geni" href="#" data-target="total" onclick="showThis(this)">누적</a>
          </li>
        </ul>
      </div>
      <div id="yesterday" class="rank row">
        <c:forEach var="dto" items="${mainDTO.yesterDayBookDTOList}">
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img bg-light">
                <img class="card-img img-h350" src="/resources/upload/book/${dto['book_img']}" alt="" onclick="location.href = '/book/view?book_code=${dto["book_code"]}'">
                <ul class="card-product__imgOverlay">
                  <li><button><i class="ti-bag"></i></button></li>
                  <li><button><i class="ti-shopping-cart"></i></button></li>
                </ul>
              </div>
              <div class="card-body">
                <p>${dto['class_name']} > ${dto['subject_name']}</p>
                <h4 class="card-product__title"><a href="/book/view?book_code=${dto['book_code']}">${dto['book_name']}</a></h4>
                <p class="card-product__price text-geni"><s class="text-muted h6">${CommonUtil.comma(dto['price'])}</s> ${CommonUtil.comma(dto['discount_price'])}</p>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
      <div id="total" class="rank row d-none">
        <c:forEach var="dto" items="${mainDTO.totalBookDTOList}">
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img bg-light">
                <img class="card-img img-h350" src="/resources/upload/book/${dto['book_img']}" alt="" onclick="location.href = '/book/view?book_code=${dto["book_code"]}'">
                <ul class="card-product__imgOverlay">
                  <li><button><i class="ti-bag"></i></button></li>
                  <li><button><i class="ti-shopping-cart"></i></button></li>
                </ul>
              </div>
              <div class="card-body">
                <p>${dto['class_name']} > ${dto['subject_name']}</p>
                <h4 class="card-product__title"><a href="/book/view?book_code=${dto['book_code']}">${dto['book_name']}</a></h4>
                <p class="card-product__price text-geni"><s class="text-muted h6">${CommonUtil.comma(dto['price'])}</s> ${CommonUtil.comma(dto['discount_price'])}</p>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </section>
  <!-- ================ 랭킹 section end ================= -->

  <!-- ================ 신간 section start ================= -->
  <section class="section-margin calc-60px">
    <div class="container">
      <div class="section-intro pb-4">
        <p>따끈따근한 신간 소개</p>
        <h2><span class="section-intro__style">New</span> Books</h2>
      </div>
      <div class="owl-carousel owl-theme owl-animated-out owl-loaded" id="bestSellerCarousel">
        <div class="owl-stage-outer">
          <div class="owl-stage" style="transform: translate3d(-1140px, 0px, 0px); transition: all 0s ease 0s; width: 4560px;">
            <c:forEach var="dto" items="${mainDTO.newBookDTOList}" varStatus="status">
              <c:if test="${status.step < 5}">
                <div class="owl-item cloned" style="width: 255px; margin-right: 30px;">
                  <div class="card text-center card-product">
                    <div class="card-product__img">
                      <img class="img-fluid img-h350" src="/resources/upload/book/${dto['book_img']}" alt="">
                      <ul class="card-product__imgOverlay">
                        <li><button><i class="ti-bag"></i></button></li>
                        <li><button><i class="ti-shopping-cart"></i></button></li>
                      </ul>
                    </div>
                    <div class="card-body">
                      <p>${dto['class_name']} > ${dto['subject_name']}</p>
                      <h4 class="card-product__title"><a href="/book/view?book_code=${dto['book_code']}">${dto['book_name']}</a></h4>
                      <p class="card-product__price text-geni"><s class="text-muted h6">${CommonUtil.comma(dto['price'])}</s> ${CommonUtil.comma(dto['discount_price'])}</p>
                    </div>
                  </div>
                </div>
              </c:if>
            </c:forEach>
            <c:forEach var="dto" items="${mainDTO.newBookDTOList}" varStatus="status">
              <div class="owl-item <c:if test="${status.count le 4}"> active </c:if>" style="width: 255px; margin-right: 30px;">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="img-fluid img-h350" src="/resources/upload/book/${dto['book_img']}" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-bag"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <p>${dto['class_name']} > ${dto['subject_name']}</p>
                    <h4 class="card-product__title"><a href="/book/view?book_code=${dto['book_code']}">${dto['book_name']}</a></h4>
                    <p class="card-product__price text-geni"><s class="text-muted h6">${CommonUtil.comma(dto['price'])}</s> ${CommonUtil.comma(dto['discount_price'])}</p>
                  </div>
                </div>
              </div>
            </c:forEach>
            <c:forEach var="dto" items="${mainDTO.newBookDTOList}" varStatus="status">
              <c:if test="${status.step > 4}">
                <div class="owl-item cloned" style="width: 255px; margin-right: 30px;">
                  <div class="card text-center card-product">
                    <div class="card-product__img">
                      <img class="img-fluid img-h350" src="${dto['book_img']}" alt="">
                      <ul class="card-product__imgOverlay">
                        <li><button><i class="ti-bag"></i></button></li>
                        <li><button><i class="ti-shopping-cart"></i></button></li>
                      </ul>
                    </div>
                    <div class="card-body">
                      <p>${dto['class_name']} > ${dto['subject_name']}</p>
                      <h4 class="card-product__title"><a href="/book/view?book_code=${dto['book_code']}">${dto['book_name']}</a></h4>
                      <p class="card-product__price text-geni"><s class="text-muted h6">${dto['price']}</s>${dto['discount_price']}</p>
                    </div>
                  </div>
                </div>
              </c:if>
            </c:forEach>
          </div>
        </div>
        <div class="owl-nav">
          <button type="button" role="presentation" class="owl-prev"><i class="ti-arrow-left"></i></button>
          <button type="button" role="presentation" class="owl-next"><i class="ti-arrow-right"></i></button>
        </div>
        <div class="owl-dots disabled"></div>
      </div>
    </div>
  </section>
  <!-- ================ 신간 section end ================= -->

  <!-- ================ 리뷰 section end ================= -->
  <section class="blog">
    <div class="container pb-5">
      <div class="section-intro pb-4">
        <h2><span class="section-intro__style">Review</span></h2>
      </div>
      <div class="row">
        <div class="col-md-12 col-lg-12 mb-4 mb-lg-0">
          <div class="card card">
            <div class="list-group">
              <c:forEach var="dto" items="${mainDTO.reviewDTOList}">
                <a href="/book/view?book_code=${dto['book_code']}" class="list-group-item list-group-item-action d-flex">
                  <img class="rounded-circle shadow-sm align-self-center" src="/resources/upload/profile/${dto.profile}" width="70px" height="70px">
                  <div class="d-flex flex-column ml-4 align-self-center">
                  <span class="card-product__rank stars">
                    <c:forEach var="i" begin="1" end="5" step="1" varStatus="status">
                      <i class="fa fa-star <c:if test="${status.count > dto.rank}"> text-secondary </c:if> "></i>
                    </c:forEach>
                  </span>
                    <span>${dto['review_contents']}</span>
                    <small>작성자 : ${dto['member_id']}</small>
                    <small>책 이름 : ${dto['book_name']}</small>
                  </div>
                </a>
              </c:forEach>
            </div>
          </div>
        </div>



      </div>
    </div>
  </section>
  <!-- ================ 리뷰 section end ================= -->





</main>
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!--================ 푸터 End =================-->
<script src="/resources/js/swiper-bundle.min.js"></script>
<script>
  // 배너 영역
  var swiper = new Swiper(".mySwiper", {
    loop: true,
    autoplay: {
      delay: 3000,
      disableOnInteraction: false,
    },
    pagination: {
      el: ".swiper-pagination",
    },
  });

  // BestSeller 영역 조작
  function showThis(element) {
    event.preventDefault();
    event.stopPropagation();
    let target = element.dataset.target;
    let rankes = document.querySelectorAll('.rank');
    let buttons = document.querySelectorAll('.nav-link');
    for(let button of buttons) {
      button.classList.remove('active-geni', 'active', 'text-white');
      button.classList.add('text-geni');
    }
    for(let rank of rankes) {
      rank.classList.add('d-none');
    }
    element.classList.remove('text-geni');
    element.classList.add('active-geni', 'active');
    document.querySelector('#'+target).classList.remove('d-none');
  }


</script>

<script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="/resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/resources/vendors/skrollr.min.js"></script>
<script src="/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/resources/vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="/resources/vendors/jquery.ajaxchimp.min.js"></script>
<script src="/resources/vendors/mail-script.js"></script>
<script src="/resources/js/main.js"></script>
</body>
</html>