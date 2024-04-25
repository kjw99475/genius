package org.fullstack4.genius.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

//@Log4j2
//@Data
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder
public class BbsDTO {
    private int bbs_idx;
    private String bbs_title;
    private String category_code;
    private String member_id;
    private String fileYN;
    private String replyYN;
    private String bbs_contents;
    private LocalDate reg_date;
    private int read_cnt;
}
