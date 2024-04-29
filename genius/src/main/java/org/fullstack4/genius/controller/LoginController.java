package org.fullstack4.genius.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Log4j2
@Controller
@RequestMapping(value = "/login")
@RequiredArgsConstructor
public class LoginController {
    private final MemberServiceIf memberServiceIf;

    @GetMapping("/login")
    public void GETLogin(){
    }

    @PostMapping("/login")
    public String POSTLogin(
            @RequestParam(name = "member_id", defaultValue = "") String member_id,
            @RequestParam(name = "pwd", defaultValue = "") String pwd,
            @RequestParam(name = "auto_login", defaultValue = "") String auto_login,
            @RequestParam(name = "acc_url", defaultValue = "/") String acc_url,
            RedirectAttributes redirectAttributes,
            HttpServletResponse response,
            HttpServletRequest request
    ){
        log.info("---------------------");
        log.info("LoginController => POSTLogin()");
        log.info("---------------------");
        if(member_id.equals("") || pwd.equals("")) {
            log.info("LoginController > POSTLogin() : 로그인 정보에 빈 문자열 들어옴.");
            redirectAttributes.addFlashAttribute("loginErr", "로그인 정보를 확인해주세요.");
            return "redirect:/login/login";
        }
        MemberDTO loginDTO = memberServiceIf.login(member_id, pwd);
        if (loginDTO != null) {
            if (auto_login.equals("on")) {
                Cookie cookie = new Cookie("auto_login", loginDTO.getMember_id());
                cookie.setPath("/");
                cookie.setMaxAge(999999);
                response.addCookie(cookie);
            }
            log.info("loginDTO" + loginDTO);
            HttpSession session = request.getSession();
            session.setAttribute("member_id", loginDTO.getMember_id());
            session.setAttribute("admin_YN", loginDTO.getAdmin_YN());
            return "redirect:"+acc_url;
        }
        redirectAttributes.addFlashAttribute("loginErr", "로그인 정보를 확인해주세요.");
        return "redirect:/login/login";
    }

    @PostMapping("/logout")
    public String LogOut(
            @RequestParam(name = "member_id", defaultValue = "") String member_id,
            HttpServletResponse response,
            HttpServletRequest request
    ){
        log.info("---------------------");
        log.info("LoginController => logout()");
        log.info("---------------------");
        HttpSession session = request.getSession();
        session.invalidate();
        Cookie cookie = new Cookie("auto_login", "");
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return "/login/login";
    }

    @GetMapping("/findId")
    public void GETFindId(){

    }

    @PostMapping("/findId")
    public String POSTFindId(MemberDTO memberDTO,
                          RedirectAttributes redirectAttributes){
        log.info("---------------------");
        log.info("LoginController => POSTFindId()");
        String member_id = memberServiceIf.findId(memberDTO);
        log.info("---------------------");
        if (member_id != null) {
            redirectAttributes.addAttribute("member_id", member_id);
            redirectAttributes.addAttribute("type", "findId");
            return "redirect:/login/findResult";
        } else {
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            redirectAttributes.addFlashAttribute("Err", "없는 회원 입니다.");
            return "redirect:/login/findId";
        }
    }



    @GetMapping("/findPwd")
    public String GETFindPwd(@RequestParam(name = "type", defaultValue = "1") String type){
        if(type.equals("2")) {
            return "/login/findPwd2";
        } else {
            return "/login/findPwd1";
        }
    }

    @PostMapping("/findPwd")
    public String POSTFindPwd(MemberDTO memberDTO,
                              RedirectAttributes redirectAttributes){
        log.info("---------------------");
        log.info("LoginController => POSTFindPwd()");
        String member_id = memberServiceIf.findPwd(memberDTO);
        log.info("---------------------");
        if (member_id != null) {
            redirectAttributes.addAttribute("member_id", member_id);
            redirectAttributes.addAttribute("type", "2");
            return "redirect:/login/findPwd";
        } else {
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            redirectAttributes.addFlashAttribute("Err", "없는 회원 입니다.");
            return "redirect:/login/findPwd";
        }
    }

    @PostMapping("/changePwd")
    public String POSTChangePwd(MemberDTO memberDTO,
                              RedirectAttributes redirectAttributes){
        log.info("---------------------");
        log.info("LoginController => POSTChangePwd()");
        int result = memberServiceIf.changePwd(memberDTO);
        log.info("---------------------");
        if (result > 0) {
            redirectAttributes.addAttribute("type", "findPwd");
            return "redirect:/login/findResult";
        } else {
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            redirectAttributes.addFlashAttribute("Err", "비밀번호 변경 실패");
            return "redirect:/login/findPwd";
        }
    }

    @GetMapping("/findResult")
    public void GETFindResult() {}

    @GetMapping("/naver")
    public String GETNaverLogin(HttpServletRequest request,
                                RedirectAttributes redirectAttributes) {
        MemberDTO memberDTO = memberServiceIf.naver(request);
        if (memberDTO != null) {
            HttpSession session = request.getSession();
            session.setAttribute("member_id", memberDTO.getMember_id());
            session.setAttribute("admin_YN", "N");
            return "redirect:/login/login";
        }
        redirectAttributes.addFlashAttribute("loginErr", "로그인 정보를 확인해주세요.");
        return "redirect:/login/login";
    }
}
