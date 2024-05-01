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
@RequestMapping(value="/admin/inventory")
@RequiredArgsConstructor
public class AdminInventoryController {
    private final BookServiceIf bookServiceIf;
    @GetMapping("/list")
    public void GETList(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Model model){
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<BookDTO> responseDTO = bookServiceIf.BookListByPage(pageRequestDTO);

        List<Map<String,String>> subjectList = bookServiceIf.bookSubjectCategoryList();
        List<Map<String,String>> classList = bookServiceIf.bookClassCategoryList();
        model.addAttribute("subjectList",subjectList);
        model.addAttribute("classList",classList);
        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/modify")
    public void GETModify(){

    }

    @PostMapping("/modify")
    public void POSTModify(){

    }
}
