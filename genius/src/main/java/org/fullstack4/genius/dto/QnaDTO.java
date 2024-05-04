package org.fullstack4.genius.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;
import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QnaDTO {
    private int qna_idx;
    @NotBlank
    private String title;
    @NotBlank
    private String contents;
    private String member_id;
    private String answerYN;
    private String answerStatus;
    private String category_code;
    @PositiveOrZero
    @Builder.Default
    private int read_cnt=0;
    private int ref_idx;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private String member_name;
    private String fileYN;
}
