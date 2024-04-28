package org.fullstack4.genius.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Log4j2
@Controller
@RequestMapping(value="/order")
@RequiredArgsConstructor
public class OrderController {

    private final MemberServiceIf memberService;

    @GetMapping("/payment")
    public void GETpayment1(HttpServletRequest req, Model model) {
        HttpSession session = req.getSession();
        String member_id = (String) session.getAttribute("member_id");
        log.info("#########member_id##############"+member_id);
        MemberDTO dto = memberService.view(member_id);

        log.info("#######################"+dto.toString());
        model.addAttribute("memberdto", dto);
    }

    @PostMapping("/payment")
    public void POSTpayment1() {

    }


}
