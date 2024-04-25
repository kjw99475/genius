package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.ReplyVO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.ReplyDTO;

import java.util.List;

public interface ReplyServiceIf {

    int regist(ReplyDTO bbsReplyDTO);
    int update_replyCnt(int bbs_idx);
    List<ReplyDTO> list(int bbs_idx);
    int bbsReplyTotalCount(PageRequestDTO requestDTO);
    List<ReplyVO> bbsReplyListByPage(PageRequestDTO requestDTO);
}
