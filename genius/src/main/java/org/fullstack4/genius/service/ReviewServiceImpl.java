package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.domain.ReviewVO;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.ReviewDTO;
import org.fullstack4.genius.mapper.BookMapper;
import org.fullstack4.genius.mapper.ReviewMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewServiceIf{
    private final ReviewMapper reviewMapper;
    private final ModelMapper modelMapper;
    @Override
    @Transactional
    public int regist(ReviewDTO reviewDTO) {
        ReviewVO reviewVO = modelMapper.map(reviewDTO, ReviewVO.class);
        log.info("==========================");
        int result = reviewMapper.regist(reviewVO);
        int result1 = reviewMapper.updateAvg(reviewVO.getBook_code());
        log.info("ReviewServiceImpl reviewRegist>> result : " + result);
        log.info("ReviewServiceImpl updateAvg>> result : " + result1);
        log.info("==========================");
        return result;
    }

    @Override
    public List<ReviewDTO> listAll(String book_code) {
        List<ReviewDTO> reviewDTOList = reviewMapper.listAll(book_code).stream()
                .map(reviewVO -> modelMapper.map(reviewVO,ReviewDTO.class))
                .collect(Collectors.toList());
        return reviewDTOList;
    }

    @Override
    public int delete(int idx) {
        int result = reviewMapper.delete(idx);
        return result;
    }

    @Override
    public int updateAvg(String book_code) {
        log.info("==============================");
        int result = reviewMapper.updateAvg(book_code);
        log.info("ReviewServiceImpl >> updateAvg : result " + result);
        log.info("==============================");
        return result;
    }

    @Override
    public int reviewTotalCount(PageRequestDTO requestDTO) {
        return 0;
    }

    @Override
    public List<ReviewDTO> reviewListByPage(PageRequestDTO requestDTO) {
        return null;
    }
}
