package org.fullstack4.genius.service;

import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.StatisticsDTO;

import java.util.List;
import java.util.Map;

public interface AdminMainServiceIf {
    StatisticsDTO summary();
    Map<String, List<StatisticsDTO>> classRevenue();
    Map<String, List<StatisticsDTO>> subjectRevenue();
    List<BookDTO> bestSeller();
}
