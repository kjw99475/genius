package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.service.BookServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping(value="/admin/book")
@RequiredArgsConstructor
public class AdminBookController {
    private final BookServiceIf bookServiceIf;
    @GetMapping("/payview")
    public void GETPayView(){

    }

    @GetMapping("/itemlist")
    public void GETItemList(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Model model){
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setPage_size(9);
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<BookDTO> responseDTO = bookServiceIf.BookListByPage(pageRequestDTO);

//        List<Map<String,String>> subjectList = bookServiceIf.bookSubjectCategoryList();
//        List<Map<String,String>> classList = bookServiceIf.bookClassCategoryList();
//        model.addAttribute("subjectList",subjectList);
//        model.addAttribute("classList",classList);
        model.addAttribute("responseDTO", responseDTO);
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
