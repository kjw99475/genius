package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;
import java.util.Map;

@Mapper
public interface BbsMapper {
    int regist(BbsVO bbsVO);
    List<BbsVO> listAll(String category_code);
    List<BbsVO> list(Map<String,String> map);
    BbsVO view(int idx);
    BbsVO preView(@Param("bbs_idx") int bbs_idx, @Param("category_code") String category_code);
    BbsVO postView(@Param("bbs_idx") int bbs_idx, @Param("category_code") String category_code);
    int modify(BbsVO bbsVO);
    int delete(int idx);
    int readCount(int idx);
    int bbsTotalCount(PageRequestDTO requestDTO);
    List<BbsVO> bbsListByPage(PageRequestDTO requestDTO);
}
