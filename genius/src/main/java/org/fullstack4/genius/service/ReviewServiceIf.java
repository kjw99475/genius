package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.ReviewVO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.ReviewDTO;

import java.util.List;

public interface ReviewServiceIf {
    int regist(ReviewDTO reviewDTO);

    List<ReviewDTO> listAll(String book_code);
    int delete(int idx);
    int reviewTotalCount(PageRequestDTO requestDTO);
    List<ReviewDTO> reviewListByPage(PageRequestDTO requestDTO);
}
