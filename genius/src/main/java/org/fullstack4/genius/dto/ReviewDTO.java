package org.fullstack4.genius.dto;

import java.time.LocalDate;

//@Log4j2///실제 배포시에 넣지마
//@GData
//@AllArgsConstructor
//@NoArgsConstructor
//@Builder
public class ReviewDTO {
    private int review_idx;
    private String member_id;
    private String book_code;
    private LocalDate reg_date;
    private int rank;
    private String review_contents;
}