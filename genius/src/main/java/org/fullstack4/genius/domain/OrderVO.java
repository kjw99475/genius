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
    private String member_name;
    private String phone;
    private String book_code;
    private String book_name;
    private String book_img;
    private String category_class_code;
    private String category_subject_code;
    private String order_state;
    private LocalDate order_date;
    private int price;
    private int total_price;
    private int amount;
    private int total_amount;
    private String cancle_YN;
    private LocalDate cancle_date;
    private LocalDate delivery_start_date;
    private LocalDate delivery_end_date;
    private String delivery_addr1;
    private String delivery_addr2;
    private String delivery_state;
    private String delivery_company;
    private String order_addr1;
    private String order_addr2;
    private String order_zipcode;
    private String order_phone;
    private String order_name;


}
