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
import org.springframework.web.bind.annotation.RequestParam;
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
    public String POSTItemRegist(@Valid BookDTO bookDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes){
        if(bindingResult.hasErrors()){
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bookDTO",bookDTO);

            return "redirect:/admin/book/itemRegist";
        }
        log.info("adminBookController : contents :" + bookDTO.getContents());
        int result = bookServiceIf.regist(bookDTO);
        if(result > 0){
            return "redirect:/admin/book/itemlist";
        } else {
            return "/admin/book/itemRegist";
        }

    }

    @GetMapping("/itemview")
    public void GETItemView(@RequestParam(name="book_code", defaultValue = "b0001") String book_code,
                            Model model){
        BookDTO bookDTO = bookServiceIf.view(book_code);
        model.addAttribute("bookDTO", bookDTO);
    }

    @GetMapping("/itemModify")
    public void GETItemModify(@RequestParam(name="book_code", defaultValue = "b0001") String book_code,
                              Model model){
        BookDTO bookDTO = bookServiceIf.view(book_code);
        List<Map<String,String>> subjectList = bookServiceIf.bookSubjectCategoryList();
        List<Map<String,String>> classList = bookServiceIf.bookClassCategoryList();
        model.addAttribute("subjectList",subjectList);
        model.addAttribute("classList",classList);

        model.addAttribute("bookDTO", bookDTO);
    }

    @PostMapping("/itemModify")
    public String POSTItemModify(@Valid BookDTO bookDTO, Model model){
        int result = bookServiceIf.modify(bookDTO);
        if(result >0){
            return "redirect:/admin/book/itemview?book_code="+bookDTO.getBook_code();
        }
        else{
            model.addAttribute("bookDTO", bookDTO);
            return "/admin/book/itemModify?book_code=" + bookDTO.getBook_code();
        }
    }

    @GetMapping("/delete")
    public void GETDelete(){

    }

    @PostMapping("/delete")
    public void POSTDelete(){

    }
}
