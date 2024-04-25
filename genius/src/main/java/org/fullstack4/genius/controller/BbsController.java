package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping(value="/bbs")
@RequiredArgsConstructor
public class BbsController {

    @GetMapping("/noticeList")
    public void GETNoticeList() {

    }


    @GetMapping("/noticeView")
    public void GETNoticeView() {

    }

    @GetMapping("/qnaList")
    public void GETQnaList() {

    }

    @GetMapping("/qnaViewQ")
    public void GETQnaViewQ() {

    }

    @GetMapping("/qnaViewA")
    public void GETViewA() {

    }

    @GetMapping("/qnaRegistQ")
    public void GETQnaRegistQ() {

    }

    @PostMapping("/qnaRegistQ")
    public void POSTQnaRegistQ() {

    }

    @GetMapping("/faqList")
    public void FaqList() {

    }

    @GetMapping("/boardList")
    public void GETBoardList() {

    }

    @GetMapping("/boardView")
    public void GETBoardView() {

    }

    @GetMapping("/boardRegist")
    public void GETboardRegist() {

    }

    @PostMapping("/boardRegist")
    public void POSTboardRegist() {

    }
    @GetMapping("/boardModify")
    public void GETboardModify() {

    }

    @PostMapping("/boardModify")
    public void POSTboardModify() {

    }




    @RequestMapping(value="/fileUpload", method= RequestMethod.POST)
    public String fileUploadPOST(@RequestParam("file") MultipartFile file) {

        return "/bbs/fileUpload";
    }

    @RequestMapping(value="/fileUpload2", method= RequestMethod.POST)
    public String fileUpload2POST(MultipartHttpServletRequest files) {

        return "/bbs/fileUpload2";
    }
}
