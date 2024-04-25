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
    <!-- ================ start banner area ================= -->
    <section class="bg-img1 p-6" id="category">
        <div class="container h-100 p-3">
            <div class="blog-banner pt-1 pb-1">
                <div class="text-center ">
                    <h1 class=" text-white">교재</h1>
                    <span class=" text-white">Books</span>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ end banner area ================= -->

    <!--================Single Product Area =================-->
    <div class="product_image_area">
        <div class="container">
            <div class="row s_product_inner">
                <div class="col-lg-6">
                    <div class="owl-carousel owl-theme s_Product_carousel">
                        <div class="single-prd-item">
                            <img class="img-fluid " src="/resources/img/category/sample.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 offset-lg-1">
                    <div class="s_product_text">
                        <h3>상품명 입니다.</h3>
                        <h2><s class="text-muted h6">10,000원</s> 15,000원</h2>
                        <ul class="list">
                            <li>카테고리 : 카테고리1 > 카테고리2</li>
                            <li>저자 : 김저자</li>
                            <li>출판일 : 2024-04-25</li>
                            <li>출판사 : 지현문구</li>
                            <li>ISBN : 9791156144304</li>
                            <li>평점 :
                                <span class="card-product__rank stars">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </span>
                            </li>
                        </ul>
                        <p>문제와 문제 사이의 연결고리, 연습과 실전 사이의 징검다리 <br>
                            - 그동안 설맞이팀이 출제했던 모든 문항에, 최신 경향을 고려한 신규문항이 추가된 110문항 수록 <br>
                            - 단순히 문제만 모아 두는 것을 넘어, 수학 학습에 도움이 되도록 설계된 든든한 길잡이</p>
                        <div class="product_count pt-2">
                            <label for="qty">수량 :</label>
                            <input type="number" name="qty" id="sst" size="2" maxlength="12" value="1" title="Quantity:" class="input-text qty">
                        </div>
                        <div class="d-grid gap-2">
                            <button class="button primary-outline-btn" type="button">바로 구매</button>
                            <button class="button primary-outline-btn" type="button">장바구니에 담기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--================End Single Product Area =================-->

    <!--================Product Description Area =================-->
    <section class="product_description_area">
        <div class="container">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">소개 글</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
                       aria-selected="false">목차</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
                       aria-selected="false">리뷰(00)</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active show" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div class="p-4">
                        <video src="/resources/video/welcomeboard%20(2).mp4" class="w-100" controls></video>
                    </div>
                    <div>
                        <p>Beryl Cook is one of Britain’s most talented and amusing artists .Beryl’s pictures feature women of all shapes
                            and sizes enjoying themselves .Born between the two world wars, Beryl Cook eventually left Kendrick School in
                            Reading at the age of 15, where she went to secretarial school and then into an insurance office. After moving to
                            London and then Hampton, she eventually married her next door neighbour from Reading, John Cook. He was an
                            officer in the Merchant Navy and after he left the sea in 1956, they bought a pub for a year before John took a
                            job in Southern Rhodesia with a motor company. Beryl bought their young son a box of watercolours, and when
                            showing him how to use it, she decided that she herself quite enjoyed painting. John subsequently bought her a
                            child’s painting set for her birthday and it was with this that she produced her first significant work, a
                            half-length portrait of a dark-skinned lady with a vacant expression and large drooping breasts. It was aptly
                            named ‘Hangover’ by Beryl’s husband and</p>
                        <p>It is often frustrating to attempt to plan meals that are designed for one. Despite this fact, we are seeing
                            more and more recipe books and Internet websites that are dedicated to the act of cooking for one. Divorce and
                            the death of spouses or grown children leaving for college are all reasons that someone accustomed to cooking for
                            more than one would suddenly need to learn how to adjust all the cooking practices utilized before into a
                            streamlined plan of cooking that is more efficient for one person creating less</p>
                    </div>
                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>
                                    <h5>Label 0.</h5>
                                </td>
                                <td>
                                    <h5>수능 수학 학습 방법</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>Label 1.</h5>
                                </td>
                                <td>
                                    <h5>지수와 로그</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>Label 2.</h5>
                                </td>
                                <td>
                                    <h5>지수함수와 로그함수</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>Label 3.</h5>
                                </td>
                                <td>
                                    <h5>삼각함수</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>Label 4.</h5>
                                </td>
                                <td>
                                    <h5>사인법칙과 코사인법칙</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>Label 5.</h5>
                                </td>
                                <td>
                                    <h5>등차수열과 등비수열</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>Label 6.</h5>
                                </td>
                                <td>
                                    <h5>수열의 합</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>Label 7</h5>
                                </td>
                                <td>
                                    <h5>수열의 귀납적 정의</h5>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade show" id="review" role="tabpanel" aria-labelledby="review-tab">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="row total_rate">
                                <div class="col-6">
                                    <div class="box_total">
                                        <h5>평균 평점</h5>
                                        <h4>4.0</h4>
                                        <h6>(00명 참여)</h6>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="rating_list">
                                        <h3>점수별 비율</h3>
                                        <ul class="list">
                                            <li><a href="#">5점 <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                    class="fa fa-star"></i><i class="fa fa-star"></i> 00</a></li>
                                            <li><a href="#">4점 <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                    class="fa fa-star"></i><i class="fa fa-star text-secondary"></i> 00</a></li>
                                            <li><a href="#">3점 <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                    class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i> 00</a></li>
                                            <li><a href="#">2점 <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star text-secondary"></i><i
                                                    class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i> 00</a></li>
                                            <li><a href="#">1점 <i class="fa fa-star"></i><i class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i><i
                                                    class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i> 00</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="review_list">
                                <div class="review_item">
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="/resources/img/product/review-1.png" alt="">
                                        </div>
                                        <div class="media-body">
                                            <h4>장지현</h4>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                        commodo</p>
                                </div>
                                <div class="review_item">
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="/resources/img/product/review-2.png" alt="">
                                        </div>
                                        <div class="media-body">
                                            <h4>Blake Ruiz</h4>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                        commodo</p>
                                </div>
                                <div class="review_item">
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="/resources/img/product/review-3.png" alt="">
                                        </div>
                                        <div class="media-body">
                                            <h4>Blake Ruiz</h4>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                        commodo</p>
                                </div>
                                <nav class="blog-pagination justify-content-center d-flex">
                                    <ul class="pagination">
                                        <li class="page-item">
                                            <a href="#" class="page-link" aria-label="Previous">&lt;</a>
                                        </li>
                                        <li class="page-item">
                                            <a href="#" class="page-link">01</a>
                                        </li>
                                        <li class="page-item active">
                                            <a href="#" class="page-link">02</a>
                                        </li>
                                        <li class="page-item">
                                            <a href="#" class="page-link">03</a>
                                        </li>
                                        <li class="page-item">
                                            <a href="#" class="page-link">04</a>
                                        </li>
                                        <li class="page-item">
                                            <a href="#" class="page-link">09</a>
                                        </li>
                                        <li class="page-item">
                                            <a href="#" class="page-link" aria-label="Next">&gt;</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="review_box">
                                <h4>리뷰 작성</h4>
                                <p>별점을 선택해주세요.</p><br>
                                <ul class="list star-list">
                                    <li><a href="#" data-score="1"><i class="fa fa-star"></i></a></li>
                                    <li><a href="#" data-score="2"><i class="fa fa-star"></i></a></li>
                                    <li><a href="#" data-score="3"><i class="fa fa-star"></i></a></li>
                                    <li><a href="#" data-score="4"><i class="fa fa-star"></i></a></li>
                                    <li><a href="#" data-score="5"><i class="fa fa-star"></i></a></li>
                                </ul>
                                <form action="#/" class="form-contact form-review mt-3">
                                    <div class="form-group">
                                        <textarea class="form-control different-control w-100" name="textarea" id="textarea" cols="30" rows="5" placeholder="Enter Message"></textarea>
                                    </div>
                                    <div class="form-group text-center text-md-right mt-3">
                                        <button type="submit" class="button button--active button-review">Submit Now</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Product Description Area =================-->

</main>
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!--================ 푸터 End =================-->
<script>
    let stars = document.querySelectorAll('.star-list li a');
    for(let star of stars) {
        star.addEventListener("click", (event)=>{
            event.preventDefault();
            let score = star.dataset.score;
            for(let i = 1; i <= stars.length; i++) {
                console.log(stars[i]);
                stars[i].classList.remove('stars');
            }
            for(let i = 1; i <= score; i++) {
                stars[i].classList.add('stars');
            }
        })
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

