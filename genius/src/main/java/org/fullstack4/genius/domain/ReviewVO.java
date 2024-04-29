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
public class ReviewVO {
    private int review_idx;
    private String member_id;
    private String book_code;
    private LocalDate reg_date;
    private int rank;
    private String review_contents;

    private int book_idx;
    private String book_name;
    private String profile;
}
