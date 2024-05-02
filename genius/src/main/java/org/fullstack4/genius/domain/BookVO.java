package org.fullstack4.genius.domain;


import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Log4j2///실제 배포시에 넣지마
@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookVO {
    private int book_idx;
    private String book_code;
    private String book_name;
    private String author;
    private int price;
    private int quantity;
    private String category_class_code;
    private String category_subject_code;
    private LocalDate publication_date;
    private LocalDate sales_start_date;
    private LocalDate sales_end_date;
    private String sales_status;
    private String book_img;
    private String publisher;
    private int discount_price;
    private int discount_per;
    private String book_info;
    private double rank_avg;
    private String video;
    private String isbn;
    private String tags;
    private String contents;
    private String class_name;
    private String subject_name;
    private String sales_amount;
    private String sales_price;
}
