package org.fullstack4.genius.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.util.List;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MainDTO {
    private List<BookDTO> yesterDayBookDTOList;
    private List<BookDTO> totalBookDTOList;
    private List<BookDTO> newBookDTOList;
    private List<ReviewDTO> reviewDTOList;
    private List<BannerDTO> bannerDTOList;
}
