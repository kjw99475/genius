package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.dto.StatisticsDTO;

import java.util.List;

@Mapper
public interface AdminMainMapper {
    StatisticsDTO todaySummary();
    StatisticsDTO totalSummary();
    List<StatisticsDTO> todayClass();
    List<StatisticsDTO> totalClass();
    List<StatisticsDTO> todaySubject();
    List<StatisticsDTO> totalSubject();
    List<BookVO> bestSeller();
    List<StatisticsDTO> dayTotalRevenue();
    List<StatisticsDTO> monthTotalRevenue();
    List<StatisticsDTO> yearTotalRevenue();
}
