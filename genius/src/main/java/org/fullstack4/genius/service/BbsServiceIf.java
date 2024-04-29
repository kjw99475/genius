package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.dto.BbsDTO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface BbsServiceIf {

    int regist(BbsDTO bbsDTO);
    List<BbsDTO> listAll(String category_code);
    BbsDTO view(int idx);
    BbsDTO preView(int idx, String category_code);
    BbsDTO postView(int idx, String category_code);
    int modify(BbsDTO bbsDTO);
    int delete(int idx);
    int bbsTotalCount(PageRequestDTO requestDTO);
    List<BbsDTO> bbsListByPage(PageRequestDTO requestDTO);
}
