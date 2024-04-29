package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.BookServiceIf;
import org.fullstack4.genius.service.QnaServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping(value="/bbs")
@RequiredArgsConstructor
public class BbsController {
    private final QnaServiceIf qnaServiceIf;

    @GetMapping("/noticeList")
    public void GETNoticeList() {

    }


    @GetMapping("/noticeView")
    public void GETNoticeView() {

    }

    @GetMapping("/qnaList")
    public void GETQnaList(@Valid PageRequestDTO pageRequestDTO,
                           BindingResult bindingResult,
                           RedirectAttributes redirectAttributes,
                           Model model) {
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        List<QnaDTO> qnaDTOList = qnaServiceIf.listAll();
        log.info(qnaDTOList);
//        pageRequestDTO.setPage_size(6);
//        pageRequestDTO.setPage_block_size(10);
//        PageResponseDTO<BookDTO> responseDTO = qnaServiceIf.BookListByPage(pageRequestDTO);

//        List<Map<String,String>> subjectList = bookServiceIf.bookSubjectCategoryList();
//        List<Map<String,String>> classList = bookServiceIf.bookClassCategoryList();
//        model.addAttribute("subjectList",subjectList);
//        model.addAttribute("classList",classList);
        model.addAttribute("qnaDTOList", qnaDTOList);
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
    public String POSTQnaRegistQ(@Valid QnaDTO qnaDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                               Model model) {
        if(bindingResult.hasErrors()){
            log.info("BookController >> list Error");
            redirectAttributes.addFlashAttribute("qnaDTO",qnaDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        log.info("========================");
        log.info("postQnaRegist >> qnaDTO" + qnaDTO);
        log.info("========================");
        int result = qnaServiceIf.regist(qnaDTO);

        if(result>0){
            return "redirect:/bbs/qnaList";
        }else{
            redirectAttributes.addFlashAttribute(qnaDTO);
            return "redirect:/bbs/qnaRegistQ";
        }

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
