<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-04-25
  Time: 오후 1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="org.fullstack4.genius.Common.CommonUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <jsp:param name="menuGubun" value="book"/>
</jsp:include>
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
                            <img class="img-fluid " src="/resources/upload/book/${bookDTO.book_img}" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 offset-lg-1">
                    <div class="s_product_text">
                        <h3>${bookDTO.book_name}</h3>
                        <h2><s class="text-muted h6">${CommonUtil.comma(bookDTO.price)}원</s> ${CommonUtil.comma(bookDTO.discount_price)}원</h2>
                        <ul class="list">
                            <li>카테고리 : ${bookDTO.class_name} > ${bookDTO.subject_name}</li>
                            <li>저자 : ${bookDTO.author}</li>
                            <li>출판일 : ${bookDTO.publication_date}</li>
                            <li>출판사 : ${bookDTO.publisher}</li>
                            <li>ISBN : ${bookDTO.isbn}</li>
                            <li>재고 : <strong>${bookDTO.quantity}</strong></li>
                            <li>판매 상태 : <c:if test="${bookDTO.sales_status == '1'}"><span class="badge bg-success text-white" style="padding:5px;">판매중</span></c:if>
                                           <c:if test="${bookDTO.sales_status == '2'}"><span class="badge bg-warning text-white" style="padding:5px;">판매준비중</span></c:if>
                                           <c:if test="${bookDTO.sales_status == '3'}"><span class="badge bg-dark text-white" style="padding:5px;">판매종료</span></c:if>
                                           <c:if test="${bookDTO.sales_status == '4'}"><span class="badge bg-danger text-white" style="padding:5px;">품절</span></c:if></li>

                            <li>판매 기간:${bookDTO.sales_start_date}~${bookDTO.sales_end_date}</li>
                            <li>평점 :
                                <span class="card-product__rank stars">
                                    <c:choose>
                                        <c:when test="${bookDTO.rank_avg > 0}">
                                            <c:forEach begin="1" end="5" step="1" varStatus="status">
                                                <c:if test="${status.index <= bookDTO.rank_avg}">
                                                    <i class="fa fa-star"></i>
                                                </c:if>
                                                <c:if test="${status.index > bookDTO.rank_avg}">
                                                    <i class="fa fa-star text-secondary"></i>
                                                </c:if>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach begin="1" end="5" step="1">
                                                <i class="fa fa-star text-secondary"></i>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </li>

                        </ul>
                        <p>${bookDTO.book_info}</p>
                        <div class="product_count pt-2">
                            <label for="sst">수량 :</label>
                            <input type="number" name="qty" id="sst" size="2" maxlength="12" value="0" title="Quantity:" class="input-text qty">
                        </div>
                        <div class="d-grid gap-2">
                            <button id="scrollTarget" class="button primary-outline-btn" type="button" onclick="purchasepage()">바로 구매</button>
                            <button class="button primary-outline-btn" type="button" onclick="addcart()">장바구니에 담기</button>
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
                    <a class="nav-link active tab-a" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">소개 글</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link tab-a" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
                       aria-selected="false">목차</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link tab-a" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
                       aria-selected="false">리뷰(${reviewList.size()})</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active show tab-div" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div class="p-4">
                        <video src="/resources/upload/video/${bookDTO.video}" class="w-100" controls></video>
                    </div>
                    <div>
                        <p>${bookDTO.book_info}</p>
                    </div>
                </div>
                <div class="tab-pane fade tab-div" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                                <c:set var="contents" value="${fn:split(bookDTO.contents,'|' )}"/>
                                <c:forEach items="${contents}" var="content" varStatus="i">
                                    <tr>
                                        <td>
                                            <h5>Label ${i.index}.</h5>
                                        </td>
                                        <td>
                                            <h5>${content}</h5>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade tab-div" id="review" role="tabpanel" aria-labelledby="review-tab">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="row total_rate">
                                <div class="col-6">
                                    <div class="box_total">
                                        <h5>평균 평점</h5>
                                        <h4>${bookDTO.rank_avg}</h4>
                                        <h6>(${reviewList.size()}명 참여)</h6>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="rating_list">
                                        <h3>점수별 비율</h3>
                                        <ul class="list">
                                            <li><a href="#">5점 <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                    class="fa fa-star"></i><i class="fa fa-star"></i> ${rank_arr[5]}</a></li>
                                            <li><a href="#">4점 <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                    class="fa fa-star"></i><i class="fa fa-star text-secondary"></i> ${rank_arr[4]}</a></li>
                                            <li><a href="#">3점 <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                    class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i> ${rank_arr[3]}</a></li>
                                            <li><a href="#">2점 <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star text-secondary"></i><i
                                                    class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i> ${rank_arr[2]}</a></li>
                                            <li><a href="#">1점 <i class="fa fa-star"></i><i class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i><i
                                                    class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i> ${rank_arr[1]}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="review_list" id="review_list">
                                <c:forEach items="${responseDTO.dtoList}" var="review">
                                    <div class="review_item">
                                        <div class="media">
                                            <div class="d-flex rounded-circle flow-hidden h-50px w-50px mr-2">
                                                <img src="/resources/upload/profile/${review.profile}" alt="">
                                            </div>
                                            <div class="media-body">
                                                <h4>${review.member_id}</h4>
                                                <c:choose>
                                                    <c:when test="${review.rank > 0}">
                                                        <c:forEach begin="1" end="5" step="1" varStatus="status">
                                                            <c:if test="${status.index <= review.rank}">
                                                                <i class="fa fa-star"></i>
                                                            </c:if>
                                                            <c:if test="${status.index > review.rank}">
                                                                <i class="fa fa-star text-secondary"></i>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach begin="1" end="5" step="1">
                                                            <i class="fa fa-star text-secondary"></i>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <p>${review.review_contents}</p>
                                        <div class="pt-2 pb-2">
                                            <form action="/review/delete" method="post" name="frmRegistReview">
                                                <input type="hidden" value="${review.review_idx}" name="review_idx">
                                                <input type="hidden" value="${review.book_code}" name="book_code">
                                                <c:if test="${review.member_id == sessionScope.member_id}">
                                                    <button type="submit" class="btn btn-sm btnRemove">삭제</button>
                                                </c:if>
                                            </form>

                                        </div>
                                    </div>
                                </c:forEach>
                                <nav class="blog-pagination justify-content-center d-flex">
                                    <ul class="pagination">
                                        <li class="page-item <c:if test="${responseDTO.page_block_start - responseDTO.page_block_size < '1'}"> disabled</c:if>" >
                                            <a href="<c:if test="${responseDTO.page_block_start - responseDTO.page_block_size >= '1'}">${responseDTO.linked_params}&page=${responseDTO.page_block_start - responseDTO.page_block_size}&page_flag=1</c:if>"
                                               class="page-link" aria-label="Previous">&laquo;
                                            </a>
                                        </li>
                                        <c:forEach begin="${responseDTO.page_block_start}"
                                                   end="${responseDTO.page_block_end}"
                                                   var="page_num">
                                            <c:choose>
                                                <c:when test="${responseDTO.page == page_num}">
                                                    <li class="page-item active">
                                                        <a href="#" class="page-link">${page_num}</a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item">
                                                        <a href="${responseDTO.linked_params}&page=${page_num}&page_flag=1" class="page-link">${page_num}</a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <li class="page-item <c:if test="${responseDTO.page_block_start + responseDTO.page_block_size > responseDTO.total_page}"> disabled</c:if>">
                                            <a href="<c:if test="${responseDTO.page_block_start + responseDTO.page_block_size < responseDTO.total_page}">${responseDTO.linked_params}&page=${responseDTO.page_block_start + responseDTO.page_block_size}&page_flag=1</c:if>
                        " class="page-link" aria-label="Next">&raquo;</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>

                        </div>
                        <div class="col-lg-6">
                            <div class="review_box">
                                <h4>리뷰 작성</h4>
                                <p>별점을 선택해주세요.</p><br>
                                <ul class="list star-list" id="star_ul">
                                    <li><a href="#" data-score="1"><i class="fa fa-star"></i></a></li>
                                    <li><a href="#" data-score="2"><i class="fa fa-star"></i></a></li>
                                    <li><a href="#" data-score="3"><i class="fa fa-star"></i></a></li>
                                    <li><a href="#" data-score="4"><i class="fa fa-star"></i></a></li>
                                    <li><a href="#" data-score="5"><i class="fa fa-star"></i></a></li>
                                </ul>
                                <form action="/review/regist.dox" class="form-contact form-review mt-3" method="post" id="frmReviewRegist">
                                    <input type="hidden" value="${param.book_code}" name="book_code"/>
                                    <input type="hidden" value="" name="rank" id="rank"/>
                                    <input type="hidden" value="${sessionScope.member_id}" name="member_id"/>
                                    <div class="form-group">
                                        <textarea class="form-control different-control w-100" name="review_contents" id="review_contents" cols="30" rows="5" placeholder="리뷰를 작성해주세요"></textarea>
                                    </div>
                                    <div class="form-group text-center text-md-right mt-3">
                                        <button type="submit" id="reviewBtn" class="button button--active button-review">작성하기</button>
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
    window.onload = function() {
        // 특정 조건 확인
        if (${param.registOK == '1'} || ${param.deleteOK == '1'} ||${responseDTO.page_flag == '1'}) {
            reviewTAB();
        }
    };
    let stars = document.querySelectorAll('.star-list li a');
    let realStars =  document.querySelectorAll('.star-list li a i');
    let score=0;
    let reviewBtn = document.querySelector('#reviewBtn');
    let reviewTab = document.querySelector('#review-tab');
    let reviewOK = "<c:out value='${param.registOK}'/>"
    let btnRemove = document.querySelectorAll('.btnRemove');
    let tabA = document.querySelectorAll('.tab-a');
    let tabDiv = document.querySelectorAll('.tab-div');
    function reviewTAB(){
            for(let i=0;i<tabA.length;i++){
                tabA[i].classList.remove('active');
            }
            tabA[2].classList.add('active');
            for(let i=0;i<tabDiv.length;i++){
                tabDiv[i].classList.remove('active', 'show');
            }
            tabDiv[2].classList.add('active');
            tabDiv[2].classList.add('show');
            var targetElement = document.getElementById('scrollTarget');
            var targetRect = targetElement.getBoundingClientRect();

            window.scrollTo({
                top: window.scrollY + targetRect.top
            });
            // document.querySelector('#review-tab').click();
    }

    function purchasepage(){
        let quantity = document.querySelector("#sst").value;
        if(quantity <= 0){
            alert("수량을 입력해라");
        }else{
            location.href='/order/payment1?book_code=${bookDTO.book_code}&quantity='+quantity;
        }

    }

    function addcart(){
        $.ajax({
            url:"/mypage/addcart.dox",
            dataType:"json",
            type : "POST",
            data : {
                "member_id":"${sessionScope['member_id']}",
                "book_code":"${bookDTO.book_code}",
                "quantity" :document.querySelector("#sst").value
            },
            success : function(data) {
                alert("장바구니 성공");///문제가 있을수 있어용
            },
            fail : function (data){

            }

        });

    }
    // $(document).ready(function() {
    //     // 버튼 클릭 이벤트를 처리합니다.
    //     $('#reviewBtn').click(function() {
    //         // 폼 제출을 실행합니다.
    //         //$('#frmReviewRegist').submit();
    //     });
    //
    //         $('#frmReviewRegist').submit(function(event){
    //             event.preventDefault();
    //             let formData = $(this).serialize();
    //             console.log(formData);
    //             $.ajax({
    //                 url: '/review/regist.dox',
    //                 type:'POST',
    //                 data: formData,
    //                 success:function(data){
    //                     console.log('data : ' + data);
    //                     // console.log(response)
    //                     // let regist = response.registOK;
    //                     if(data == 1){
    //                         console.log('dddd');
    //                     }
    //
    //                 },
    //                 error: function(xhr, status, error) {
    //                     // Ajax 요청이 실패한 경우, 에러를 콘솔에 출력합니다.
    //                     console.error(error);
    //                 }
    //             });
    //         });
    // });
    // function reviewregist(){
    //     $.ajax({
    //         url:"/review/regist.dox",
    //         dataType:"json",
    //         type : "POST",
    //         data : {
    //             "member_id":"test"
    //         },
    //         success : function(data) {
    //             list = data.dto;
    //         }
    //     });
    // }

    console.log('reviewOK : ' + reviewOK);
    // if(reviewOK == 1){
    //     for(let i=0;i<tabA.length;i++){
    //         tabA[i].classList.remove('active');
    //     }
    //     tabA[2].classList.add('active');
    //     for(let i=0;i<tabDiv.length;i++){
    //         tabDiv[i].classList.remove('active', 'show');
    //     }
    //     tabDiv[2].classList.add('active');
    //     tabDiv[2].classList.add('show');
    //
    //     document.querySelector('#review-tab').click();
    // }
    for(let i=0;i<btnRemove.length;i++){
        btnRemove[i].addEventListener("click", function(e){
            e.preventDefault();
            if(confirm('해당 리뷰를 삭제 하시겠습니까?')){
                this.parentNode.submit();
            }
        });
    }
    function reviewDel(event){
        event.preventDefault();

    }

    for(let star of stars) {
        star.addEventListener("click", (event)=>{
            event.preventDefault();
            document.querySelector('#star_ul').style.border = 'none';
            for(let i = 0; i < stars.length; i++) {
                realStars[i].classList.remove('stars');
            }
            score = star.dataset.score;
            document.getElementById("rank").value = score;
            console.log(star);
            console.log(score);
            for(let i = 0; i < score; i++) {
                realStars[i].classList.add('stars');
            }
        })
    }
    // reviewBtn.addEventListener("click",function(e){
    //     e.preventDefault();
    //     e.stopPropagation();
    //     let reviewText = document.querySelector('#review_contents');
    //
    //     if(score == 0){
    //         console.log(1);
    //         document.querySelector('#star_ul').style.border = '1px solid lightblue'
    //         return;
    //     }
    //     document.getElementById("rank").value=score;
    //     if(reviewText.value==""){
    //         console.log(2);
    //         reviewText.focus();
    //         return;
    //     }
    //     document.querySelector('#frmReviewRegist').submit();
    //
    // })
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

