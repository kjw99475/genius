// --------------------------------------------------- 체크용 함수 (boolean 값 리턴)
// 공란 or 띄어쓰기만 들어간 값 체크 (null 체크용)
function nullCheck(str) {
    if ($(str).val()) {
        if($(str).val().indexOf(" ") < 0) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}

// 길이 체크용 str => 비교 대상 문자열 / min => 최소 글자 수 (min 값보다 str이 작으면 false로 체크) / max => 최대 글자 수 (max 값 보다 str이 크면 false로 체크)
function lengthCheck(min, max, str) {
    if (!str) {
        let str = str.trim();
        if(str.length() < min || str.length() > max) {
            return false;
        } else {
            return true;
        }
    } else {
        return false;
    }
}


// 비밀번호 체크 - 영문대소문자 + 0~9자리 + 특수문자 (!@#$%^*+=-)
function passwordRegCheck(element) {
    let reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,16}$/;
    if (!reg.test($(element).val())){
        return false;
    } else {
        return true;
    }
}

// 아이디 체크
function idRegCheck(element) {
    let reg = /^[a-z0-9]{8,20}$/;
    if (!reg.test($(element).val())){
        return false;
    } else {
        return true;
    }
}

// 아이디 체크
function nameRegCheck(element) {
    let reg = /^[ㄱ-ㅎ|가-힣]+$/;
    if (!reg.test($(element).val())){
        return false;
    } else {
        return true;
    }
}

// 비밀번호 일치 여부 체크
function passwordMatch(element, target) {
    if($(element).val() != $(target).val()) {
        return false;
    } else {
        return true;
    }
}

// 핸드폰 번호 체크
function phoneRegCheck(element) {
    let reg = /^[0-9]{10,11}$/;
    if (!reg.test($(element).val())){
        return false;
    } else {
        return true;
    }
}

// --------------------------------------------------- replace용 함수 - 요소에 직접 걸어서 값을 바로 조작하는 용도
// 공백 문자 제거용 input에 onKeyUp 이벤트로 인자로 this 로 넣어주면 됨.
function replaceBlack(element) {
    let removedValue = element.value.replaceAll(" ", "");
    element.value = removedValue;
}

// 핸드폰 번호 replace 요소에 onkeyup 으로 걸면 됨
function replacePhone(element) {
    $(element).val($(element).val().replace(/[^0-9]/g, ""));
    $(element).val($(element).val().replace(/^(\d{3})(\d{3,4})(\d{4})$/, '$1-$2-$3'));
}

// 한글만 입력하도록 다른 글자 다 제거
function replaceName(element) {
    replaceBlack(element);
    element.value = element.value.replace(/[^ㄱ-ㅎ가-힣]/g, "");
}

