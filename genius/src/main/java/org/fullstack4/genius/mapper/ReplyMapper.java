package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.domain.ReplyVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface ReplyMapper {

    int regist(ReplyVO bbsReplyVO);
    int update_replyCnt(int bbs_idx);
    List<ReplyVO> list(int bbs_idx);
    int bbsReplyTotalCount(PageRequestDTO requestDTO);
    List<ReplyVO> bbsReplyListByPage(PageRequestDTO requestDTO);
}
