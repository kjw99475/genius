<%--
  Created by IntelliJ IDEA.
  User: kjw
  Date: 2024-04-26
  Time: 오후 3:35
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
    <title>Admin / book - regist</title>
    <!-- Favicons -->
    <link href="/resources/admin/img/favicon.png" rel="icon">
    <link href="/resources/admin/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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

    <script src="/resources/jquery/jquery-3.7.1.js"></script>
</head>
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<!--================ 헤더 End =================-->

<!--================ 본문 start =================-->
<main id="main" class="main">

    <div class="pagetitle">
        <h1>상품 등록</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/admin">메인</a></li>
                <li class="breadcrumb-item"><a href="/admin/book/itemlist">상품관리</a></li>
                <li class="breadcrumb-item active">등록</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
        <div class="row">
            <div class="col-xl-12">

                <div class="card">
                    <div class="card-body pt-3">

                        <div class="tab-pane fade show active profile-overview" id="profile-overview">

                            <!-- Profile Edit Form -->
                            <form id="frm_book_regist" method="post" action="/admin/book/itemRegist" enctype="multipart/form-data">
<%--                                <div class="row mb-3">--%>
<%--                                    <label for="book_name" class="col-md-4 col-lg-2 col-form-label">상품 코드</label>--%>
<%--                                    <div class="col-md-8 col-lg-10">--%>
<%--                                        <input name="book_code" type="text" class="form-control" id="book_code"--%>
<%--                                               value="${bookDTO.book_code}">--%>
<%--                                    </div>--%>
<%--                                    <div class="invalid-feedback" id="div_err_book_code" style="display: none"></div>--%>
<%--                                </div>--%>
                                <div class="row mb-3">
                                    <label for="book_name" class="col-md-4 col-lg-2 col-form-label">책 이름</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="book_name" type="text" class="form-control" id="book_name"
                                               value="${bookDTO.book_name}">
                                    </div>
                                    <div class="invalid-feedback" id="div_err_book_name" style="display: none"></div>
                                </div>

                                <div class="row mb-3">
                                    <label for="price" class="col-md-4 col-lg-2 col-form-label">정가</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="price" type="text" class="form-control" id="price"
                                               value="${bookDTO.price}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                    </div>
                                    <div class="invalid-feedback" id="div_err_price" style="display: none"></div>
                                </div>

                                <div class="row mb-3">
                                    <label for="discount_per" class="col-md-4 col-lg-2 col-form-label">할인율</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="discount_per" type="text" class="form-control" id="discount_per" value="${bookDTO.discount_per}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                    </div>
                                    <div class="invalid-feedback" id="div_err_discount_per" style="display: none"></div>
                                </div>

                                <div class="row mb-3">
                                    <label for="author" class="col-md-4 col-lg-2 col-form-label">저자</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="author" type="text" class="form-control" id="author"
                                               value="${bookDTO.author}">
                                    </div>
                                    <div class="invalid-feedback" id="div_err_author" style="display: none"></div>
                                </div>

                                <div class="row mb-3">
                                    <label for="publication_date" class="col-md-4 col-lg-2 col-form-label">출판일</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="publication_date" type="date" class="form-control" id="publication_date"
                                               value="${bookDTO.publication_date}">
                                    </div>
                                    <div class="invalid-feedback" id="div_err_publication_date" style="display: none"></div>
                                </div>

                                <div class="row mb-3">
                                    <label for="publisher" class="col-md-4 col-lg-2 col-form-label">출판사</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="publisher" type="text" class="form-control" id="publisher"
                                               value="${bookDTO.publisher}">
                                    </div>
                                    <div class="invalid-feedback" id="div_err_publisher" style="display: none"></div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-4 col-lg-2 col-form-label">책 이미지</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="file" type="file" class="form-control" id="file"
                                               value="" onchange="changeImg(event)" accept="image/*">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-4 col-lg-2 col-form-label">책 이미지</label>
                                    <div class="col-md-8 col-lg-10">
                                        <div class="row m-1">
                                            <div class="p-1 border-gray bg-light text-dark rounded-top-2" id="previous">
                                                <span class="d-block p-1 text-center">이미지 미리보기</span>
                                            </div>

                                            <div class="p-1 border-gray rounded-bottom-2" style="min-height: 200px">
                                                <img id="preview" class="d-block w-100" src="/resources/img/no_image.png">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="category_class_code" class="col-md-4 col-lg-2 col-form-label">카테고리 - 학년</label>
                                    <div class="col-md-8 col-lg-10">
                                        <select name="category_class_code" class="form-control" id="category_class_code">
                                            <option value="" selected hidden>학년</option>
                                            <option value="c01">초1</option>
                                            <option value="c02">초2</option>
                                            <option value="c03">초3</option>
                                            <option value="c04">초4</option>
                                            <option value="c05">초5</option>
                                            <option value="c06">초6</option>
                                            <option value="c07">중1</option>
                                            <option value="c08">중2</option>
                                            <option value="c09">중3</option>
                                            <option value="c10">고1</option>
                                            <option value="c11">고2</option>
                                            <option value="c12">고3</option>
                                        </select>
                                    </div>
                                    <div class="invalid-feedback" id="div_err_category_class_code" style="display: none"></div>
                                </div>

                                <div class="row mb-3">
                                    <label for="category_subject_code" class="col-md-4 col-lg-2 col-form-label">카테고리 - 과목</label>
                                    <div class="col-md-8 col-lg-10">
                                        <select name="category_subject_code" class="form-control" id="category_subject_code">
                                            <option value="" selected hidden>과목</option>
                                            <option value="s01">국어</option>
                                            <option value="s02">영어</option>
                                            <option value="s03">수학</option>
                                            <option value="s04">사회</option>
                                            <option value="s05">역사</option>
                                            <option value="s06">도덕</option>
                                            <option value="s07">과학</option>
                                            <option value="s08">체육</option>
                                            <option value="s09">예술</option>
                                            <option value="s10">제2외국어</option>
                                            <option value="s11">기술가정</option>
                                            <option value="s12">음악</option>
                                            <option value="s13">정보</option>
                                            <option value="s14">교양</option>
                                            <option value="s15">전문교과</option>
                                            <option value="s16">기타</option>
                                            <option value="s17">선택</option>
                                            <option value="s18">실과</option>
                                            <option value="s19">한문</option>
                                            <option value="s20">미술</option>
                                        </select>
                                    </div>
                                    <div class="invalid-feedback" id="div_err_category_subject_code" style="display: none"></div>
                                </div>

                                <div class="row mb-3" id="contentsBox">
                                    <label class="col-md-4 col-lg-2 col-form-label">목차</label>
                                    <div class="col-lg-10 row">
                                        <div class="col-lg-9"></div>
                                        <div class="col-lg-3">
                                            <button type="button" id="contentsAddBtn" class="btn btn-success me-2">추가</button>
                                        </div>
                                        <input type="hidden" id="contents" name="contents" value="">
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-md-8 col-lg-10 row">
                                        <div class="col-9">
                                            <input type="text" class="form-control contentsList" id=""
                                                   value="">
                                        </div>
                                        <div class="col-3">
                                            <button type="button" class="btn btn-success me-2 contentsDelBtn" onclick="delContents(this)">삭제</button>
                                        </div>
                                    </div>
                                </div>
                                <%--                                        <textarea name="contents" class="form-control" id="contents"--%>
                                <%--                                                  style="height: 100px; resize: none;">${bookDTO.contents}</textarea>--%>

                                <div class="row mb-3">
                                    <label for="book_info" class="col-md-4 col-lg-2 col-form-label">소개글</label>
                                    <div class="col-md-8 col-lg-10">
                                            <textarea name="book_info" class="form-control" id="book_info"
                                                      style="height: 100px; resize: none;"></textarea>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="isbn" class="col-md-4 col-lg-2 col-form-label">ISBN</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input name="isbn" type="text" class="form-control" id="isbn" value=""
                                               maxlength="13">
                                    </div>
                                    <div class="invalid-feedback" id="div_err_isbn" style="display: none"></div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-4 col-lg-2 col-form-label">상품소개영상</label>
                                    <div class="col-md-8 col-lg-10">
                                        <input type="file" class="form-control" id="video" value="video" name="videofile"
                                               maxlength="20" accept="video/*">
                                    </div>
                                </div>

                                <div class="text-center mt-5">
                                    <button type="submit" id="bookRegistBtn" class="btn btn-success me-2">등록</button>
                                    <button type="button" class="btn btn-light" onclick="location.href='/admin/book/itemlist'">취소</button>
                                </div>
                            </form><!-- End Profile Edit Form -->

                        </div>
                    </div>
                </div><!-- End Bordered Tabs -->
            </div>
        </div>
    </section>

