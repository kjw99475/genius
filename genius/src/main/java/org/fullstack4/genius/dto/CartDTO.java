package org.fullstack4.genius.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartDTO {
    private int cart_idx;
    private String member_id;
    private String book_code;
    private int quantity;
    private LocalDate reg_date;
    private String book_name;
}
