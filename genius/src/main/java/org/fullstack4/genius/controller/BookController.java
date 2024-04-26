package org.fullstack4.genius.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.dto.ReviewDTO;
import org.fullstack4.genius.service.BookServiceIf;
import org.fullstack4.genius.service.ReviewServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping(value="/book")
@RequiredArgsConstructor
public class BookController {
    private final BookServiceIf bookServiceIf;
    private final ReviewServiceIf reviewServiceIf;
    @GetMapping(value = "list")
    public void book(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Model model) {
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setPage_size(9);
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<BookDTO> responseDTO = bookServiceIf.BookListByPage(pageRequestDTO);

        List<Map<String,String>> subjectList = bookServiceIf.bookSubjectCategoryList();
        List<Map<String,String>> classList = bookServiceIf.bookClassCategoryList();
        model.addAttribute("subjectList",subjectList);
        model.addAttribute("classList",classList);
        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/view")
    public void GETView(@RequestParam(name="idx", defaultValue = "0") int idx,
            Model model){
        log.info("BookController >> view()");
        BookDTO bookDTO = bookServiceIf.view(idx);
        List<ReviewDTO> reviewDTOList = reviewServiceIf.listAll(bookDTO.getBook_code());
        int[] rank_arr = {0,0,0,0,0,0};
        for(ReviewDTO dto :reviewDTOList){
            rank_arr[dto.getRank()]++;
        }
        String rank_str = Arrays.toString(rank_arr);
        rank_str = rank_str.substring(1, rank_str.length()-1);
        log.info("====================");
        log.info(rank_str);
        log.info("====================");
        model.addAttribute("rank_arr", rank_arr);
        model.addAttribute("reviewList", reviewDTOList);
        model.addAttribute("bookDTO", bookDTO);
    }

    @PostMapping("/view")
    public void POSTView(){

    }
}
