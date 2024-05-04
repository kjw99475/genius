package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.BannerVO;
import org.fullstack4.genius.dto.BannerDTO;
import org.fullstack4.genius.dto.FileDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;

import java.util.List;

public interface BannerServiceIf {
    PageResponseDTO<BannerDTO> list(PageRequestDTO pageRequestDTO);
    List<BannerDTO> orderList();
    BannerDTO view(String banner_img_idx);
    int regist(BannerDTO bannerDTO, FileDTO fileDTO);
    int modify(BannerDTO bannerDTO, FileDTO fileDTO);
    int delete(String banner_img_idx);
    int changeOrder(int order, String banner_img_idx);
}
