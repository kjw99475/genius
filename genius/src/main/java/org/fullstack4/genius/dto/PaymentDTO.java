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
public class PaymentDTO {
    private int total_count;
    private int payment_idx;
    private String payment_num;
    private String member_id;
    private int price;
    private String method;
    private String company;
    private LocalDate reg_date;
    private String use_type;
    private String title;
}
