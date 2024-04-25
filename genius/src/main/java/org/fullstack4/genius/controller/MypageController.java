package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/mypage")
@RequiredArgsConstructor
public class MypageController {

    @GetMapping("/mypage")
    public void GETMypage(){

    }

    @PostMapping("/mypage")
    public void POSTMypage(){

    }

    @GetMapping("/question")
    public void GETQuestion(){

    }

    @PostMapping("/question")
    public void POSTQuestion(){

    }

    @GetMapping("/payhistory")
    public void GETPayhistory(){

    }

    @PostMapping("/payhistory")
    public void POSTPayhistory(){

    }

}
