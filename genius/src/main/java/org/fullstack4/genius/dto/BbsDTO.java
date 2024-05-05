package org.fullstack4.genius.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;
import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BbsDTO {
    private int bbs_idx;
    @Size(min=2, max=60)
    @NotBlank
    private String bbs_title;
    private String category_code;
    private String member_id;
    private String member_name;
    private String fileYN;
    @NotBlank
    private String bbs_contents;
    private LocalDate reg_date;
    private LocalDate modify_date;
    @PositiveOrZero
    @Builder.Default
    private int read_cnt=0;
}
