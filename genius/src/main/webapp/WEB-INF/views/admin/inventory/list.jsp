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
    <title>Admin / inventory </title>
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
        <h1>재고 관리</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item active">재고 관리</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <!-- 재고 리스트 -->
    <div class="col-12">
        <div class="card recent-sales overflow-auto">
            <div class="card-body">

                <form action="/admin/inventory/list">
                    <div class="row me-2 ms-1 mb-4 mt-4 rounded-3 bg-light pt-1 pb-2">
                        <div class="col">
                            <div class="row mb-2">
                                <label class="fw-bold p-3">검색 기간</label>
                                <div class="row justify-content-start align-items-center">
                                    <div class="col-3">
                                        <input class="form-control" type="date" name="search_data1" id="banner_start" value="${responseDTO['search_data1']}">
                                    </div>
                                    ~
                                    <div class="col-3">
                                        <input class="form-control" type="date" name="search_data2" id="banner_end" value="${responseDTO['search_data2']}">
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <label class="fw-bold p-3" style="margin-right: 70px">학년</label>
                                        <label class="fw-bold p-3" style="margin-right: 70px">과목</label>
                                        <label class="fw-bold p-3">키워드 검색</label>
                                    </div>
                                    <div class="d-flex align-items-center" style="gap: 10px">

                                        <select name="class_code" class="form-select w-200px" id="category_class_code">
                                            <option value="">전체</option>
                                            <c:forEach items="${classList}" var="list">
                                                <option value="${list.category_code}"
                                                        <c:if test="${list.category_code eq responseDTO.class_code}">
                                                            selected
                                                        </c:if>
                                                >${list.name}</option>
                                            </c:forEach>
                                        </select>

                                        <select name="subject_code" class="form-select w-200px" id="category_subject_code">
                                            <option value="">전체</option>
                                            <c:forEach items="${subjectList}" var="list">
                                                <option value="${list.category_code}"
                                                        <c:if test="${list.category_code eq responseDTO.subject_code}">
                                                            selected
                                                        </c:if>
                                                >${list.name}</option>
                                            </c:forEach>
                                        </select>

                                        <select name="type" class="form-select w-200px" id="search_category">
                                            <option value="0" <c:if test="${responseDTO.type == '0'}"> selected</c:if>>전체</option>
                                            <option value="1" <c:if test="${responseDTO.type == '1'}"> selected</c:if>>책이름</option>
                                            <option value="2" <c:if test="${responseDTO.type == '2'}"> selected</c:if>>작성자</option>
                                            <option value="3" <c:if test="${responseDTO.type == '3'}"> selected</c:if>>출판사</option>
                                            <option value="4" <c:if test="${responseDTO.type == '4'}"> selected</c:if>>상품번호</option>
                                        </select>


                                        <input type="text" class="form-control" placeholder="검색어" name="search_word" id="search_word" value="${responseDTO['search_word']}">
                                        <div class="w-200px">
                                            <button type="submit" class="bi bi-search btn btn-success"> 검색</button>
                                        </div>
                                        <div class="w-200px">
                                            <button type="button" class="btn btn-success" onclick="BookInventroyModify()">적용</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="d-flex justify-content-between">
                    <div class="col-2 mb-2">
                        <select name="page_size" class="form-select" onchange="modifyPageSize(this)">
                            <option value="10" <c:if test="${responseDTO['page_size'] == '10'}">selected</c:if>>10개씩 보기</option>
                            <option value="50" <c:if test="${responseDTO['page_size'] == '50'}">selected</c:if>>50개씩 보기</option>
                            <option value="100" <c:if test="${responseDTO['page_size'] == '100'}">selected</c:if>>100개씩 보기</option>
                        </select>
                    </div>
                </div>

                <!-- Table with stripped rows -->
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">상품번호</th>
                        <th scope="col">책이름</th>
                        <th scope="col">정가</th>
                        <th scope="col">할인율</th>
                        <th scope="col">할인가</th>
                        <th scope="col">저자</th>
                        <th scope="col">출판사</th>
                        <th scope="col">학년</th>
                        <th scope="col">과목</th>
                        <th scope="col">판매상태</th>
                        <th scope="col">판매시작일</th>
                        <th scope="col">판매종료일</th>
                        <th scope="col">재고수량</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${responseDTO.dtoList}" var="bookDTO">
                        <tr>
                            <td><input class="form-check-input lg-checkbox choose" type="checkbox" value="${bookDTO.book_code}" id="ch1"></td>
                            <th scope="row">${bookDTO.book_code}</th>
                            <td>${bookDTO.book_name}</td>
                            <td>${bookDTO.price}</td>
                            <td>${bookDTO.discount_per}</td>
                            <td>${bookDTO.discount_price}</td>
                            <td>${bookDTO.author}</td>
                            <td>${bookDTO.publisher}</td>
                            <td>${bookDTO.category_class_code}</td>
                            <td>${bookDTO.category_subject_code}</td>
                            <td>
                                <select name="type" class="form-select sales_status">
                                    <option value="1" <c:if test="${bookDTO.sales_status == '1'}"> selected</c:if>>판매중</option>
                                    <option value="2" <c:if test="${bookDTO.sales_status == '2'}"> selected</c:if>>판매준비중</option>
                                    <option value="3" <c:if test="${bookDTO.sales_status == '3'}"> selected</c:if>>판매종료</option>
                                    <option value="4" <c:if test="${bookDTO.sales_status == '4'}"> selected</c:if>>품절</option>
                                </select>
                            </td>
                                <%--                                <td><span class="badge bg-warning">${bookDTO.sales_status}</span></td>--%>
                            <!--상태에 따라 bg-수정 -->
                            <td><input type="date" name="sales_start_date" class="form-control sales_start" value="${bookDTO.sales_start_date}"/></td>
                            <td><input type="date" name="sales_end_date" class="form-control sales_end" value="${bookDTO.sales_end_date}"/></td>
                            <td><input type="number" name="quantity" class="form-control sales_quantity" value="${bookDTO.quantity}" class="input-text qty" maxlength="10" min="0"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- END Table with stripped rows -->

                <div class="d-flex justify-content-center">
                    <!-- Pagination with icons -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item <c:if test="${responseDTO.page_block_start - responseDTO.page_block_size < '1'}"> disabled</c:if>" >
                                <a href="<c:if test="${responseDTO.page_block_start - responseDTO.page_block_size >= '1'}">${responseDTO.linked_params}&page=${responseDTO.page_block_start - responseDTO.page_block_size}</c:if>"
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
                                            <a href="${responseDTO.linked_params}&page=${page_num}" class="page-link">${page_num}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <li class="page-item <c:if test="${responseDTO.page_block_start + responseDTO.page_block_size > responseDTO.total_page}"> disabled</c:if>">
                                <a href="<c:if test="${responseDTO.page_block_start + responseDTO.page_block_size < responseDTO.total_page}">${responseDTO.linked_params}&page=${responseDTO.page_block_start + responseDTO.page_block_size}</c:if>
                        " class="page-link" aria-label="Next">&raquo;</a>
                            </li>
                        </ul>
                    </nav><!-- End Pagination with icons -->
                </div>
            </div>

        </div>
    </div><!-- End 재고 리스트 -->
