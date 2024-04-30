package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/admin/member")
@RequiredArgsConstructor
public class AdminMemberController {
    private final MemberServiceIf memberServiceIf;
    @GetMapping("/memberList")
    public void GETMemberList(
            PageRequestDTO pageRequestDTO, Model model)
    {
        PageResponseDTO<MemberDTO> pageResponseDTO = memberServiceIf.list(pageRequestDTO);
        log.info("========================pageResponseDTO" + pageResponseDTO);
        model.addAttribute("pageResponseDTO", pageResponseDTO);
    }


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
