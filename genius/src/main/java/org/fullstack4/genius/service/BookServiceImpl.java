package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.mapper.BookMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class BookServiceImpl implements BookServiceIf {

    @Override
    public int regist(BookVO bbsVO) {
        return 0;
    }

    @Override
    public List<BookDTO> listAll() {
        return null;
    }

    @Override
    public BookDTO view(int idx) {
        return null;
    }

    @Override
    public int modify(BookDTO bookDTO) {
        return 0;
    }

    @Override
    public int delete(int idx) {
        return 0;
    }

    @Override
    public int BookTotalCount(PageRequestDTO requestDTO) {
        return 0;
    }

    @Override
    public List<BookDTO> BookListByPage(PageRequestDTO requestDTO) {
        return null;
    }
}
