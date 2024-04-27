package org.fullstack4.genius.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.ReviewDTO;
import org.fullstack4.genius.service.ReviewServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping(value = "/review")
@RequiredArgsConstructor
public class ReviewController {
    private final ReviewServiceIf reviewServiceIf;
    @PostMapping("/regist")
    public String registPOST(@Valid ReviewDTO reviewDTO,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes,
                             Model model){
        log.info("================================");
        log.info("v >> registPOST()");
        log.info("v : " + reviewDTO.toString());
        log.info("================================");

        if(bindingResult.hasErrors()){
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("reviewDTO",reviewDTO);


            return "redirect:/book/view?book_code="+reviewDTO.getBook_code();
        }


        int result = reviewServiceIf.regist(reviewDTO);
        redirectAttributes.addAttribute("registOK", 1);

        return "redirect:/book/view?book_code="+reviewDTO.getBook_code();
    }
    @PostMapping("/delete")
    public String deletePOST(@RequestParam(name="review_idx", defaultValue = "0") int idx,
                             @RequestParam(name = "book_code") String book_code,
                             RedirectAttributes redirectAttributes,
                             Model model){

        int result = reviewServiceIf.delete(idx, book_code);
        if(result >0){
            redirectAttributes.addAttribute("deleteOK",1);
            return "redirect:/book/view?book_code=" + book_code + "#review-tab";
        }
        else{
            redirectAttributes.addAttribute("deleteOK",0);
            return "/book/view?book_code=" + book_code;
        }
    }

}