</main>
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

    // 페이지 개수 보기
    function modifyPageSize(element) {
        let pageSize = element.value;
        let queryString = '?page_size='+pageSize+"&search_data1=${responseDTO['search_data1']}&search_data2=${responseDTO['search_data2']}&class_code=${responseDTO['class_code']}&subject_code=${responseDTO['subject_code']}&type=${responseDTO['type']}&search_word=${responseDTO['search_word']}";
        location.href = '/admin/inventory/list'+queryString;
    }

    function BookInventroyModify() {


        var sales_status_list =[];
        var book_code_list = [];
        var sales_start_list = [];
        var sales_end_list = [];
        var sales_quantity_list = [];

        let checknull = true;


        let sales_status = document.querySelectorAll('.sales_status');
        let book_code = document.querySelectorAll('.choose');
        let sales_start = document.querySelectorAll('.sales_start');
        let sales_end = document.querySelectorAll('.sales_end');
        let sales_quantity = document.querySelectorAll('.sales_quantity');


        for(let i = 0; i<book_code.length; i++){
            if(book_code[i].checked){
                sales_status_list.push(sales_status[i].value);
                book_code_list.push(book_code[i].value);
                sales_start_list.push(sales_start[i].value);
                sales_end_list.push(sales_end[i].value);
                sales_quantity_list.push(sales_quantity[i].value);

            }
        }

        // for(let choice of delivery){
        //     list1.push(choice.value);
        // }

        for(let i =0; i<book_code_list.length; i++){
            console.log(sales_start_list[i]);
            console.log(sales_end_list[i]);
            if(sales_start_list[i] == null || sales_start_list[i]=="" || sales_end_list[i] == null || sales_end_list[i] == ""){
                checknull = false;
            }

        }

        if(checknull){
            // for(let i = 0; i<chooses.length; i++){
            $.ajax({
                url:"/admin/inventory/inventoryupdate.dox",
                dataType:"json",
                type : "GET",
                data : {
                    "BookCodeList":JSON.stringify(book_code_list),
                    "SalesStatusList":JSON.stringify(sales_status_list),
                    "SalesStartDateList":JSON.stringify(sales_start_list),
                    "SalesEndDateList":JSON.stringify(sales_end_list),
                    "SalesQuantityList":JSON.stringify(sales_quantity_list),
                },
                success : function(data) {
                    alert("수정에 성공하였습니다.");
                    console.log("성공");
                    location.href="/admin/inventory/list${responseDTO.linked_params}&page=${responseDTO.page}"
                },
                fail : function (data){
                    console.log("실패");
                }

            });
        }else if(!checknull){
            alert("날짜를 정해주세요");
        }
    }
</script>
</body>
</html>
