<%--
  Created by IntelliJ IDEA.
  User: wkdwl
  Date: 2024-04-25
  Time: 오후 3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<nav class="sidenav rounded shadow">
    <h4 class="bg-geni p-1 text-white text-center">menu</h4>
    <ul class="text-center ">
        <li><a class="text-dark pt-1 pb-1" href="" data-url="/mypage/point" onclick="loginCheck(this)">포인트 충전</a></li>
        <li><a class="text-dark pt-1 pb-1" href="" data-url="/mypage/cart" onclick="loginCheck(this)">장바구니</a></li>
        <li><a class="text-dark pt-1 pb-1" href="" data-url="/mypage/payhistory" onclick="loginCheck(this)">결제내역</a></li>
        <li><a class="text-dark pt-1 pb-1" href="/bbs/noticeList">공지사항</a></li>
        <li><a class="text-dark pt-1 pb-1" href="/bbs/qnaList">QnA</a></li>
        <li><a class="text-dark pt-1 pb-1" href="" data-url="/mypage/myquestions" onclick="loginCheck(this)">나의 문의내역</a></li>
        <li class="bg-lightgray"><a class="text-dark pt-1 pb-1" href="#" onclick="scrollToTop()">top ▲</a></li>
        <li class="bg-lightgray"><a class="text-dark pt-1 pb-1" href="#" onclick="scrollToBottom()">bottom ▼</a></li>
    </ul>
</nav>
<%--<div class="alert alert-warning alert-dismissible fade position-fixed z-100" role="alert" style="top: 150px; right: 0">--%>
<%--    <strong>로그인 필요!</strong> 로그인 해주세요--%>
<%--    <button type="button" class="close" data-dismiss="alert" aria-label="Close">--%>
<%--        <span aria-hidden="true">&times;</span>--%>
<%--    </button>--%>
<%--</div>--%>
<script>
    function loginCheck(element) {
        event.stopPropagation();
        event.preventDefault()
        if(${empty sessionScope['member_id']}) {
            let div = document.createElement('div');
            let alerts = document.querySelectorAll('.alert');
            if (alerts.length > 4) {
                for (let alert of alerts) {
                    alert.parentElement.removeChild(alert);
                }
            }
            alerts = document.querySelectorAll('.alert');
            let top = (alerts.length == 0) ? 150 : (alerts.length * 50) + 150;
            div.className = 'alert alert-warning alert-dismissible fade position-fixed z-100 show';
            div.role = 'alert';
            div.style.top = top + 'px'
            div.style.right = '0';
            div.innerHTML = '<strong>로그인 필요!</strong> 로그인 해주세요<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span> </button>';
            document.body.append(div);
            return false;
        }
        location.href = element.dataset.url;
    }

    // scroll
    // scroll
    function scrollToTop() {
        event.preventDefault();
        event.stopPropagation();
        window.scrollTo({
            top: 0,
            behavior: "smooth",
        });
    }
    function scrollToBottom() {
        event.preventDefault();
        event.stopPropagation();
        window.scrollTo({
            top: document.body.scrollHeight,
            behavior: "smooth",
        });
    }
</script>