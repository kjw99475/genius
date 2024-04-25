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
////@AllArgsConstructor
//@Builder
public class ReplyDTO {
    private int reply_idx;
    private int bbs_idx;
    private String reply_contents;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private int ref_idx;
    private String category_code;
}
