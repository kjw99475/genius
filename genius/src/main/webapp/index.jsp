<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>geinus</title>
  <link rel="icon" href="/img/Fevicon.png" type="image/png">
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
        <div class="swiper-slide"><img src="/resources/img/banner/banner1.jpg"></div>
        <div class="swiper-slide"><img src="/resources/img/banner/banner2.jpg"></div>
        <div class="swiper-slide"><img src="/resources/img/banner/banner3.jpg"></div>
        <div class="swiper-slide"><img src="/resources/img/banner/banner4.jpg"></div>
        <div class="swiper-slide"><img src="/resources/img/banner/banner5.jpg"></div>
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
              <img class="card-img img-h350" src="/resources/img/BestSeller/product1.jpg" alt="">
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
              <img class="card-img img-h350" src="/resources/img/BestSeller/product2.jpg" alt="">
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
              <img class="card-img img-h350" src="/resources/img/BestSeller/product3.jpg" alt="">
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
              <img class="card-img img-h350" src="/resources/img/BestSeller/product4.jpg" alt="">
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
              <img class="card-img img-h350" src="/resources/img/BestSeller/product5.jpg" alt="">
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
              <img class="card-img img-h350" src="/resources/img/BestSeller/product6.jpg" alt="">
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
              <img class="card-img img-h350" src="/resources/img/BestSeller/product7.jpg" alt="">
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
              <img class="card-img img-h350" src="/resources/img/BestSeller/product8.jpg" alt="">
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

  <!-- ================ 신간 section start ================= -->
  <section class="section-margin calc-60px">
    <div class="container">
      <div class="section-intro pb-4">
        <p>따끈따근한 신간 소개</p>
        <h2><span class="section-intro__style">New</span> Books</h2>
      </div>
      <div class="owl-carousel owl-theme owl-loaded owl-drag" id="bestSellerCarousel">
        <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-1140px, 0px, 0px); transition: all 0s ease 0s; width: 4560px;"><div class="owl-item cloned" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product1.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Accessories</p>
            <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item cloned" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product2.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Beauty</p>
            <h4 class="card-product__title"><a href="single-product.html">Women Freshwash</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item cloned" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product3.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Decor</p>
            <h4 class="card-product__title"><a href="single-product.html">Room Flash Light</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item cloned" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product4.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Decor</p>
            <h4 class="card-product__title"><a href="single-product.html">Room Flash Light</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item active" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product1.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Accessories</p>
            <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item active" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product2.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Beauty</p>
            <h4 class="card-product__title"><a href="single-product.html">Women Freshwash</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item active" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product3.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Decor</p>
            <h4 class="card-product__title"><a href="single-product.html">Room Flash Light</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item active" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product4.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Decor</p>
            <h4 class="card-product__title"><a href="single-product.html">Room Flash Light</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product1.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Accessories</p>
            <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product2.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Beauty</p>
            <h4 class="card-product__title"><a href="single-product.html">Women Freshwash</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product3.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Decor</p>
            <h4 class="card-product__title"><a href="single-product.html">Room Flash Light</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product4.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Decor</p>
            <h4 class="card-product__title"><a href="single-product.html">Room Flash Light</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item cloned" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product1.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Accessories</p>
            <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item cloned" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product2.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Beauty</p>
            <h4 class="card-product__title"><a href="single-product.html">Women Freshwash</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item cloned" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product3.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Decor</p>
            <h4 class="card-product__title"><a href="single-product.html">Room Flash Light</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div><div class="owl-item cloned" style="width: 255px; margin-right: 30px;"><div class="card text-center card-product">
          <div class="card-product__img">
            <img class="img-fluid img-h350" src="/resources/img/BestSeller/product4.jpg" alt="">
            <ul class="card-product__imgOverlay">
              <li><button><i class="ti-search"></i></button></li>
              <li><button><i class="ti-shopping-cart"></i></button></li>
              <li><button><i class="ti-heart"></i></button></li>
            </ul>
          </div>
          <div class="card-body">
            <p>Decor</p>
            <h4 class="card-product__title"><a href="single-product.html">Room Flash Light</a></h4>
            <p class="card-product__price">$150.00</p>
          </div>
        </div></div></div></div><div class="owl-nav"><button type="button" role="presentation" class="owl-prev"><i class="ti-arrow-left"></i></button><button type="button" role="presentation" class="owl-next"><i class="ti-arrow-right"></i></button></div><div class="owl-dots disabled"></div></div>
    </div>
  </section>
  <!-- ================ 신간 section end ================= -->

  <!-- ================ 게시판 section end ================= -->
  <section class="blog">
    <div class="container pb-5">
      <div class="section-intro pb-4">
        <h2><span class="section-intro__style">Review</span></h2>
      </div>
      <div class="row">
        <div class="col-md-12 col-lg-12 mb-4 mb-lg-0">
          <div class="card card">
            <div class="list-group">
              <a href="#" class="list-group-item list-group-item-action d-flex">
                <img class="rounded-circle shadow-sm align-self-center" src="/resources/img/gallery/r2.jpg" width="70px" height="70px">
                <div class="d-flex flex-column ml-4 align-self-center">
                  <span>★★★★★</span>
                  <span>제 인생 최고이 책 입니다.</span>
                  <small>작성자 : 어쩌고</small>
                  <small>책 이름 : 이 세상 최고의 책</small>
                </div>
              </a>
              <a href="#" class="list-group-item list-group-item-action d-flex">
                <img class="rounded-circle shadow-sm align-self-center" src="/resources/img/gallery/r2.jpg" width="70px" height="70px">
                <div class="d-flex flex-column ml-4 align-self-center">
                  <span>★★★★★</span>
                  <span>제 인생 최고이 책 입니다.</span>
                  <small>작성자 : 어쩌고</small>
                  <small>책 이름 : 이 세상 최고의 책</small>
                </div>
              </a>
              <a href="#" class="list-group-item list-group-item-action d-flex">
                <img class="rounded-circle shadow-sm align-self-center" src="/resources/img/gallery/r3.jpg" width="70px" height="70px">
                <div class="d-flex flex-column ml-4 align-self-center">
                  <span>★★★★★</span>
                  <span>제 인생 최고이 책 입니다.</span>
                  <small>작성자 : 어쩌고</small>
                  <small>책 이름 : 이 세상 최고의 책</small>
                </div>
              </a>
              <a href="#" class="list-group-item list-group-item-action d-flex">
                <img class="rounded-circle shadow-sm align-self-center" src="/resources/img/gallery/r5.jpg" width="70px" height="70px">
                <div class="d-flex flex-column ml-4 align-self-center">
                  <span>★★★★★</span>
                  <span>제 인생 최고이 책 입니다.</span>
                  <small>작성자 : 어쩌고</small>
                  <small>책 이름 : 이 세상 최고의 책</small>
                </div>
              </a>
            </div>
          </div>
        </div>



      </div>
    </div>
  </section>
  <!-- ================ 게시판 section end ================= -->





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
  var swiper = new Swiper(".mySwiper", {
    pagination: {
      el: ".swiper-pagination",
    },
  });
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