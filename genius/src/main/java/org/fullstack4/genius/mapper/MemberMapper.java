package org.fullstack4.genius.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.MemberVO;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface MemberMapper {
    int regist(MemberVO MemberVO);
    List<MemberVO> listAll();
    MemberVO view(String member_id);
    int modify(MemberVO MemberVO);
    int delete(int idx);
    int MemberTotalCount(PageRequestDTO requestDTO);
    List<MemberVO> MemberListByPage(PageRequestDTO requestDTO);

    MemberVO login(String member_id);
}
