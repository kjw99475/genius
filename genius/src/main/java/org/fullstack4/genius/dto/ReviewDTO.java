package org.fullstack4.genius.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;
import java.time.LocalDate;

@Log4j2///실제 배포시에 넣지마
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewDTO {
    @PositiveOrZero
    private int review_idx;
    @NotBlank
    private String member_id;
    @NotBlank
    private String book_code;
    private LocalDate reg_date;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int rank=1;
    private String review_contents;
}
