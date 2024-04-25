<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>geinus</title>
  <link rel="icon" href="/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/swiper-bundle.min.css"/>

  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="WEB-INF/views/common/header.jsp" />
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main class="site-main">

  <!--================ 배너 start =================-->
  <section>
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="resources/img/banner/banner1.jpg"></div>
        <div class="swiper-slide"><img src="resources/img/banner/banner2.jpg"></div>
        <div class="swiper-slide"><img src="resources/img/banner/banner3.jpg"></div>
        <div class="swiper-slide"><img src="resources/img/banner/banner4.jpg"></div>
        <div class="swiper-slide"><img src="resources/img/banner/banner5.jpg"></div>
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
            <a class="nav-link active-geni active" aria-current="page" href="#">작일 기준</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-geni" href="#">누적</a>
          </li>

        </ul>
      </div>
      <div class="row">
        <div class="col-md-6 col-lg-4 col-xl-3">
          <div class="card text-center card-product">
            <div class="card-product__img bg-light">
              <img class="card-img img-h350" src="resources/img/BestSeller/product1.jpg" alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>카테고리1 > 카테고리2</p>
              <h4 class="card-product__title"><a href="#">책 이름1</a></h4>
              <p class="card-product__price">10,000원</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 col-xl-3">
          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="card-img img-h350" src="resources/img/BestSeller/product2.jpg" alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>카테고리1 > 카테고리2</p>
              <h4 class="card-product__title"><a href="#">책 이름2</a></h4>
              <p class="card-product__price">10,000원</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 col-xl-3">
          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="card-img img-h350" src="resources/img/BestSeller/product3.jpg" alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>카테고리1 > 카테고리2</p>
              <h4 class="card-product__title"><a href="#">책 이름3</a></h4>
              <p class="card-product__price">10,000원</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 col-xl-3">
          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="card-img img-h350" src="resources/img/BestSeller/product4.jpg" alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>카테고리1 > 카테고리2</p>
              <h4 class="card-product__title"><a href="#">책 이름4</a></h4>
              <p class="card-product__price">10,000원</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 col-xl-3">
          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="card-img img-h350" src="resources/img/BestSeller/product5.jpg" alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>카테고리1 > 카테고리2</p>
              <h4 class="card-product__title"><a href="#">책 이름5</a></h4>
              <p class="card-product__price">10,000원</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 col-xl-3">
          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="card-img img-h350" src="resources/img/BestSeller/product6.jpg" alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>카테고리1 > 카테고리2</p>
              <h4 class="card-product__title"><a href="#">책 이름6</a></h4>
              <p class="card-product__price">10,000원</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 col-xl-3">
          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="card-img img-h350" src="resources/img/BestSeller/product7.jpg" alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>카테고리1 > 카테고리2</p>
              <h4 class="card-product__title"><a href="#">책 이름7</a></h4>
              <p class="card-product__price">10,000원</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 col-xl-3">
          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="card-img img-h350" src="resources/img/BestSeller/product8.jpg" alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>카테고리1 > 카테고리2</p>
              <h4 class="card-product__title"><a href="#">책 이름8</a></h4>
              <p class="card-product__price">10,000원</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- ================ 랭킹 section end ================= -->

  <!-- ================ Blog section start ================= -->
  <section class="blog">
    <div class="container">
      <div class="section-intro pb-60px">
        <p>Popular Item in the market</p>
        <h2>Latest <span class="section-intro__style">News</span></h2>
      </div>

      <div class="row">
        <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
          <div class="card card-blog">
            <div class="card-blog__img">
              <img class="card-img rounded-0" src="resources/img/blog/blog1.png" alt="">
            </div>
            <div class="card-body">
              <ul class="card-blog__info">
                <li><a href="#">By Admin</a></li>
                <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
              </ul>
              <h4 class="card-blog__title"><a href="single-blog.html">The Richland Center Shooping News and weekly shooper</a></h4>
              <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
              <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>
            </div>
          </div>
        </div>

        <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
          <div class="card card-blog">
            <div class="card-blog__img">
              <img class="card-img rounded-0" src="resources/img/blog/blog2.png" alt="">
            </div>
            <div class="card-body">
              <ul class="card-blog__info">
                <li><a href="#">By Admin</a></li>
                <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
              </ul>
              <h4 class="card-blog__title"><a href="single-blog.html">The Shopping News also offers top-quality printing services</a></h4>
              <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
              <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>
            </div>
          </div>
        </div>

        <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
          <div class="card card-blog">
            <div class="card-blog__img">
              <img class="card-img rounded-0" src="resources/img/blog/blog3.png" alt="">
            </div>
            <div class="card-body">
              <ul class="card-blog__info">
                <li><a href="#">By Admin</a></li>
                <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
              </ul>
              <h4 class="card-blog__title"><a href="single-blog.html">Professional design staff and efficient equipment you’ll find we offer</a></h4>
              <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
              <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- ================ Blog section end ================= -->





</main>
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<nav class="sidenav rounded shadow">
  <h4 class="bg-geni p-1 text-white text-center">menu</h4>
  <ul class="text-center ">
    <li><a class="text-dark pt-1 pb-1" href="#">장바구니</a></li>
    <li><a class="text-dark pt-1 pb-1" href="#">결제내역</a></li>
    <li><a class="text-dark pt-1 pb-1" href="#">QnA</a></li>
    <li class="bg-lightgray"><a class="text-dark pt-1 pb-1" href="#">top ▲</a></li>
    <li class="bg-lightgray"><a class="text-dark pt-1 pb-1" href="#">bottom ▼</a></li>
  </ul>
</nav>
<!-- 사이드바 끝 -->


<!--================ 푸터 Start =================-->
<footer class="footer">
  <div class="footer-area bg-geni-ft pt-5 pb-5">
    <div class="container">
      <div class="row section_gap">
        <div class="col-lg-3 col-md-6 col-sm-6">
          <div class="single-footer-widget tp_widgets">
            <img src="resources/img/logo1.png" width="250px">
          </div>
        </div>
        <div class="col-lg-7 col-md-6 col-sm-6">
          <div class="single-footer-widget tp_widgets">
            <span>(주)천재교과서대표: 박정과, 임형진</span>
            <span>주소: 서울특별시 금천구 가산디지털1로 16, 11층 18~20층 (가산동) 고객센터: 02-3282-8705</span>
            <span>사업자 등록번호: 119-81-70643통신판매신고번호: 제 2016-서울금천-1306호[사업자정보확인]신고기관명: 서울금천구청</span>
            <span>호스팅서비스 제공자: 카페24(주) 전자우편: mt@chunjae.co.kr</span>
            <span>Copyright © 2004 By CHUNJAETEXTBOOK Co.,Ltd All Rights Reserved.</span>
          </div>
        </div>
        <div class="col d-grid gap-2">
          <button class="btn btn-success" type="button">사이트맵</button>
        </div>
      </div>
    </div>
  </div>
</footer>
<!--================ 푸터 Start =================-->
<script src="resources/js/swiper-bundle.min.js"></script>
<script>
  var swiper = new Swiper(".mySwiper", {
    pagination: {
      el: ".swiper-pagination",
    },
  });
</script>

<script src="resources/vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="resources/vendors/skrollr.min.js"></script>
<script src="resources/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="resources/vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="resources/vendors/jquery.ajaxchimp.min.js"></script>
<script src="resources/vendors/mail-script.js"></script>
<script src="resources/js/main.js"></script>
</body>
</html>