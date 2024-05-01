package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.BannerVO;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.domain.ReviewVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface MainMapper {
    List<BookVO> yesterDayBook();
    List<BookVO> totalBook();
    List<BookVO> newBook();
    List<ReviewVO> review();
    List<BannerVO> banner();
    List<BannerVO> list(PageRequestDTO pageRequestDTO);
    int totalCount(PageRequestDTO pageRequestDTO);
}
