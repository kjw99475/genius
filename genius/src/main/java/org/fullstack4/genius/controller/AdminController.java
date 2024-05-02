package org.fullstack4.genius.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.StatisticsDTO;
import org.fullstack4.genius.service.AdminMainServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping(value="/admin")
@RequiredArgsConstructor
public class AdminController {
    private final AdminMainServiceIf adminMainServiceIf;

    @GetMapping("/admin")
    public void GETAdmin(Model model){
        StatisticsDTO summary = adminMainServiceIf.summary();
        Map<String, List<StatisticsDTO>> classMap = adminMainServiceIf.classRevenue();
        Map<String, List<StatisticsDTO>> subjectMap = adminMainServiceIf.subjectRevenue();
        model.addAttribute("classMap", classMap);
        model.addAttribute("subjectMap", subjectMap);
        model.addAttribute("summary", summary);
    }


}
