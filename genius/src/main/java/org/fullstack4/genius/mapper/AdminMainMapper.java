package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.dto.StatisticsDTO;

@Mapper
public interface AdminMainMapper {
    StatisticsDTO todaySummary();
    StatisticsDTO totalSummary();
}
