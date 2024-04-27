package org.fullstack4.genius.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Log4j2///실제 배포시에 넣지마
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderVO {
    private int order_idx;
    private String order_num;
    private String member_id;
    private String book_code;
    private String category_class_code;
    private String category_subject_code;
    private String order_state;
    private LocalDate order_date;
    private int price;
    private int total_price;
    private int amount;

}
