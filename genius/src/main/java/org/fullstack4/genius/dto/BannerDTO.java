package org.fullstack4.genius.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BannerDTO {
    private int banner_img_idx;
    private String title;
    private String save_name;
    private String original_name;
    private String path;
    private String member_id;
    private String member_name;
    private String reg_date;
    private String modify_date;
    private String post_start_date;
    private String post_end_date;
    private String banner_status;
    private int order;
}