</main><!-- End #main -->
<!--================ 본문 END =================-->
<script src="/resources/js/commonUtil.js"></script>
<script>

    let contentsAddBtn = document.getElementById("contentsAddBtn");
    let contentsBox = document.getElementById("contentsBox");
    let contentsDelBtn = document.getElementsByClassName("contentsDelBtn");
    let id=1;
    let bookRegistBtn = document.getElementById("bookRegistBtn");
    function delContents(element){
        let div = element.parentNode.parentNode.parentNode;
        if(div.childElementCount ==4){
            alert("개수가 하나일 때는 삭제할 수 없습니다.");
            return false;
        }

        div.removeChild(element.parentNode.parentNode.previousElementSibling);
        div.removeChild(element.parentNode.parentNode);
    }
    bookRegistBtn.addEventListener("click", function(e){
        console.log(1);
        e.preventDefault();
        // let book_name = document.getElementById("book_name");
        // if(book_name.value==""){
        //     document.getElementById("div_err_book_name").style.display= "block";
        //     console.log(2)
        //     return;
        // }
        // else{
        //     document.getElementById("div_err_book_name").style.display="none";
        // }
        // let price = document.getElementById("price");
        // if(price.value == 0 || ""){
        //     document.getElementById("div_err_price").style.display="block";
        //     return;
        // }
        // else{
        //     document.getElementById("div_err_price").style.display="none";
        // }
        // let category_class_code = document.getElementById("category_class_code");
        // if(category_class_code.value==""){
        //     document.getElementById("div_err_category_class_code").style.display="block";
        //     return;
        // }
        // else{
        //     document.getElementById("div_err_category_class_code").style.display="none";
        // }
        // let category_subject_code = document.getElementById("category_subject_code");
        // if(category_subject_code.value==""){
        //     document.getElementById("div_err_category_subject_code").style.display="block";
        //     return;
        // }
        // else{
        //     document.getElementById("div_err_category_subject_code").style.display="none";
        // }
        //
        // let isbn = document.getElementById("isbn");
        // if(isbn.value==""){
        //     document.getElementById("div_err_isbn").style.display="block";
        //     return;
        // }
        // else{
        //     document.getElementById("div_err_isbn").style.display="none";
        // }
        let publish_date = document.getElementById("publication_date");
        if(dateCheck(publish_date)){
            alert("날짜를 확인해주세요");
            return;
        }
        let contentsStr = "";
        let contentsList = document.getElementsByClassName("contentsList");
        for(i=0;i<contentsList.length;i++){
            if (contentsList[i].value==""){
                alert("목차를 입력해주세요");
                return;
            }
            contentsStr += contentsList[i].value + "|";
        }
        document.getElementById("contents").value = contentsStr.substring(0,contentsStr.length -1);

        console.log(contentsStr);
        console.log(document.getElementById("contents").value);
        document.getElementById("frm_book_regist").submit();


    });
    contentsAddBtn.addEventListener("click", function(e){
        e.preventDefault();
        let div = document.createElement("div");
        div.classList.add("col-md-8");
        div.classList.add("col-lg-10");
        div.classList.add("contents-box");
        div.classList.add("row");
        let innerText = "";
        innerText += '<div class="col-9">'
        innerText += '<input type="text" class="form-control contentsList" id=`${id}` value="">';
        innerText += '</div>';
        innerText += '<div class="col-3">';
        innerText += '<button type="button" id="contentsDelBtn" class="btn btn-success me-2 contentsDelBtn" onclick="delContents(this);">삭제</button>';
        innerText += '</div>';
        div.innerHTML = innerText;

        let div2 = document.createElement("div");
        div2.classList.add("col-lg-2");
        div2.classList.add("col-9");

        contentsBox.append(div2);
        contentsBox.append(div);


        innerText += ""
    });
</script>
<!-- 사이드바 -->
<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp">
    <jsp:param name="menuGubun" value="book"/>
</jsp:include>
<!-- 사이드바 끝 -->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
<!--================ 푸터 End =================-->

<!-- Vendor JS Files -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
    function changeImg(e) {
        let files = e.target.files;
        let reader = new FileReader();
        reader.onload = (e)=>{
            $('#preview').attr('src', e.target.result);
        }
        reader.readAsDataURL(files[0]);
    }

    const serverValiseResult = {};
    <c:forEach items="${errors}" var="err">
    if(document.getElementById("div_err_${err.getField()}") != null) {
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color: red'>${err.defaultMessage}</span>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    serverValiseResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>

    console.log(serverValiseResult);
</script>
</body>
</html>
