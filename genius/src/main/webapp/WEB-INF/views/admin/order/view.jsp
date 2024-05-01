<%--
  Created by IntelliJ IDEA.
  User: kjw
  Date: 2024-04-26
  Time: 오후 3:56
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
    <title>Title</title>
    <!-- Favicons -->
    <link href="/resources/admin/img/favicon.png" rel="icon">
    <link href="/resources/admin/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="/resources/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/admin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="/resources/admin/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="/resources/admin/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="/resources/admin/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="/resources/admin/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="/resources/admin/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="/resources/admin/css/style.css" rel="stylesheet">
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main id="main" class="main">

    <div class="pagetitle">
        <h1>주문관리 상세</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item">주문관리</li>
                <li class="breadcrumb-item active">상세</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->


    <section class="section">
        <div class="row">
            <div class="d-flex justify-content-end">
                <button class="btn btn-success m-3" onclick="orderstart()" <c:if test="${orderDTO.get(0).order_state ne '배송 전'}">disabled</c:if>>배송 시작</button>
<%--                <button class="btn btn-success m-3" <c:if test="${orderDTO.get(0).order_state eq '배송 전'}">disabled</c:if>>주문 취소</button>--%>
                <button class="btn btn-success m-3" <c:if test="${orderDTO.get(0).order_state eq '배송 전' or orderDTO.get(0).order_refund_request ne 'Y' or orderDTO.get(0).order_refund_response ne null}">disabled</c:if> onclick="response('${orderDTO.get(0).order_num}','Y')">환불 승인</button>
                <button class="btn btn-success m-3" <c:if test="${orderDTO.get(0).order_state eq '배송 전' or orderDTO.get(0).order_refund_request ne 'Y' or orderDTO.get(0).order_refund_response ne null}">disabled</c:if> onclick="response('${orderDTO.get(0).order_num}','N')">환불 거절</button>
            </div>
            <div class="col-lg-4">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">주문 정보</h5>

                        <div class="row">
                            <div class="col-lg-4 col-md-4">주문 번호</div>
                            <div class="col-lg-8 col-md-8">${orderDTO.get(0).order_num}</div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 label">주문 상태</div>
                            <div class="col-lg-8 col-md-8">${orderDTO.get(0).order_state}</div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 label">주문일시</div>
                            <div class="col-lg-8 col-md-8">${orderDTO.get(0).order_date}</div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 label">주문자 ID</div>
                            <div class="col-lg-8 col-md-8">${orderDTO.get(0).member_id}</div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 label">주문자 이름</div>
                            <div class="col-lg-8 col-md-8">${orderDTO.get(0).member_name}</div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 label">주문자 전화번호</div>
                            <div class="col-lg-8 col-md-8">${orderDTO.get(0).phone}</div>
                        </div>

                    </div>
                </div>

            </div>


            <div class="col-lg-4">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">배송지 정보</h5>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 label ">수신인</div>
                            <div class="col-lg-8 col-md-8">${orderDTO.get(0).order_name}</div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 label ">우편번호</div>
                            <div class="col-lg-8 col-md-8">${orderDTO.get(0).order_zipcode}</div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 label ">주소 1</div>
                            <div class="col-lg-8 col-md-8">${orderDTO.get(0).order_addr1}</div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 label ">주소 2</div>
                            <div class="col-lg-8 col-md-8">${orderDTO.get(0).order_addr2}</div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 label ">수신인 전화번호</div>
                            <div class="col-lg-8 col-md-8">${orderDTO.get(0).order_phone}</div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-lg-4">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">배송정보</h5>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 label ">배송회사</div>
                            <div class="col-lg-8 col-md-8">
                                <select class="deliverySelect" <c:if test="${orderDTO.get(0).delivery_company != '' and orderDTO.get(0).delivery_company != null}">disabled</c:if>>
                                    <option value="" <c:if test="${orderDTO.get(0).delivery_company == '' or orderDTO.get(0).delivery_company == null}">selected</c:if>>선택</option>
                                    <option value="우체국" <c:if test="${orderDTO.get(0).delivery_company == '우체국'}">selected</c:if>>우체국</option>
                                    <option value="CJ대한통운" <c:if test="${orderDTO.get(0).delivery_company == 'CJ대한통운'}">selected</c:if>>CJ대한통운</option>
                                    <option value="로젠택배" <c:if test="${orderDTO.get(0).delivery_company == '로젠택배'}">selected</c:if>>로젠택배</option>
                                    <option value="한진택배" <c:if test="${orderDTO.get(0).delivery_company == '한진택배'}">selected</c:if>>한진택배</option>
                                    <option value="롯데택배" <c:if test="${orderDTO.get(0).delivery_company == '롯데택배'}">selected</c:if>>롯데택배</option>
                                    <option value="드림택배" <c:if test="${orderDTO.get(0).delivery_company == '드림택배'}">selected</c:if>>드림택배</option>
                                    <option value="대신택배" <c:if test="${orderDTO.get(0).delivery_company == '대신택배'}">selected</c:if>>대신택배</option>
                                    <option value="일양로지스택배" <c:if test="${orderDTO.get(0).delivery_company == '일양로지스택배'}">selected</c:if>>일양로지스택배</option>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 label ">배송시작일</div>
                            <div class="col-lg-8 col-md-8">${orderDTO.get(0).delivery_start_date}</div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 label ">배송종료일</div>
                            <div class="col-lg-8 col-md-8"><input type="date" value="${orderDTO.get(0).delivery_end_date}"></div>
                        </div>

                    </div>
                </div>

            </div>


            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">주문 상세정보</h5>

                        <table class="table">
                            <colgroup>
                                <col width="15%">
                                <col width="30%">
                                <col width="10%">
                                <col width="15%">
                                <col width="10%">
