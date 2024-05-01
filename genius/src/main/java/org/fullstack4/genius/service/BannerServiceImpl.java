package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BannerVO;
import org.fullstack4.genius.dto.BannerDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.mapper.MainMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BannerServiceImpl implements BannerServiceIf {
    private final MainMapper mainMapper;
    private final ModelMapper modelMapper;

    @Override
    public BannerDTO view(String banner_img_idx) {
        BannerVO bannerVO = mainMapper.view(banner_img_idx);
        BannerDTO bannerDTO = null;
        if (bannerVO != null) {
            bannerDTO = modelMapper.map(bannerVO, BannerDTO.class);
        }
        return bannerDTO;
    }

    @Override
    public PageResponseDTO<BannerDTO> list(PageRequestDTO pageRequestDTO) {
        log.info("pageRequestDTO : " + pageRequestDTO);
        log.info("==============================================");
        int total_count = mainMapper.totalCount(pageRequestDTO);
        List<BannerVO> bannerVOList = mainMapper.list(pageRequestDTO);
        List<BannerDTO> bannerDTOList = bannerVOList.stream().map(vo -> modelMapper.map(vo, BannerDTO.class)).collect(Collectors.toList());
        PageResponseDTO<BannerDTO> pageResponseDTO = PageResponseDTO.<BannerDTO>withAll().requestDTO(pageRequestDTO).dtoList(bannerDTOList).total_count(total_count).build();
        log.info("pageResponseDTO : " + pageResponseDTO);
        return pageResponseDTO;
    }
}
