package org.fullstack4.genius.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2///실제 배포시에 넣지마
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentVO {
    private int payment_idx;
    private String payment_num;
    private String member_id;
    private int price;
    private String method;
    private String company;
}
