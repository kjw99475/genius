package org.fullstack4.genius.controller;

import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.PaymentDTO;
import org.fullstack4.genius.dto.ReviewDTO;
import org.fullstack4.genius.service.ReviewServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.HashMap;

@Log4j2
@Controller
@RequestMapping(value = "/review")
@RequiredArgsConstructor
public class ReviewController {
    private final ReviewServiceIf reviewServiceIf;
    @RequestMapping(value = "/regist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public String registPOST(@Valid ReviewDTO reviewDTO,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes,
                             Model model){
        log.info("================================");
        log.info("v >> registPOST()");
        log.info("v : " + reviewDTO.toString());
        log.info("================================");

//        if(bindingResult.hasErrors()){
//            log.info("Errors");
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            redirectAttributes.addFlashAttribute("reviewDTO",reviewDTO);
//
//
//            return "redirect:/book/view?book_code="+reviewDTO.getBook_code();
//        }
//        log.info("================================");
//        log.info("v >> registPOST()");
//        log.info("v : " + reviewDTO.toString());
//        log.info("================================");

        if(bindingResult.hasErrors()){
            log.info("Errors");
            redirectAttributes.addFlashAttribute("registOK", 0);
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
            return "redirect:/book/view?book_code=" + book_code;
        }
        else{
            redirectAttributes.addAttribute("deleteOK",0);
            return "/book/view?book_code=" + book_code;
        }
    }

//    @RequestMapping(value = "/regist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//    @ResponseBody
//    public String Regist(Model model , @RequestParam HashMap<String, Object> map,
//                         BindingResult bindingResult,
//                         RedirectAttributes redirectAttributes
//                         ){
//        HashMap<String, Object> resultMap = new HashMap<String, Object>();
//
//        log.info("=====================================================");
//        log.info("PaymentDTO : " + dto);
//        log.info("=====================================================");
//
//        if(result > 0) {
//            resultMap.put("result", "success");
//        }
//        else{
//            resultMap.put("result", "fail");
//        }
//
//        return new Gson().toJson(resultMap);
//    }
//
}
