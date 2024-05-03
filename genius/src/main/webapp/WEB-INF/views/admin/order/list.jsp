<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-04-25
  Time: 오후 5:27
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
    <title>Admin / order</title>
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

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main id="main" class="main">

    <div class="pagetitle">
        <h1>주문 관리</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item active">주문 관리</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <!-- Recent Sales -->
    <div class="col-12">
        <div class="card recent-sales overflow-auto">

            <div class="card-body">

                <form action="/admin/order/list" name="searchfrm" id="searchfrm">
                    <div class="row me-2 ms-1 mb-4 mt-4 rounded-3 bg-light pt-1 pb-2">
                        <div class="col">
                            <div class="row mb-2">
                                <label class="fw-bold p-3">검색 기간</label>
                                <div class="row justify-content-start align-items-center">
                                    <div class="col-3">
                                        <input class="form-control" type="date" name="search_data1" id="banner_start" value="${pageDTO['search_data1']}">
                                    </div>
                                    ~
                                    <div class="col-3">
                                        <input class="form-control" type="date" name="search_data2" id="banner_end" value="${pageDTO['search_data2']}">
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <label class="fw-bold p-3" style="margin-right: 45px">주문상태</label>
                                        <label class="fw-bold p-3">키워드 검색</label>
                                    </div>
                                    <div class="d-flex align-items-center" style="gap: 10px">

                                        <select name="type" class="form-select w-200px" id="category_class_code">
                                            <%--                                                <option value="" selected hidden>주문상태</option>--%>
                                            <option value="" <c:if test="${pageDTO['type'] == ''}">selected</c:if>>전체</option>
                                            <option value="1" <c:if test="${pageDTO['type'] == '1'}">selected</c:if>>배송 전</option>
                                            <option value="2" <c:if test="${pageDTO['type'] == '2'}">selected</c:if>>배송 중</option>
                                            <option value="3" <c:if test="${pageDTO['type'] == '3'}">selected</c:if>>배송 완료</option>
                                        </select>


                                        <select name="type2" class="form-select w-200px" id="search_category">
                                            <%--                                                <option value="" selected hidden>검색 옵션</option>--%>
                                            <option value="" <c:if test="${pageDTO['type2'] == ''}">selected</c:if>>전체</option>
                                            <option value="1" <c:if test="${pageDTO['type2'] == '1'}">selected</c:if>>주문번호</option>
                                            <option value="2" <c:if test="${pageDTO['type2'] == '2'}">selected</c:if>>주문자 ID</option>
                                            <option value="3" <c:if test="${pageDTO['type2'] == '3'}">selected</c:if>>배송회사</option>
                                        </select>

                                        <input type="text" class="form-control" placeholder="검색어" name="search_word" id="search_word" value="${pageDTO['search_word']}">

                                        <div class="w-200px">
                                            <button type="button" class="bi bi-search btn btn-success" onclick="search()"> 검색</button>
                                        </div>
                                        <div class="w-200px">
                                            <button type="button" class="btn btn-success" onclick="cartChoices()">배송 시작</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="d-flex justify-content-between">
                    <div class="col-2 mb-2">
                        <select name="page_size" id="page-size" class="form-select" onchange="page_size(this)">
                            <option value="10" <c:if test="${pageDTO['page_size'] == '10'}">selected</c:if>>10개씩 보기</option>
                            <option value="50" <c:if test="${pageDTO['page_size'] == '50'}">selected</c:if>>50개씩 보기</option>
                            <option value="100" <c:if test="${pageDTO['page_size'] == '100'}">selected</c:if>>100개씩 보기</option>
                        </select>
                    </div>
                </div>



                <!-- Table with stripped rows -->
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col" class="bg-geni-dark text-white">#</th>
                        <th scope="col" class="bg-geni-dark text-white">주문번호</th>
                        <th scope="col" class="bg-geni-dark text-white">주문자 id</th>
                        <th scope="col" class="bg-geni-dark text-white">주문일시</th>
                        <th scope="col" class="bg-geni-dark text-white">총 결제 금액</th>
                        <th scope="col" class="bg-geni-dark text-white">총 수량</th>
                        <th scope="col" class="bg-geni-dark text-white">배송회사</th>
                        <th scope="col" class="bg-geni-dark text-white">배송시작일</th>
                        <th scope="col" class="bg-geni-dark text-white">배송종료일</th>
                        <th scope="col" class="bg-geni-dark text-white">주문상태</th>
                        <th scope="col" class="bg-geni-dark text-white">환불승인</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${orderDTOlist ne null}">
                        <c:forEach items="${orderDTOlist}" var="orderDTO">
                            <tr>
                                <td><input class="form-check-input lg-checkbox choose" type="checkbox" value="${orderDTO.order_num}" id="ch1" <c:if test="${(orderDTO.delivery_company != '' and orderDTO.delivery_company != null) or orderDTO.order_state =='주문 취소'}">disabled</c:if>></td>
                                <th scope="row"><a href='/admin/order/view?order_num=${orderDTO.order_num}'>${orderDTO.order_num}</a></th>
                                <td>${orderDTO.member_id}</td>
                                <td>${orderDTO.order_date}</td>
                                <td>${orderDTO.total_price}</td>
                                <td>${orderDTO.amount}</td>
                                <td>
                                    <select class="deliverySelect form-select" <c:if test="${(orderDTO.delivery_company != '' and orderDTO.delivery_company != null) or orderDTO.order_state =='주문 취소'}">disabled</c:if>>
                                        <option value="" <c:if test="${orderDTO.delivery_company == '' or orderDTO.delivery_company == null}">selected</c:if>>선택</option>
                                        <option value="우체국" <c:if test="${orderDTO.delivery_company == '우체국'}">selected</c:if>>우체국</option>
                                        <option value="CJ대한통운" <c:if test="${orderDTO.delivery_company == 'CJ대한통운'}">selected</c:if>>CJ대한통운</option>
                                        <option value="로젠택배" <c:if test="${orderDTO.delivery_company == '로젠택배'}">selected</c:if>>로젠택배</option>
                                        <option value="한진택배" <c:if test="${orderDTO.delivery_company == '한진택배'}">selected</c:if>>한진택배</option>
                                        <option value="롯데택배" <c:if test="${orderDTO.delivery_company == '롯데택배'}">selected</c:if>>롯데택배</option>
                                        <option value="드림택배" <c:if test="${orderDTO.delivery_company == '드림택배'}">selected</c:if>>드림택배</option>
                                        <option value="대신택배" <c:if test="${orderDTO.delivery_company == '대신택배'}">selected</c:if>>대신택배</option>
                                        <option value="일양로지스택배" <c:if test="${orderDTO.delivery_company == '일양로지스택배'}">selected</c:if>>일양로지스택배</option>
                                    </select>
                                <td>${orderDTO.delivery_start_date}</td>
                                <td>${orderDTO.delivery_end_date}</td>
                                <td class="delivery_state">
                                    <span <c:if test="${orderDTO.order_state eq '주문 취소'}">class="badge bg-danger"</c:if>
                                          <c:if test="${orderDTO.order_state eq '배송 전'}">class="badge bg-warning"</c:if>
                                          <c:if test="${orderDTO.order_state eq '배송 중'}">class="badge bg-primary"</c:if>
                                          <c:if test="${orderDTO.order_state eq '환불 요청'}">class="badge bg-danger-subtle"</c:if>
                                          <c:if test="${orderDTO.order_state eq '배송 완료'}">class="badge bg-success"</c:if>
                                          <c:if test="${orderDTO.order_state eq '환불 완료'}">class="badge bg-secondary"</c:if>
                                          <c:if test="${orderDTO.order_state eq '환불 불가'}">class="badge bg-black"</c:if>
                                    >
                                            ${orderDTO.order_state}
                                    </span>
                                </td>
                                <c:if test="${orderDTO.order_refund_response eq 'N'}">
                                    <td class="delivery_state"><span class="badge bg-warning">N</span></td>
                                </c:if>
                                <c:if test="${orderDTO.order_refund_response eq 'Y'}">
                                    <td class="delivery_state"><span class="badge bg-success">Y</span></td>
                                </c:if>
                                <c:if test="${orderDTO.order_refund_response eq null}">
                                    <td class="delivery_state"></td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
                <!-- END Table with stripped rows -->

                <div class="d-flex justify-content-center">
                    <!-- Pagination with icons -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:if test="${pageDTO.page<=10}">
                            <li class="page-item disabled">
                                </c:if>
                                <c:if test="${pageDTO.page>10}">
                            <li class="page-item">
                                </c:if>
                                <a class="page-link" href="/admin/order/list${pageDTO.linked_params}&page=${pageDTO.page_block_end-10}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="${pageDTO.page_block_start}" end="${pageDTO.page_block_end}" var="i">
                                <li class="page-item">
                                    <c:if test="${pageDTO.page == i}">
                                        <a class="page-link active" href="/admin/order/list${pageDTO.linked_params}&page=${i}">${i}</a>
                                    </c:if>
                                    <c:if test="${pageDTO.page != i}">
                                        <a class="page-link" href="/admin/order/list${pageDTO.linked_params}&page=${i}">${i}</a>
                                    </c:if>
                                </li>
                            </c:forEach>
                            <%--                            <li class="page-item"><a class="page-link" href="/admin/order/list?page=2">2</a></li>--%>
                            <%--                            <li class="page-item"><a class="page-link" href="/admin/order/list?page=3">3</a></li>--%>
                            <c:if test="${(pageDTO.page_block_start+10)>=(pageDTO.total_page)}">
                            <li class="page-item disabled">
                                </c:if>
                                <c:if test="${(pageDTO.page_block_start+10)<(pageDTO.total_page)}">
                            <li class="page-item">
                                </c:if>
                                <a class="page-link" href="/admin/order/list${pageDTO.linked_params}&page=${pageDTO.page_block_start+10}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav><!-- End Pagination with icons -->
                </div>

            </div>

        </div>
    </div><!-- End Recent Sales -->
