package org.fullstack4.genius.service;

import org.fullstack4.genius.dto.MemberDTO;

public interface MemberServiceIf {

    int join(MemberDTO memberDTO);
    MemberDTO view(String user_id);
    int update(MemberDTO memberDTO);
    int leave(String user_id);
    int idCheck(String user_id);

    MemberDTO login(String member_id, String pwd);
}
