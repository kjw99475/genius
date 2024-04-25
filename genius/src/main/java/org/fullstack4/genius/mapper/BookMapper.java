package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface BookMapper {
    int regist(BookVO bbsVO);

    List<BookVO> listAll();
    BookVO view(int idx);
    int modify(BookVO bbsVO);
    int delete(int idx);
    int BookTotalCount(PageRequestDTO requestDTO);
    List<BookVO> BookListByPage(PageRequestDTO requestDTO);
}
