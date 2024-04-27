package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/admin/faq")
@RequiredArgsConstructor
public class AdminFaqController {

    @GetMapping("/list")
    public void GETList(){

    }

    @GetMapping("/contentregist")
    public void GETContentRegist(){

    }

    @PostMapping("/contentregist")
    public void POSTContentRegist(){

    }

    @GetMapping("/contentmodify")
    public void GETContentModify(){

    }

    @PostMapping("/contentmodify")
    public void POSTContentModify(){

    }

    @GetMapping("/view")
    public void GETView(){

    }

    @PostMapping("/view")
    public void POSTView(){

    }

}
