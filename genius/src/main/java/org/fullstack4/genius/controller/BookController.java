package org.fullstack4.genius.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/book")
@RequiredArgsConstructor
public class BookController {
    @GetMapping(value = "list")
    public void book() {}

    @GetMapping("/view")
    public void GETView(){

    }

    @PostMapping("/view")
    public void POSTView(){

    }
}
