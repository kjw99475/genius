package org.fullstack4.genius.controller.admin;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/admin/member")
@RequiredArgsConstructor
public class MemberController {

    @GetMapping("/memberView")
    public void GETMemberView(){

    }

    @PostMapping("/memberModify")
    public void GETMemberModify(){

    }

    @PostMapping("/memberDelete")
    public void GETMemberDelete(){

    }
}
