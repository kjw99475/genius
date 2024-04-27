package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface BbsMapper {
    int regist(BbsVO bbsVO);
    List<BbsVO> listAll();
    BbsVO view(int idx);
    int modify(BbsVO bbsVO);
    int delete(int idx);
    int bbsTotalCount(PageRequestDTO requestDTO);
    List<BbsVO> bbsListByPage(PageRequestDTO requestDTO);
}
