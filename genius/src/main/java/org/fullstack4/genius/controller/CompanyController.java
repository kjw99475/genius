package org.fullstack4.genius.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/company")
@RequiredArgsConstructor
public class CompanyController {

    @GetMapping("/map")
    public void map(){}
    @GetMapping("/introduce")
    public void introduce(){}
    @GetMapping("/history")
    public void history(){}

}