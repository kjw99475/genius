package org.fullstack4.genius.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class StatisticsDTO {
    private String todayOrderCnt;
    private String todayOrderPrice;
    private String todayOrderMember;
    private String totalOrderCnt;
    private String totalOrderPrice;
    private String totalOrderMember;
}
