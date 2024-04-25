package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.ReplyVO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.ReplyDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor

public class ReplyServiceImpl implements ReplyServiceIf{
    @Override
    public int regist(ReplyDTO bbsReplyDTO) {
        return 0;
    }

    @Override
    public int update_replyCnt(int bbs_idx) {
        return 0;
    }

    @Override
    public List<ReplyDTO> list(int bbs_idx) {
        return null;
    }

    @Override
    public int bbsReplyTotalCount(PageRequestDTO requestDTO) {
        return 0;
    }

    @Override
    public List<ReplyVO> bbsReplyListByPage(PageRequestDTO requestDTO) {
        return null;
    }
}
