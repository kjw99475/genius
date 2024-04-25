package org.fullstack4.genius.domain;

import java.time.LocalDate;

//@Log4j2///실제 배포시에 넣지마
//@ToString
//@Getter
//@AllArgsConstructor
////@NoArgsConstructor
//@Builder
public class CartVO {
    private int cart_idx;
    private String member_id;
    private String book_code;
    private int quantity;
    private LocalDate reg_date;
    private String book_name;
}