<%--                                <col width="10%">--%>
<%--                                <col width="10%">--%>
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">상품 번호</th>
                                <th scope="col">상품명</th>
                                <th scope="col">수량</th>
                                <th scope="col">적용가</th>
                                <th scope="col">개별 총계</th>
<%--                                <th scope="col">총수량</th>--%>
<%--                                <th scope="col">총 합계</th>--%>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="total_amount" value="0"/>
                                <c:forEach items="${orderDTO}" var="list">
                                <tr>
                                    <td>${list.book_code}</td>
                                    <td>${list.book_name}</td>
                                    <td>${list.amount}</td>
                                    <td>${list.price}</td>
                                    <td>${list.amount * list.price}</td>
<%--                                    <td>${list.total_price}</td>--%>
<%--                                    <td>${list.total_price}</td>--%>
                                    <c:set var="total_amount" value="${total_amount+list.amount}"/>
                                </tr>
                            </c:forEach>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><strong>총 수량 :</strong>${total_amount}</td>
                                    <td></td>
                                    <td><strong>총 합계 :</strong>${orderDTO.get(0).total_price}</td>
                                </tr>
<%--                            <tr>--%>
<%--                                <td>D654987654</td>--%>
<%--                                <td>천재교과서321</td>--%>
<%--                                <td>20</td>--%>
<%--                                <td>33000</td>--%>
<%--                                <td>660000</td>--%>
<%--                                <td>55</td>--%>
<%--                                <td>1000000</td>--%>
<%--                            </tr>--%>

<%--                            <tr>--%>
<%--                                <td>C65445364554</td>--%>
<%--                                <td>범재교과서321</td>--%>
<%--                                <td>30</td>--%>
<%--                                <td>22000</td>--%>
<%--                                <td>660000</td>--%>
<%--                                <td>70</td>--%>
<%--                                <td>2000000</td>--%>
<%--                            </tr>--%>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

        </div>
    </section>


</main><!-- End #main -->

<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>
<!--================ 푸터 End =================-->

<!-- Vendor JS Files -->
<script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
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
<script>


    function orderstart(){
        let delivery = document.querySelector('.deliverySelect').value;
        console.log(delivery);
        $.ajax({
            url:"/admin/order/deliveryupdate.dox",
            dataType:"json",
            type : "GET",
            data : {
                "ordernumList":"${orderDTO.get(0).order_num}",
                "delivery":JSON.stringify(delivery)
            },
            success : function(data) {
                alert("수정 성공");
                console.log("성공");
                location.href="/admin/order/view?order_num=${orderDTO.get(0).order_num}"
            },
            fail : function (data){
                console.log("실패");
            }

        });
    }

    function response(item,item1){
        if(confirm("정말 환불하시겠습니까?")){
            $.ajax({
                url:"/admin/order/refundResponse.dox",
                dataType:"json",
                type : "POST",
                data : {
                    "order_num":item,
                    "order_refund_response" : item1
                },
                success : function(data) {
                    if(data.result == "success"){
                        console.log("성공");
                        location.href="/admin/order/view?order_num=${orderDTO.get(0).order_num}";
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
</html>
