package org.fullstack4.genius.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2///실제 배포시에 넣지마
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BannerVO {
    private int banner_img_idx;
    private String banner_status;
    private String save_name;
    private String original_name;
    private String path;
    private String member_id;
    private String reg_date;
    private String modify_date;
}

