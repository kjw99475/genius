package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.mapper.BookMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.awt.print.Book;
import java.util.List;
import java.util.Map;
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
        BookVO bookvo = bookMapper.view(idx);
        BookDTO bookDTO = modelMapper.map(bookvo, BookDTO.class);

        return bookDTO;
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
        int total_count = bookMapper.BookTotalCount(requestDTO);

        return total_count;
    }

    @Override
    public PageResponseDTO<BookDTO> BookListByPage(PageRequestDTO requestDTO) {
        List<BookVO> voList = bookMapper.BookListByPage(requestDTO);
        log.info("========================");
        log.info("voList : " + voList);
        log.info("========================");
        List<BookDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,BookDTO.class))
                .collect(Collectors.toList());
        int total_count = bookMapper.BookTotalCount(requestDTO);

        PageResponseDTO<BookDTO> responseDTO = PageResponseDTO.<BookDTO>withAll()
                .requestDTO(requestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public List<Map<String, String>> bookSubjectCategoryList() {
        return bookMapper.bookSubjectCategoryList();
    }

    @Override
    public List<Map<String, String>> bookClassCategoryList() {
        return bookMapper.bookClassCategoryList();
    }
}
