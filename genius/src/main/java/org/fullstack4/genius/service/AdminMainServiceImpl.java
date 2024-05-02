package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.StatisticsDTO;
import org.fullstack4.genius.mapper.AdminMainMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class AdminMainServiceImpl implements AdminMainServiceIf {
    private final AdminMainMapper adminMainMapper;
    private final ModelMapper modelMapper;

    @Override
    public StatisticsDTO summary() {
        StatisticsDTO today = adminMainMapper.todaySummary();
        StatisticsDTO total = adminMainMapper.totalSummary();
        StatisticsDTO summary = StatisticsDTO.builder()
                .todayOrderCnt(today.getTodayOrderCnt())
                .todayOrderPrice(today.getTodayOrderPrice())
                .todayOrderMember(today.getTodayOrderMember())
                .totalOrderCnt(total.getTotalOrderCnt())
                .totalOrderPrice(total.getTotalOrderPrice())
                .totalOrderMember(total.getTotalOrderMember())
                .build();
        return summary;
    }

    @Override
    public Map<String, List<StatisticsDTO>> classRevenue() {
        Map<String, List<StatisticsDTO>> classMap = new HashMap<>();
        List<StatisticsDTO> todayClass = adminMainMapper.todayClass();
        List<StatisticsDTO> totalClass = adminMainMapper.totalClass();
        classMap.put("todayClass", todayClass);
        classMap.put("totalClass", totalClass);
        return classMap;
    }

    @Override
    public Map<String, List<StatisticsDTO>> subjectRevenue() {
        Map<String, List<StatisticsDTO>> subjectMap = new HashMap<>();
        List<StatisticsDTO> todaySubject = adminMainMapper.todaySubject();
        List<StatisticsDTO> totalSubject = adminMainMapper.totalSubject();
        subjectMap.put("todaySubject", todaySubject);
        subjectMap.put("totalSubject", totalSubject);
        return subjectMap;
    }

    @Override
    public List<BookDTO> bestSeller() {
        List<BookVO> bookVOList = adminMainMapper.bestSeller();
        List<BookDTO> bookDTOList = null;
        if (bookVOList != null) {
            bookDTOList = bookVOList.stream().map(vo -> modelMapper.map(vo, BookDTO.class)).collect(Collectors.toList());
        }
        return bookDTOList;
    }
}
