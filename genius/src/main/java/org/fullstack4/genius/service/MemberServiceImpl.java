package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;
import org.fullstack4.genius.Common.FileUtil;
import org.fullstack4.genius.domain.MemberVO;
import org.fullstack4.genius.dto.FileDTO;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

//        log.info("===================================");
//        log.info("memberDTO: " + memberDTO.toString());
//        log.info("===================================");
        return memberDTO;
    }


    @Override
    public int leave(String member_id) {
        int result = memberMapper.leave(member_id);
        return result;
    }

    @Override
    public int idCheck(String user_id) {
        return 0;
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
}
