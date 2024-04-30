package org.fullstack4.genius.domain;


import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Log4j2///실제 배포시에 넣지마
@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsVO {
    private int bbs_idx;
    private String bbs_title;
    private String category_code;
    private String member_id;
    private String member_name;
    private String fileYN;
    private String replyYN;
    private String bbs_contents;
    private LocalDate reg_date;
    private int read_cnt;

}
