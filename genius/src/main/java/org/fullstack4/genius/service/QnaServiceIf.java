package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.QnaVO;
import org.fullstack4.genius.dto.BbsDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.QnaDTO;

import java.util.List;

public interface QnaServiceIf {

    int regist(QnaDTO qnaDTO);
    List<QnaDTO> listAll();
    QnaDTO view(int idx);
    int modify(QnaDTO qnaDTO);
    int refModify(QnaDTO qnaDTO);
    int delete(int idx);
    int totalCount();
    int bbsTotalCount(PageRequestDTO requestDTO);
    List<QnaDTO> bbsListByPage(PageRequestDTO requestDTO);
}
