package org.fullstack4.genius.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value = "/login")
@RequiredArgsConstructor
public class LoginController {

    @GetMapping("/login")
    public void GETLogin(){

    }

    @PostMapping("/login")
    public void POSTLogin(){

    }

    @GetMapping("/findId")
    public void GETFindId(){

    }

    @PostMapping("/findId")
    public void POSTFindId(){

    }

    @GetMapping("/findPwd")
    public void GETFindPwd(){

    }

    @PostMapping("/findPwd")
    public void POSTFindPwd(){

    }

    @GetMapping("/logout")
    public void LogOut(){

    }
}
