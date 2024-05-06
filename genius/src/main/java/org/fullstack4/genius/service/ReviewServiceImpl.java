package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.domain.ReviewVO;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.mapper.BookMapper;
import org.fullstack4.genius.mapper.OrderMapper;
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
    private final OrderMapper orderMapper;
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
    @Transactional
    public int delete(int idx, String book_code) {
        log.info("reviewDelete idx : " + idx);
        int result = reviewMapper.delete(idx);
        int rank_result = reviewMapper.updateAvg(book_code);
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
        int total_count = reviewMapper.reviewTotalCount(requestDTO);
        return total_count;
    }

    @Override
    public PageResponseDTO<ReviewDTO> reviewListByPage(PageRequestDTO requestDTO) {
        List<ReviewVO> voList = reviewMapper.reviewListByPage(requestDTO);
        List<ReviewDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,ReviewDTO.class))
                .collect(Collectors.toList());
        int total_count = reviewMapper.reviewTotalCount(requestDTO);

        PageResponseDTO<ReviewDTO> responseDTO = PageResponseDTO.<ReviewDTO>withAll()
                .requestDTO(requestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public List<OrderDTO> reviewConfirm(String member_id) {
        List<OrderVO> voList = orderMapper.reviewConfirm(member_id);
        List<OrderDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,OrderDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }
}
