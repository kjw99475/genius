package org.fullstack4.genius.controller;


import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;
import org.fullstack4.genius.Common.CookieUtil;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.service.MemberServiceIf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

@Log4j2
@Controller
@RequestMapping(value="/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberServiceIf memberService;

    @GetMapping("/join")
    public void GETJoin(){

    }

    @PostMapping("/join")
    public String POSTJoin(MemberDTO memberDTO,
                         RedirectAttributes redirectAttributes){
        log.info("============================");
        log.info("MemberController > POSTJoin");
        log.info("============================");
        int result = memberService.join(memberDTO);
        if (result > 0) {
            log.info("-----------회원가입 성공 > memberDTO" + memberDTO);
            redirectAttributes.addAttribute("member_name", memberDTO.getMember_name());
            return "redirect:/member/complete";
        } else {
            log.info("-----------회원가입 실패 > memberDTO" + memberDTO);
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            return "redirect:/member/join";
        }
    }

    @GetMapping("/complete")
    public void GETComplete(){

    }


    @RequestMapping(value = "/viewMember.dox", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String viewMember(Model model , @RequestParam(name = "member_id")String member_id){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        MemberDTO dto = memberService.view(member_id);
        resultMap.put("dto", dto);
        	// 갯수 세기
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/leave")
    public String leave(HttpServletRequest request,
                        HttpServletResponse response,
                        RedirectAttributes redirectAttributes) {
        HttpSession session = request.getSession();
        String member_id = CommonUtil.parseString(session.getAttribute("member_id"));
        int result = memberService.leave(member_id);
        if(result > 0) {
            session.invalidate();
            CookieUtil.setDeleteCookie(response, "auto_login");
            return "redirect:/mypage/mypage";
        } else {
            redirectAttributes.addFlashAttribute("err", "회원 탈퇴 실패");
            return "redirect:/mypage/mypage";
        }
    }
    @PostMapping("/idCheck")
    @ResponseBody
    public void idCheck(@RequestParam(name = "member_id", defaultValue = "") String member_id,
                          HttpServletResponse response) throws IOException {
        log.info("---------------------");
        log.info("MemberController => idCheck()");

        int result = (int) memberService.idCheck(member_id);
        log.info("result : " + result);
        response.setContentType("application/text; charset=utf-8");
        response.getWriter().print(result);
        log.info("---------------------");
    }

    @PostMapping("/emailCheck")
    @ResponseBody
    public void emailCheck(@RequestParam(name = "email", defaultValue = "") String email,
                          HttpServletResponse response) throws IOException {
        log.info("---------------------");
        log.info("MemberController => emailCheck()");

        int result = (int) memberService.emailCheck(email);
        log.info("result : " + result);
        response.setContentType("application/text; charset=utf-8");
        response.getWriter().print(result);
        log.info("---------------------");
    }

}
