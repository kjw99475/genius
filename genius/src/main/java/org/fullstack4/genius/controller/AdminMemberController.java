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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping(value="/admin/member")
@RequiredArgsConstructor
public class AdminMemberController {
    private final MemberServiceIf memberServiceIf;
    @GetMapping("/memberList")
    public void GETMemberList(
            PageRequestDTO pageRequestDTO,
            HttpServletRequest request,
            Model model)
    {
        log.info("GETMemberList==================pageRequestDTO" + pageRequestDTO);
        PageResponseDTO<MemberDTO> pageResponseDTO = memberServiceIf.list(pageRequestDTO);
        model.addAttribute("pageResponseDTO", pageResponseDTO);
    }


    @GetMapping("/memberView")
    public void GETMemberView(
            @RequestParam(name = "member_id", defaultValue = "") String member_id,
            Model model
            ){
        MemberDTO memberDTO = memberServiceIf.view(member_id);
        model.addAttribute("memberDTO", memberDTO);

    }

    @PostMapping("/memberModify")
    public void GETMemberModify(){

    }

    @PostMapping("/memberLeave")
    public String POSTMemberDelete(PageRequestDTO pageRequestDTO,
                                  @RequestParam(name = "target", defaultValue = "") String target,
                                  RedirectAttributes redirectAttributes){
        int result = memberServiceIf.leave(target);
        log.info("POSTMemberDelete==================target   :    " + target);
        if (result > 0) {
            log.info("POSTMemberDelete==================와 성공!");
        } else {
            log.info("POSTMemberDelete==================와 실패!");
        }
        redirectAttributes.addFlashAttribute("pageRequestDTO", pageRequestDTO);
        return "redirect:/admin/member/memberList";
    }
}
