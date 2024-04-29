package org.fullstack4.genius.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.MainDTO;
import org.fullstack4.genius.service.MainServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/main")
public class MainController {
    private final MainServiceIf mainService;

    @GetMapping("/main")
    public void GETMain(Model model) {
        MainDTO mainDTO = mainService.mainView();
        model.addAttribute("mainDTO", mainDTO);
    }
}
