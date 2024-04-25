package org.fullstack4.genius.controller.admin;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/admin/book")
@RequiredArgsConstructor
public class BookController {

    @GetMapping("/payview")
    public void GETPayView(){

    }

    @GetMapping("/itemlist")
    public void GETItemList(){

    }

    @GetMapping("/itemRegist")
    public void GETItemRegist(){

    }

    @PostMapping("/itemRegist")
    public void POSTItemRegist(){

    }

    @GetMapping("/itemview")
    public void GETItemView(){

    }

    @GetMapping("/itemModify")
    public void GETItemModify(){

    }

    @PostMapping("/itemModify")
    public void POSTItemModify(){

    }
}
