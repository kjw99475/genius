package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.BannerVO;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.domain.ReviewVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface BannerMapper {
    List<BannerVO> list(PageRequestDTO pageRequestDTO);
    int totalCount(PageRequestDTO pageRequestDTO);
    BannerVO view(String banner_img_idx);
    int regist(BannerVO bannerVO);
    int modify(BannerVO bannerVO);
    int delete(String banner_img_idx);
}
