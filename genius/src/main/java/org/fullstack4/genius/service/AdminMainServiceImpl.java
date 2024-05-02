package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.StatisticsDTO;
import org.fullstack4.genius.mapper.AdminMainMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class AdminMainServiceImpl implements AdminMainServiceIf {
    private final AdminMainMapper adminMainMapper;

    @Override
    public StatisticsDTO summary() {
        StatisticsDTO today = adminMainMapper.todaySummary();
        log.info("today : " + today);
        StatisticsDTO total = adminMainMapper.totalSummary();
        log.info("total : " + total);
        StatisticsDTO summary = StatisticsDTO.builder()
                .todayOrderCnt(today.getTodayOrderCnt())
                .todayOrderPrice(today.getTodayOrderPrice())
                .todayOrderMember(today.getTodayOrderMember())
                .totalOrderCnt(total.getTotalOrderCnt())
                .totalOrderPrice(total.getTotalOrderPrice())
                .totalOrderMember(total.getTotalOrderMember())
                .build();
        log.info("summary : " + summary);
        return summary;
    }
}
