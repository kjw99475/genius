package org.fullstack4.genius.domain;


import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

//@Log4j2///실제 배포시에 넣지마
//@ToString
//@Getter
//@AllArgsConstructor
////@NoArgsConstructor
//@Builder
public class ReplyVO {
    private int reply_idx;
    private int bbs_idx;
    private String reply_contents;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private int ref_idx;
    private String category_code;
}
