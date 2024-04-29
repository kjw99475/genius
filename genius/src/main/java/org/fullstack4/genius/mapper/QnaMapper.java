package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.domain.QnaVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface QnaMapper {
    int regist(QnaVO qnaVO);
    List<QnaVO> listAll();
    QnaVO view(int idx);
    int modify(QnaVO qnaVO);
    int delete(int idx);
    int refModify(int idx);
    int totalCount();
    int qnaTotalCount(PageRequestDTO requestDTO);
    List<QnaVO> qnaListByPage(PageRequestDTO requestDTO);
}
