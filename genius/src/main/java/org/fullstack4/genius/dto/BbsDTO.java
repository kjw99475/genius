package org.fullstack4.genius.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.core.config.plugins.validation.constraints.NotBlank;

import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BbsDTO {
    private int bbs_idx;
    @NotBlank
    private String bbs_title;
    private String category_code;
    @NotBlank
    private String member_id;
    private String member_name;
//    @Builder.Default
//    private String fileYN="N";
    private String fileYN;
    @NotBlank
    private String bbs_contents;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private int read_cnt;
}
