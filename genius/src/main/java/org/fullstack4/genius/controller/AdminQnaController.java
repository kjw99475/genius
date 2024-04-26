package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/admin/qna")
@RequiredArgsConstructor
public class AdminQnaController {

    @GetMapping("/list")
    public void GETList(){

    }
    @GetMapping("/contentQuestion")
    public void GETContentQuestion(){

    }

    @PostMapping("/contentQuestion")
    public void POSTContentQuestion(){

    }

    @GetMapping("/contentregist")
    public void GETContentRegist(){

    }

    @PostMapping("/contentregist")
    public void POSTContentRegist(){

    }

    @GetMapping("/view")
    public void GETView(){

    }

    @PostMapping("/view")
    public void POSTView(){

    }


    @GetMapping("/modifyQuestion")
    public void GETModifyQuestion(){

    }

    @PostMapping("/modifyQuestion")
    public void POSTModifyQuestion(){

    }
    @GetMapping("/contentmodify")
    public void GETContentModify(){

    }

    @PostMapping("/contentmodify")
    public void POSTContentModify(){

    }


    @GetMapping("/modify")
    public void GETModify(){

    }



}
