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
    <jsp:param name="menuGubun" value="cart"/>
</jsp:include>
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main class="site-main">
    <!-- ================ start banner area ================= -->
    <section class="bg-img2 p-6" id="category">
        <div class="container h-100 p-3">
            <div class="blog-banner pt-1 pb-1">
                <div class="text-center ">
                    <h1 class=" text-white">장바구니</h1>
                    <span class=" text-white">cart</span>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ End banner area ================= -->
    <!--================Cart Area =================-->
    <section class="cart_area">
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive">
                    <div class="d-flex align-items-center justify-content-end pb-2" style="gap: 10px">
                        <button type="button" class="btn btn-default rounded" onclick="deleteChoices()">삭제</button>
                        <button class="btn btn-success rounded purchase">구매하기</button>
                    </div>
                    <table class="table">
                        <colgroup>
                            <col width="65%" style="width: 65% !important; box-sizing: border-box" />
                            <col span="3" width="10%" style="width: 10% !important; box-sizing: border-box"  />
                            <col width="5%" style="width: 5% !important; box-sizing: border-box; text-align: center;"  />
                        </colgroup>
                        <thead class="bg-geni-ft">
                            <tr>
                                <th scope="col" >상품명</th>
                                <th scope="col" >정가</th>
                                <th scope="col" >할인가</th>
                                <th scope="col" >수량</th>
                                <th scope="col" >합계</th>
                                <th scope="col" style="text-align: center;">
                                    <input id="chooseAll" type="checkbox" checked id="checkAll" onchange="chooseAllOrNothing(this)">
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="5">
                                <c:if test="${list eq []}">
                                    <div class="row justify-content-center align-items-center pb-3 border-bottom">
                                        <div class="col-auto">
                                            장바구니에 상품이 없습니다.
                                        </div>
                                    </div>
                                </c:if>
                            </td>
                        </tr>
                        <c:forEach items="${list}" var="list">
                            <tr>
                            <td>
                                <div class="media">
                                    <div class="d-flex">
                                        <img class="img-w150 border-gray" src="/resources/upload/book/${list.book_img}" alt="">
                                    </div>
                                    <div class="media-body">
                                        <p><a href="/book/view?book_code=${list.book_code}" style="color:black;">${list.book_name}</a></p>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <h5><input readonly class="border-0 price p-0 w-50px text-right" data-idx="1" type="text" name="price1" value="${CommonUtil.comma(list.price)}"></h5>
                            </td>
                                <td>
                                    <h5><input readonly class="border-0 discount_price p-0 w-50px text-right" data-idx="1" type="text" name="price1" value="${CommonUtil.comma(list.discount_price)}"></h5>
                                </td>
                            <td>
                                <div class="product_count">
                                    <div class="product_count">
                                        <input type="number" name="qty" id="quantity1" maxlength="12" value="${list.quantity}" title="Quantity:"
                                               class="input-text qty" onchange="calculateSubTotal(this, ${list.discount_price},'${list.book_code}')" min="0">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <h5><input readonly class="border-0 text-right subtotal p-0 w-100px" data-idx="1" type="text" name="subtotal2" value="0"></h5>
                            </td>
                            <td style="text-align: center;"><input class="choose" type="checkbox" id="check1" checked value="${list.cart_idx}"></td>
                        </tr>
                        </c:forEach>
                            <tr>
                                <td colspan="4">
                                    <h5>총계</h5>
                                </td>
                                <td>
                                    <h5><input id="total" readonly class="border-0 text-right p-0 w-100px" type="text" name="total" value="0"></h5>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="d-flex align-items-center justify-content-end" style="gap: 10px">
                        <button type="button" class="btn btn-default rounded" onclick="deleteChoices()">삭제</button>
                        <button type="button"  class="btn btn-success rounded purchase">구매하기</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Cart Area =================-->

    <!--================페이징 내역 Start =================-->
    <nav class="blog-pagination justify-content-center d-flex">
        <ul class="pagination">
            <c:if test="${pageDTO.page<=10}">
            <li class="page-item disabled">
                </c:if>
                <c:if test="${pageDTO.page>10}">
            <li class="page-item">
                </c:if>
                <a class="page-link" href="/mypage/cart?page=${pageDTO.page_block_end-10}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach begin="${pageDTO.page_block_start}" end="${pageDTO.page_block_end}" var="i">
                <c:if test="${pageDTO.page == i}">
                    <li class="page-item active">
                        <a class="page-link" href="/mypage/cart?page=${i}">${i}</a>
                    </li>
                </c:if>
                <c:if test="${pageDTO.page != i}">
                    <li class="page-item">
                        <a class="page-link" href="/mypage/cart?page=${i}">${i}</a>
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
                <a class="page-link" href="/mypage/cart?page=${pageDTO.page_block_start+10}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>

    <!--================페이징 내역 End =================-->
