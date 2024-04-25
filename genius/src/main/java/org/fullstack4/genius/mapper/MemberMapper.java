package org.fullstack4.genius.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.MemberVO;

@Mapper
public interface MemberMapper {
    int join(MemberVO memberVO);
    MemberVO select(String user_id);
    int update(MemberVO memberVO);
    int leave(String user_id);
    int idCheck(String user_id);
}
