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
public class CartVO {
    private int cart_idx;
    private String member_id;
    private String book_code;
    private String book_img;
    private String category_class_code;
    private String category_subject_code;
    private int price;
    private int quantity;
    private LocalDate reg_date;
    private String book_name;
}
