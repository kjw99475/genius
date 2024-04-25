package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.mapper.BookMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class BookServiceImpl implements BookMapper {
    @Override
    public int regist(BookVO bbsVO) {
        return 0;
    }

    @Override
    public List<BookVO> listAll() {
        return List.of();
    }

    @Override
    public BookVO view(int idx) {
        return null;
    }

    @Override
    public int modify(BookVO bbsVO) {
        return 0;
    }

    @Override
    public int delete(int idx) {
        return 0;
    }

    @Override
    public int bbsTotalCount(PageRequestDTO requestDTO) {
        return 0;
    }

    @Override
    public List<BookVO> bbsListByPage(PageRequestDTO requestDTO) {
        return List.of();
    }
}
