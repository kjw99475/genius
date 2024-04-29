package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BannerVO;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.domain.ReviewVO;
import org.fullstack4.genius.dto.BannerDTO;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.MainDTO;
import org.fullstack4.genius.dto.ReviewDTO;
import org.fullstack4.genius.mapper.MainMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainServiceIf {
    private final MainMapper mainMapper;
    private final ModelMapper modelMapper;
    @Override
    public MainDTO mainView() {
        MainDTO mainDTO = null;

        List<BookVO> yesterDayBookVOList = mainMapper.yesterDayBook();
        List<BookVO> totalBookVOList = mainMapper.totalBook();
        List<BookVO> newBookVOList = mainMapper.newBook();
        List<ReviewVO> reviewVOList = mainMapper.review();
        List<BannerVO> bannerVOList = mainMapper.banner();

        List<BookDTO> yesterDayBookDTOList = null;
        List<BookDTO> totalBookDTOList = null;
        List<BookDTO> newBookDTOList = null;
        List<ReviewDTO> reviewDTOList = null;
        List<BannerDTO> bannerDTOList = null;

        if (yesterDayBookVOList != null) {
            yesterDayBookDTOList = yesterDayBookVOList.stream().map(vo->modelMapper.map(vo, BookDTO.class)).collect(Collectors.toList());
        }
        if (totalBookVOList != null) {
            totalBookDTOList = totalBookVOList.stream().map(vo->modelMapper.map(vo, BookDTO.class)).collect(Collectors.toList());
        }
        if (newBookVOList != null) {
            newBookDTOList = newBookVOList.stream().map(vo->modelMapper.map(vo, BookDTO.class)).collect(Collectors.toList());
        }
        if (reviewVOList != null) {
            reviewDTOList = reviewVOList.stream().map(vo->modelMapper.map(vo, ReviewDTO.class)).collect(Collectors.toList());
        }
        if (bannerVOList != null) {
            bannerDTOList = bannerVOList.stream().map(vo->modelMapper.map(vo, BannerDTO.class)).collect(Collectors.toList());
        }

        mainDTO = MainDTO.builder()
                .yesterDayBookDTOList(yesterDayBookDTOList)
                .totalBookDTOList(totalBookDTOList)
                .newBookDTOList(newBookDTOList)
                .reviewDTOList(reviewDTOList)
                .bannerDTOList(bannerDTOList)
                .build();
        return mainDTO;
    }
}
