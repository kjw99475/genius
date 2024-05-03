package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.domain.QnaVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.Arrays;
import java.util.List;

@Mapper
public interface QnaMapper {
    int regist(QnaVO qnaVO);
    List<QnaVO> listAll();
    QnaVO view(int idx);
    int modify(QnaVO qnaVO);
    int delete(int idx);
    int answerDelete(int idx);
    int refModify(int idx);
    int totalCount();
    int qnaTotalCount(PageRequestDTO requestDTO);
    int readCount(int idx);
    int answerRegist(QnaVO qnaVO);
    int answerStatus(int idx);
    List<QnaVO> qnaListByPage(PageRequestDTO requestDTO);
    List<QnaVO> qnaListByMyPage(PageRequestDTO requestDTO);
    List<QnaVO> myListAll();
}
