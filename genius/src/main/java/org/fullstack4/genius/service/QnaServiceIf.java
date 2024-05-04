package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.QnaVO;
import org.fullstack4.genius.dto.BbsDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.dto.QnaDTO;

import java.util.List;

public interface QnaServiceIf {

    int regist(QnaDTO qnaDTO);
    List<QnaDTO> listAll();
    List<QnaDTO> myListAll();
    QnaDTO view(int idx);
    int modify(QnaDTO qnaDTO);
    int refModify(QnaDTO qnaDTO);
    int delete(int idx);
    int readCount(int idx);
    int totalCount();
    int answerRegist(QnaDTO qnaDTO);
    int answerStatus(int idx);
    int answerDelete(int idx);
    int qnaTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<QnaDTO> qnaListByPage(PageRequestDTO requestDTO);
}
