package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.MemberVO;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf {

    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;

    @Override
    public int join(MemberDTO memberDTO) {
        return 0;
    }

    @Override
    public MemberDTO view(String member_id) {

        MemberVO memberVO = memberMapper.view(member_id);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);

        log.info("===================================");
        log.info("memberDTO: " + memberDTO.toString());
        log.info("===================================");
        return memberDTO;
    }

    @Override
    public int update(MemberDTO memberDTO) {
        return 0;
    }

    @Override
    public int leave(String user_id) {
        return 0;
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
        System.out.println("memberVO : " + memberVO);
        MemberDTO memberDTO = null;
        if(memberVO != null) {
            memberDTO = modelMapper.map(memberVO, MemberDTO.class);
            System.out.println("memberDTO : " + memberDTO);
        }
        return memberDTO;
    }
}
