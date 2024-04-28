package org.fullstack4.genius.service;

import org.fullstack4.genius.dto.FileDTO;
import org.fullstack4.genius.dto.MemberDTO;
import org.springframework.web.multipart.MultipartFile;

public interface MemberServiceIf {

    int join(MemberDTO memberDTO);
    MemberDTO view(String user_id);
    int leave(String member_id);
    int idCheck(String user_id);

    MemberDTO login(String member_id, String pwd);
    MemberDTO AutoLogin(String member_id);
    String findId(MemberDTO memberDTO);
    String findPwd(MemberDTO memberDTO);
    int changePwd(MemberDTO memberDTO);
    int modifyInfo(MemberDTO memberDTO, FileDTO fileDTO);
}
