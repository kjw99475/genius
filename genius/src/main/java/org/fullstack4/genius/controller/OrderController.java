package org.fullstack4.genius.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/order")
@RequiredArgsConstructor
public class OrderController {

    @GetMapping("/payment1")
    public void GETpayment1() {

    }

    @PostMapping("/payment1")
    public void POSTpayment1() {

    }

    @GetMapping("/payment2")
    public void GETpayment2() {

    }

    @PostMapping("/payment2")
    public void POSTpayment2() {

    }
}
