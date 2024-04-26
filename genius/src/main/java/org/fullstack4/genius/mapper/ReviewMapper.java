package org.fullstack4.genius.mapper;

import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.domain.ReviewVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;
import java.util.Map;

public interface ReviewMapper {
    int regist(ReviewVO reviewVO);

    List<ReviewVO> listAll(String book_code);
    int delete(int idx);
    int reviewTotalCount(PageRequestDTO requestDTO);
    List<ReviewVO> reviewListByPage(PageRequestDTO requestDTO);
}
