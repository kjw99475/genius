package org.fullstack4.genius.controller.admin;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/admin/bbs")
@RequiredArgsConstructor
public class BbsController {

    @GetMapping("/list")
    public void GETList(){

    }

    @GetMapping("/contentRegist")
    public void GETContentRegist(){

    }

    @PostMapping("/contentRegist")
    public void POSTContentRegist(){

    }

    @GetMapping("/contentmodify")
    public void GETContentModify(){

    }

    @PostMapping("/contentmodify")
    public void POSTContentModify(){

    }

    @GetMapping("/questionRegist")
    public void GETQuestionRegist(){

    }

    @PostMapping("/questionRegist")
    public void POSTQuestionRegist(){

    }

    @GetMapping("/questionmodify")
    public void GETQuestionModify(){

    }

    @PostMapping("/questionmodify")
    public void POSTQuestionModify(){

    }

    @GetMapping("/modify")
    public void GETModify(){

    }

    @PostMapping("/view")
    public void GETView(){

    }

    @PostMapping("/view")
    public void POSTView(){

    }

}
