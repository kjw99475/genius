package org.fullstack4.genius.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QnaDTO {
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
}