</main>
<!--================ 본문 END =================-->

<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp">
    <jsp:param name="menuGubun" value="order"/>
</jsp:include>
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
    function search(){
        document.querySelector("#searchfrm").submit();
    }

    function page_size(item){
        location.href = "/admin/order/list?" +
            "search_date1=${pageDTO.search_date1}"+
            "&search_date2=${pageDTO.search_date2}"+
            "&type=${pageDTO.type}"+
            "&type2=${pageDTO.type2}&search_word=${pageDTO.search_word}&page_size="+item.value;
    }


    function cartChoices() {


        var delivery_list =[];
        var check_list = [];


        let checknull = true;


        let delivery = document.querySelectorAll('.deliverySelect');
        let checkbox = document.querySelectorAll('.choose');

        for(let i = 0; i<checkbox.length; i++){
            if(checkbox[i].checked){
                delivery_list.push(checkbox[i].value);
                check_list.push(delivery[i].value);

            }
        }

        // for(let choice of delivery){
        //     list1.push(choice.value);
        // }

        for(let i =0; i<delivery_list.length; i++){
            if(check_list[i] == null || check_list[i]==""){
                checknull = false;
            }

        }

        if(checknull){
            // for(let i = 0; i<chooses.length; i++){
            $.ajax({
                url:"/admin/order/deliveryupdate.dox",
                dataType:"json",
                type : "GET",
                data : {
                    "ordernumList":JSON.stringify(delivery_list),
                    "delivery":JSON.stringify(check_list)
                },
                success : function(data) {
                    if(data.result =="success"){
                        alert("선택하신 주문처리가 완료되었습니다.");
                        console.log("성공");
                        location.href="/admin/order/list${pageDTO.linked_params}&page=${pageDTO.page}"
                    }else{
                        alert("주문처리에 실패하였습니다.");
                        console.log("성공");
                        location.href="/admin/order/list${pageDTO.linked_params}&page=${pageDTO.page}"
                    }
                },
                fail : function (data){
                    console.log("실패");
                }

            });
        }else if(!checknull){
            alert("택배사를 정해주세요");
        }
    }



    <%--for(let i = 0; i<list1.length; i++) {--%>
    <%--        $.ajax({--%>
    <%--            url:"/admin/order/deliveryupdate.dox",--%>
    <%--            dataType:"json",--%>
    <%--            type : "GET",--%>
    <%--            data : {--%>
    <%--                "ordernumList":JSON.stringify(list[i]),--%>
    <%--                "delivery":JSON.stringify(list1[i])--%>
    <%--            },--%>
    <%--            success : function(data) {--%>

    <%--            },--%>
    <%--            fail : function (data){--%>

    <%--            }--%>

    <%--        });--%>


    <%--    }--%>

</script>
</body>
</html>
