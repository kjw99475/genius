package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;
import org.fullstack4.genius.Common.FileUtil;
import org.fullstack4.genius.domain.MemberVO;
import org.fullstack4.genius.dto.FileDTO;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.mapper.MemberMapper;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf {

    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;

    @Override
    public int join(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.join(memberVO);
        return result;
    }

    @Override
    public MemberDTO view(String member_id) {

        MemberVO memberVO = memberMapper.view(member_id);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        return memberDTO;
    }


    @Override
    public int leave(String member_id) {
        int result = memberMapper.leave(member_id);
        return result;
    }

    @Override
    public int idCheck(String member_id) {
        return memberMapper.idCheck(member_id);
    }
    @Override
    public int emailCheck(String email) {
        return memberMapper.emailCheck(email);
    }

    @Override
    public MemberDTO login(String member_id, String pwd) {
        MemberVO memberVO = memberMapper.login(member_id);
        MemberDTO memberDTO = null;
        if(memberVO != null && pwd.equals(memberVO.getPwd())) {
            memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        }
        return memberDTO;
    }

    @Override
    public MemberDTO AutoLogin(String member_id) {
        MemberVO memberVO = memberMapper.login(member_id);
        MemberDTO memberDTO = null;
        if(memberVO != null) {
            memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        }
        return memberDTO;
    }

    @Override
    public String findId(MemberDTO memberDTO) {
        MemberVO memberVO = null;
        if (memberDTO != null) {
            memberVO = modelMapper.map(memberDTO, MemberVO.class);
        }
        String result = memberMapper.findId(memberVO);
        log.info("MemberServiceImpl >>>>> findId ");
        log.info("result : " + result);
        return result;
    }

    @Override
    public String findPwd(MemberDTO memberDTO) {
        MemberVO memberVO = null;
        if (memberDTO != null) {
            memberVO = modelMapper.map(memberDTO, MemberVO.class);
        }
        String result = memberMapper.findPwd(memberVO);
        log.info("MemberServiceImpl >>>>> findPwd ");
        log.info("result : " + result);
        return result;
    }

    @Override
    public int changePwd(MemberDTO memberDTO) {
        MemberVO memberVO = null;
        if (memberDTO != null) {
            memberVO = modelMapper.map(memberDTO, MemberVO.class);
        }
        int result = memberMapper.changePwd(memberVO);
        log.info("MemberServiceImpl >>>>> changePwd ");
        log.info("result : " + result);
        return result;
    }

    @Override
    public int modifyInfo(MemberDTO memberDTO, FileDTO fileDTO) {
        int result = 0;
        if(fileDTO != null) {
            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            if(map.get("result").equals("success")) {
                memberDTO.setProfile(map.get("newName"));
                MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
                result = memberMapper.modifyInfo(memberVO);
            }
        } else {
            MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
            result = memberMapper.modifyInfo(memberVO);
        }
        return result;
    }

    @Override
    public MemberDTO naverLogin(HttpServletRequest request) {
        MemberDTO memberDTO = null;

        //로그인 요청에서 받아온 파라미터
        String code = CommonUtil.parseString(request.getParameter("code")); // 토큰 받기 요청에 필요한 인가 코드
        String error = CommonUtil.parseString(request.getParameter("error")); // 인증 실패 시 반환되는 에러 코드
        String error_description = CommonUtil.parseString(request.getParameter("error_description")); // 인증 실패 시 반환되는 에러 메시지
        String state = CommonUtil.parseString(request.getParameter("state")); //요청 시 전달한 state 값과 동일한 값

        // 값 셋팅
        String url = "https://nid.naver.com/oauth2.0/token"; // 로그인 토큰 획득 url
        String client_id = "9GW7lkN31ckPUUZa1KsK"; // 네이버 client id 키
        String client_secret = "R7SUBhiXia";
        String getUserInfoUrl = "https://openapi.naver.com/v1/nid/me"; // (기본)네이버 토큰으로 유저 정보 가져오기
        String getUserInfoUrl2 = "https://openapi.naver.com/v1/nid/payaddress"; // (네이버 페이 - 배송지 주소)네이버 토큰으로 유저 정보 가져오기

        //기타 파라미터 셋팅
        String grant_type = "authorization_code"; // 인증 과정에 대한 구분값 1) 발급:'authorization_code'    2) 갱신:'refresh_token'    3) 삭제: 'delete'

        //파라미터 셋팅
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("code", code);
        paramMap.put("state", state);
        paramMap.put("client_id", client_id);
        paramMap.put("client_secret", client_secret);
        paramMap.put("grant_type", grant_type);

        try {
            String responseStr = CommonUtil.postConnection(url, paramMap); // POST요청으로 로그인 토큰 획득
            // JSON 파싱
            if(!CommonUtil.parseString(responseStr).isEmpty()){
                JSONParser jsonParser = new JSONParser();
                JSONObject jsonObject = (JSONObject) jsonParser.parse(responseStr);
                String access_token = (String) jsonObject.get("access_token");

                //HttpHeader 생성
                HttpHeaders headers = new HttpHeaders();
                headers.add("Authorization", "Bearer " + access_token);
                headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

                //HttpHeader 담기 (기본 네이버)
                RestTemplate rt = new RestTemplate();
                HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(headers);
                ResponseEntity<String> response = rt.exchange(
                        getUserInfoUrl,
                        HttpMethod.POST,
                        httpEntity,
                        String.class
                );

                //Response 데이터 파싱
                // 기본 네이버
                JSONParser infoJsonParser = new JSONParser();
                JSONObject jsonObj    = (JSONObject) infoJsonParser.parse(response.getBody());
                JSONObject responseObj = (JSONObject) jsonObj.get("response");

                String member_id = String.valueOf(responseObj.get("id"));
                String member_name = String.valueOf(responseObj.get("name"));
                String email = String.valueOf(responseObj.get("email"));
                String phone = String.valueOf(responseObj.get("mobile"));
                if(phone != null) {phone = phone.replace("-","");}
                String gender = String.valueOf(responseObj.get("gender"));
                if(gender != null) {
                    if(gender.equals("F")) {
                        gender = "여";
                    } else if(gender.equals("M")) {
                        gender = "남";
                    } else {
                        gender = "-";
                    }
                }
                String birthyear = String.valueOf(CommonUtil.parseString(responseObj.get("birthyear")));
                String birthday = String.valueOf(CommonUtil.parseString(responseObj.get("birthday")));
                System.out.println(birthyear+"-"+birthday);
                LocalDate birthdayToLocalDate = null;
                if(!birthday.equals("") && !birthyear.equals("")) {birthdayToLocalDate = LocalDate.parse(birthyear+"-"+birthday);}
                // 받아온 정보로 회원가입 및 로그인 구현
                MemberVO memberVO = memberMapper.naver(member_id);
                System.out.println("-------------------- member_id : " + member_id);
                if(memberVO != null) {
                    // 이미 존재하는 회원일 경우
                    memberDTO = modelMapper.map(memberVO, MemberDTO.class);
                } else {
                    MemberDTO newMemberDTO = MemberDTO.builder()
                            .pwd("")
                            .member_id(member_id)
                            .member_name(member_name)
                            .email(email)
                            .phone(phone)
                            .gender(gender)
                            .birthday(birthdayToLocalDate)
                            .social_type("naver")
                            .build();
                    MemberVO newMemberVO = modelMapper.map(newMemberDTO, MemberVO.class);
                    int result = memberMapper.join(newMemberVO);
                    if (result > 0) {
                        memberDTO = newMemberDTO;
                    }
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return memberDTO;
    }
}
