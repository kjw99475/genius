package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.ReviewVO;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.dto.ReviewDTO;

import java.util.List;

public interface ReviewServiceIf {
    int regist(ReviewDTO reviewDTO);

    List<ReviewDTO> listAll(String book_code);
    int delete(int idx, String book_code);
    int updateAvg(String book_code);
    int reviewTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<ReviewDTO> reviewListByPage(PageRequestDTO requestDTO);
    List<OrderDTO> reviewConfirm(String member_id);

}
