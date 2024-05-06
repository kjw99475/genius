package org.fullstack4.genius.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.*;
import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BookDTO {
    private int book_idx;
    private String book_code;
    @NotBlank(message = "책 이름을 입력해주세요.")
    private String book_name;
    @NotBlank(message = "저자를 입력해 주세요")
    private String author;

    @PositiveOrZero(message = "0보다 작은 수는 입력하실 수 없습니다.")
    @Min(value=0)
    private int price;

    @PositiveOrZero(message = "0보다 작은 수는 입력하실 수 없습니다.")
    @Min(value=0)
    private int quantity;
    @PositiveOrZero(message = "0보다 작은 수는 입력하실 수 없습니다.")
    private int amount;
    @NotBlank(message = "해당 책의 학년을 입력해 주세요")
    private String category_class_code;
    @NotBlank(message = "해당 책의 과목을 분류해 주세요")
    private String category_subject_code;
    private LocalDate sales_start_date;
    private LocalDate sales_end_date;
    private String sales_status;
    private String book_img;
    @NotBlank(message = "출판사를 선택해 주세요")
    private String publisher;
    private int discount_price;

    @PositiveOrZero(message = "0부터 100사이의 수를 입력해 주세요.")
    @Range(min=0, max=100)
    private int discount_per;
    private String book_info;
    private double rank_avg;
    private String video;
    @NotBlank(message = "ISBN을 입력해 주세요.")
    private String isbn;
    private String tags;
    @NotBlank(message = "목차를 입력해 주세요.")
    private String contents;
    private LocalDate publication_date;
    private String class_name;
    private String subject_name;
    private String sales_amount;
    private String sales_price;
}
