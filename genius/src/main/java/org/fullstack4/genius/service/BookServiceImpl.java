package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.mapper.BookMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.awt.print.Book;
import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BookServiceImpl implements BookServiceIf {
    private final BookMapper bookMapper;
    private final ModelMapper modelMapper;


    @Override
    public int regist(BookDTO bookDTO) {
        BookVO bookVO = modelMapper.map(bookDTO, BookVO.class);
        log.info("==========================");
        log.info("BookServiceImpl >> regist(bookDTO) : " + bookDTO.toString());
        int result = bookMapper.regist(bookVO);
        log.info("BookServiceImpl >> regist(bookVO) : " + bookVO.toString());
        log.info("BookServiceImpl >> result : " + result);
        log.info("==========================");
        return result;
    }

    @Override
    public List<BookDTO> listAll() {
        List<BookDTO> bookDTOList = bookMapper.listAll().stream()
                .map(bookVO -> modelMapper.map(bookVO,BookDTO.class))
                .collect(Collectors.toList());
        return bookDTOList;
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
        log.info("==========================");
        log.info("BbsServiceImpl >> delete(int idx) : " + idx);
        int result = bookMapper.delete(idx);
        log.info("BbsServiceImpl >> result : " + result);
        log.info("==========================");
        return result;
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
