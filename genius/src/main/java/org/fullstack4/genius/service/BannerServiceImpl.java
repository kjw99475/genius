package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.FileUtil;
import org.fullstack4.genius.domain.BannerVO;
import org.fullstack4.genius.dto.BannerDTO;
import org.fullstack4.genius.dto.FileDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.mapper.BannerMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BannerServiceImpl implements BannerServiceIf {
    private final BannerMapper bannerMapper;
    private final ModelMapper modelMapper;

    @Override
    public BannerDTO view(String banner_img_idx) {
        BannerVO bannerVO = bannerMapper.view(banner_img_idx);
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
        int total_count = bannerMapper.totalCount(pageRequestDTO);
        List<BannerVO> bannerVOList = bannerMapper.list(pageRequestDTO);
        List<BannerDTO> bannerDTOList = bannerVOList.stream().map(vo -> modelMapper.map(vo, BannerDTO.class)).collect(Collectors.toList());
        PageResponseDTO<BannerDTO> pageResponseDTO = PageResponseDTO.<BannerDTO>withAll().requestDTO(pageRequestDTO).dtoList(bannerDTOList).total_count(total_count).build();
        log.info("pageResponseDTO : " + pageResponseDTO);
        return pageResponseDTO;
    }

    @Override
    public int regist(BannerDTO bannerDTO, FileDTO fileDTO) {
        int result = 0;
        // 파일 업로드
        Map<String, String> map = FileUtil.FileUpload(fileDTO);
        if(map.get("result").equals("success")) {
            bannerDTO.setSave_name(map.get("newName"));
            bannerDTO.setOriginal_name(map.get("orgName"));
            bannerDTO.setPath("/resources/upload/banner/");
            // 성공한 경우만 DB INSERT 실행
            BannerVO bannerVO = modelMapper.map(bannerDTO, BannerVO.class);
            result = bannerMapper.regist(bannerVO);
        }
        return result;
    }

    @Override
    public int modify(BannerDTO bannerDTO, FileDTO fileDTO) {
        int result = 0;
        if (fileDTO != null) {
            // 파일이 교체된 경우
            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            if(map.get("result").equals("success")) {
                bannerDTO.setSave_name(map.get("newName"));
                bannerDTO.setOriginal_name(map.get("orgName"));
                bannerDTO.setPath("/resources/upload/banner/");
                // 성공한 경우만 DB INSERT 실행
                BannerVO bannerVO = modelMapper.map(bannerDTO, BannerVO.class);
                result = bannerMapper.modify(bannerVO);
            }
        } else {
            BannerVO bannerVO = modelMapper.map(bannerDTO, BannerVO.class);
            result = bannerMapper.modify(bannerVO);
        }
        return result;
    }

    @Override
    public int delete(String banner_img_idx) {
        return bannerMapper.delete(banner_img_idx);
    }
}
