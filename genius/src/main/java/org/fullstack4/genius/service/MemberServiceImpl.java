package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.MemberDTO;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf {
    @Override
    public int join(MemberDTO memberDTO) {
        return 0;
    }

    @Override
    public MemberDTO view(String user_id) {
        return null;
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
}
