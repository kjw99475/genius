package org.fullstack4.genius.dto;

import java.time.LocalDate;

//@Log4j2
//@Data
//@NoArgsConstructor
////@AllArgsConstructor
//@Builder
public class OrderDTO {
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
