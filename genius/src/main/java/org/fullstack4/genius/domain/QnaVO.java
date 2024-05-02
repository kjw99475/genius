package org.fullstack4.genius.domain;


import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Log4j2///실제 배포시에 넣지마
@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnaVO {
    private int qna_idx;
    private String title;
    private String contents;
    private String member_id;
    private String answerYN;
    private String category_code;
    private int read_cnt;
    private int ref_idx;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private String member_name;
    private String fileYN;
}