</main>
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!--================ 푸터 End =================-->

<script>
    /* 테스트 용 */
    let chooses = document.querySelectorAll('.choose');
    let purchase = document.querySelectorAll('.purchase');
    for(let pur of purchase) {
        pur.addEventListener('click', ()=> {

            let param = "?cart_idx=";
            for(let choice of chooses) {

                if(choice.checked) {
                    console.log(choice.value);
                    param = param+choice.value+"&cart_idx=";

                }
            }
            console.log(param);
            location.href = "/order/payment" +param;
        })
    }


    /* 부분합계, 총계 계산 관련! */
    // 페이지 로딩 시 기본적으로 합계(부분), 총계(전체) 계산하는 부분
    window.onload = (()=>{
        let subTotals = document.querySelectorAll('.subtotal');
        let allTotal = document.querySelector('#total');
        for(let subtotal of subTotals) {
            let price = subtotal.parentElement.parentElement.parentElement.querySelector('.discount_price').value;
            let qty = subtotal.parentElement.parentElement.parentElement.querySelector('.qty').value;
            let total = parseInt(uncomma(price)) * parseInt(qty);
            subtotal.value = comma(total);
        }
        allTotal.value = calculateTotal();
    })
    // 수량 변경 시 계산하는 로직
    let qtyies = document.querySelectorAll('.qty');
    for(let qty of qtyies) {
        qty.addEventListener('change', ()=>{
            let total = document.querySelector('#total');
            total.value = calculateTotal();
        })

    }
    // 선택 사항 변경 시 체크하는 로직
    // let chooses = document.querySelectorAll('.choose');
    for (let choose of chooses) {
        choose.addEventListener('change', ()=> {
            let total = document.querySelector('#total');
            total.value = calculateTotal();
        })
    }
    // 총계 계산하는 로직
    function calculateTotal() {
        let subTotals = document.querySelectorAll('.subtotal');
        let total = 0;
        for(let subTotal of subTotals) {
            let choose = subTotal.parentElement.parentElement.parentElement.querySelector('.choose');
            if (choose.checked) {
                total += parseInt(uncomma(subTotal.value));
            }
        }
        return comma(total);
    }
    // 부분 합계 업데이트 및 db 실시간 업데이트하는 로직
    function calculateSubTotal(element, price,book_code) {
        // 인자로 단가를 넣어주면 수량으로 알아서 계산 하는 로직


        let qty = parseInt(element.value);
        $.ajax({
            url:"/mypage/addcart1.dox",
            dataType:"json",
            type : "POST",
            data : {
                "member_id":"${sessionScope['member_id']}",
                "book_code":book_code,
                "quantity" :qty
            },
            success : function(data) {

            },
            fail : function (data){

           }

        });
        let total = price * qty;
        let target = element.parentElement.parentElement.parentElement.parentElement.querySelector('input.subtotal');
        target.value = comma(total);
    }
    // 콤마 추가하는 로직
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
    // 콤마 삭제하는 로직
    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }
</script>
<script>
    /* 체크박스 전체 선택 및 기본 전체 선택 로직 */
    function chooseAllOrNothing(element) {
        let chooses = document.querySelectorAll('.choose');
        if(element.checked) {
            for(let choice of chooses) {
                choice.checked = true;
            }
            let total = document.querySelector('#total');
            total.value = calculateTotal();
        } else {
            for(let choice of chooses) {
                choice.checked = false;
            }
            let total = document.querySelector('#total');
            total.value = calculateTotal();
        }
    }

    /* 선택삭제 로직 */
    function deleteChoices() {
        let chooses = document.querySelectorAll('.choose');
        let checklist = [];
        for(let choice of chooses) {
            if(choice.checked) {
                checklist.push(choice.value);
            }
        }
        if(checklist.length>0){
            $.ajax({
                url:"/mypage/cartdelete.dox",
                dataType:"json",
                type : "POST",
                data : {
                    "member_id":"${sessionScope['member_id']}",
                    "cart_idx":JSON.stringify(checklist)
                },
                success : function(data) {
                    if(data.result = "success") {
                        alert("성공적으로 삭제되었습니다.");
                        location.href = "/mypage/cart";
                    }
                }
            });
        }else{
            alert("선택하신 항목이 없습니다.");
        }
        let total = document.querySelector('#total');
        total.value = calculateTotal();
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

