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
    <jsp:param name="menuGubun" value="payhistory"/>
</jsp:include>
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main class="site-main">
    <!-- ================ start banner area ================= -->
    <section class="bg-img2 p-6" id="category">
        <div class="container h-100 p-3">
            <div class="blog-banner pt-1 pb-1">
                <div class="text-center ">
                    <h1 class=" text-white">결제 내역</h1>
                    <span class=" text-white">My Order</span>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ End banner area ================= -->

    <!-- ============= 결제 내역 Start ============= -->
    <section class="section-margin--small">
        <div class="container">
            <div class="filter-bar">
                <div class="input-group d-flex justify-content-end">
                    <form action="/mypage/payhistory${pageDTO.linked_params}" id="payfrm">
                        <div class="sorting d-flex">
                            <div class="col-auto">
                                <input type="date" class="form-control" id="startDay" name="search_date1">
                            </div>
                            <div>~</div>
                            <div class="col-auto">
                                <input type="date" class="form-control" id="endDay" name="search_date2">
                            </div>
                            <div>
                                <button class="btn btn-success" type="button" id="paybtn">조회</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <c:if test="${dtolist eq []}">
                <div class="row justify-content-center align-items-center pb-3 border-bottom">
                    <div class="col-auto">
                        결제 내역이 없습니다.
                    </div>
                </div>
            </c:if>
            <div class="accordion" id="accordionExample">
                <c:forEach items="${dtolist}" var="list" varStatus="status">
                <div class="card">
                    <div class="card-header" id="heading${status.index}">
                        <h5 class="mb-0 p-3 d-flex justify-content-between"  data-toggle="collapse" data-target="#collapse${status.index}" aria-expanded="true" aria-controls="collapseOne">
                            <div class="d-flex flex-column" style="gap:10px">
                                <span><small>${list.order_date}</small><small> | 총 ${detaillist[status.index].size()}건</small></span>
                                <span> ${CommonUtil.comma(list.total_price)}원</span>
                            </div>
                            <div class="d-flex flex-column align-items-end" style="gap:10px">
                                <small>${list.order_state}</small>
                                <c:if test="${list.order_state eq '배송 전'}">
                                    <button class="btn btn-success" type="button" onclick="cancel('${list.order_num}','Y')"
                                            <c:if test="${list.cancel_YN eq 'Y'}">disabled</c:if>
                                    >주문취소</button>
                                </c:if>
                                <c:if test="${list.order_state eq '주문 취소'}">
                                    <button class="btn btn-success" type="button" onclick="cancel('${list.order_num}','Y')"
                                            <c:if test="${list.cancel_YN eq 'Y'}">disabled</c:if>
                                    >주문취소</button>
                                </c:if>
                                <c:if test="${list.order_state ne '배송 전' and list.cancel_YN eq 'N' and list.order_refund_request eq 'N'}">
                                    <button class="btn btn-success" type="button" onclick="refund('${list.order_num}','Y')">환불요청</button>
                                </c:if>
                                <c:if test="${list.order_state ne '배송 전' and list.order_refund_request eq 'Y'}">
                                    <button class="btn btn-success" type="button" onclick="refund('${list.order_num}','N')" <c:if test="${list.order_refund_response ne null}">disabled</c:if>>
                                        <c:if test="${list.order_refund_response eq null}">환불요청 취소하기</c:if>
                                        <c:if test="${list.order_refund_response eq 'Y'}">환불 완료</c:if>
                                        <c:if test="${list.order_refund_response eq 'N'}">환불 불가</c:if>
                                    </button>
                                </c:if>
                            </div>
                        </h5>
                    </div>
                    <div id="collapse${status.index}" class="collapse" aria-labelledby="heading${status.index}" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table">
                                <colgroup>
                                    <col width="55%" style="width: 55% !important; box-sizing: border-box" />
                                    <col span="3" width="15%" style="width: 15% !important; box-sizing: border-box"  />
                                </colgroup>
                                <thead class="bg-geni-ft">
                                <tr>
                                    <th scope="col" >상품명</th>
                                    <th scope="col" >단가</th>
                                    <th scope="col" >수량</th>
                                    <th scope="col" >합계</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="innerList" value="${detaillist[status.index]}"/>
                                <c:forEach items="${innerList}" var="List">
                                <tr class="">
                                    <td>
                                        <div class="media align-items-center">
                                            <div class="d-flex">
                                                <img class="img-w100 border-gray" src="/resources/upload/book/${List.book_img}" alt="">
                                            </div>
                                            <div class="media-body">
                                                <p>${List.book_name}</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <p>${CommonUtil.comma(List.price)}원</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>${List.amount}</p>
                                    </td>
                                    <td class="align-middle">
                                        <p>${CommonUtil.comma(List.total_price)}원</p>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                    <c:set var="i">${i}+1</c:set>
                </c:forEach>


            </div>
            </div>
        </div>
    </section>
    <!--================페이징 내역 Start =================-->
    <nav class="blog-pagination justify-content-center d-flex">
        <ul class="pagination">
            <c:if test="${pageDTO.page<=10}">
            <li class="page-item disabled">
                </c:if>
                <c:if test="${pageDTO.page>10}">
            <li class="page-item">
                </c:if>
                <a class="page-link" href="/mypage/payhistory?${pageDTO.linked_params}&page=${pageDTO.page_block_end-10}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach begin="${pageDTO.page_block_start}" end="${pageDTO.page_block_end}" var="i">
                <c:if test="${pageDTO.page == i}">
                    <li class="page-item active">
                        <a class="page-link" href="/mypage/payhistory${pageDTO.linked_params}&page=${i}">${i}</a>
                    </li>
                </c:if>
                <c:if test="${pageDTO.page != i}">
                    <li class="page-item">
                        <a class="page-link" href="/mypage/payhistory${pageDTO.linked_params}&page=${i}">${i}</a>
                    </li>
                </c:if>
            </c:forEach>
            <%--                            <li class="page-item"><a class="page-link" href="/admin/order/list?page=2">2</a></li>--%>
            <%--                            <li class="page-item"><a class="page-link" href="/admin/order/list?page=3">3</a></li>--%>
            <c:if test="${(pageDTO.page_block_start+10)>=(pageDTO.total_page)}">
            <li class="page-item disabled">
                </c:if>
                <c:if test="${(pageDTO.page_block_start+10)<(pageDTO.total_page)}">
            <li class="page-item">
                </c:if>
                <a class="page-link" href="/mypage/payhistory${pageDTO.linked_params}&page=${pageDTO.page_block_start+10}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>

    <!--================페이징 내역 End =================-->
    <!--  ============= 결제 내역 End =============  -->
