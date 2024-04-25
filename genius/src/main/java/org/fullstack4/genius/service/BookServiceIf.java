package org.fullstack4.genius.service;


import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.springframework.stereotype.Service;

import java.util.List;

public interface BookServiceIf {
    int regist(BookVO bbsVO);

    List<BookDTO> listAll();
    BookDTO view(int idx);
    int modify(BookDTO bookDTO);
    int delete(int idx);
    int BookTotalCount(PageRequestDTO requestDTO);
    List<BookDTO> BookListByPage(PageRequestDTO requestDTO);
}