</main>
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!--================ 푸터 End =================-->

<script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="/resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/resources/vendors/skrollr.min.js"></script>
<script src="/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/resources/vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="/resources/vendors/jquery.ajaxchimp.min.js"></script>
<script src="/resources/vendors/mail-script.js"></script>
<script src="/resources/js/main.js"></script>
<script>
    document.querySelector("#paybtn").addEventListener('click',()=>{
        document.querySelector("#payfrm").submit();
    });

    function refund(item,item1){

        if(confirm("정말 환불하시겠습니까?")){
            $.ajax({
                url:"/mypage/refundRequest.dox",
                dataType:"json",
                type : "POST",
                data : {
                    "order_num":item,
                    "order_refund_request" : item1
                },
                success : function(data) {
                    if(data.result == "success"){
                        console.log("성공");
                        alert("환불 요청이 정상처리 되었습니다.");
                        location.href="/mypage/payhistory${pageDTO.linked_params}&page=${pageDTO.page}"
                    }else{
                        alert(data.message);
                    }
                },
                fail : function (data){
                    console.log("실패");
                }

            });
        }
    }

    function cancel(item,item1){

        if(confirm("정말 해당 주문을 취소하시겠습니까? \n 취소하신 주문은 복구되지 않습니다.")){
            $.ajax({
                url:"/mypage/cancelRequest.dox",
                dataType:"json",
                type : "POST",
                data : {
                    "order_num":item,
                    "order_cancel_request" : item1
                },
                success : function(data) {
                    if(data.result == "success"){
                        console.log("성공");
                        alert("주문이 성공적으로 취소되었습니다.");
                        location.href="/mypage/payhistory${pageDTO.linked_params}&page=${pageDTO.page}"
                    }else{
                        alert(data.message);
                    }
                },
                fail : function (data){
                    console.log("실패");
                }

            });
        }
    }
</script>
</body>

