package org.fullstack4.genius.controller;


import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.BookServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.*;

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
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<BookDTO> responseDTO = bookServiceIf.BookListByPage(pageRequestDTO);

        List<Map<String,String>> subjectList = bookServiceIf.bookSubjectCategoryList();
        List<Map<String,String>> classList = bookServiceIf.bookClassCategoryList();
        model.addAttribute("subjectList",subjectList);
        model.addAttribute("classList",classList);
        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/itemRegist")
    public void GETItemRegist(){

    }

    @PostMapping("/itemRegist")
    public String POSTItemRegist(@Valid BookDTO bookDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                                 HttpServletRequest request,
                                 @RequestParam("file") MultipartFile file,
                                 @RequestParam("videofile") MultipartFile videofile){


        if(bindingResult.hasErrors()){
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bookDTO",bookDTO);
            for (FieldError error : bindingResult.getFieldErrors()) {
                log.info("Field: " + error.getField() + ", Error: " + error.getDefaultMessage());
            }

            return "redirect:/admin/book/itemRegist";
        }
        FileDTO fileDTO = new FileDTO();
        log.info("=================이미지=================="+file.getSize());
        BookDTO OrgBookDTO = bookServiceIf.view(bookDTO.getBook_code());
        if(file.getSize() >0) {
            log.info("===================================");
            String uploadFolder =  CommonUtil.getUploadFolder(request, "book");
            fileDTO = FileDTO.builder()
                    .file(file)
                    .uploadFolder(uploadFolder)
                    .build();
        }else{
            bookDTO.setBook_img(OrgBookDTO.getBook_img());
        }

        log.info("=================비디오=================="+videofile.getSize());
        FileDTO fileDTO1 = new FileDTO();
        if(videofile.getSize()>0) {
            log.info("=================비디오==================");
            String uploadFolder1 = CommonUtil.getUploadFolder(request, "video");
            fileDTO1 = FileDTO.builder()
                    .file(videofile)
                    .uploadFolder(uploadFolder1)
                    .build();
        }else{
            bookDTO.setVideo(OrgBookDTO.getVideo());
        }

        bookDTO.setDiscount_price((int) (bookDTO.getPrice() - bookDTO.getPrice()* bookDTO.getDiscount_per()*0.01));

        int result = bookServiceIf.regist(bookDTO,fileDTO,fileDTO1);
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
    public String POSTItemModify(@Valid BookDTO bookDTO,
                                 BindingResult bindingResult,
                                 HttpServletRequest request,
                                 RedirectAttributes redirectAttributes,
                                 @RequestParam("file") MultipartFile file,
                                 @RequestParam("videofile") MultipartFile videofile,
                                 Model model){
        log.info("AdminBookController : POSTItemModify");

        if(bindingResult.hasErrors()){
            log.info(bookDTO.toString());
            log.info("AdminBookController >> POSTItemModify >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bookDTO",bookDTO);

            return "redirect:/admin/book/itemModify?book_code="+bookDTO.getBook_code();
        }
        BookDTO OrgBookDTO = bookServiceIf.view(bookDTO.getBook_code());
        FileDTO fileDTO = new FileDTO();
        log.info("=================이미지=================="+file.getSize());
        if(file.getSize() >0) {
            log.info("===================================");
            String uploadFolder =  CommonUtil.getUploadFolder(request, "book");
            fileDTO = FileDTO.builder()
                    .file(file)
                    .uploadFolder(uploadFolder)
                    .build();
        }else{
            bookDTO.setBook_img(OrgBookDTO.getBook_img());
        }

        log.info("=================비디오=================="+videofile.getSize());
        FileDTO fileDTO1 = new FileDTO();
        if(videofile.getSize()>0) {
            log.info("=================비디오==================");
            String uploadFolder1 = CommonUtil.getUploadFolder(request, "video");
            fileDTO1 = FileDTO.builder()
                    .file(videofile)
                    .uploadFolder(uploadFolder1)
                    .build();
        }else{
            bookDTO.setVideo(OrgBookDTO.getVideo());
        }

        bookDTO.setDiscount_price((int) (bookDTO.getPrice() - bookDTO.getPrice()* bookDTO.getDiscount_per()*0.01));
        int result = bookServiceIf.modify(bookDTO,fileDTO,fileDTO1);
        log.info("AdminBookController : POSTItemModify >> result : " + result);
        if(result >0){
            return "redirect:/admin/book/itemview?book_code="+bookDTO.getBook_code();
        }
        else{
            model.addAttribute("bookDTO", bookDTO);
            return "redirect:/admin/book/itemModify?book_code=" + bookDTO.getBook_code();
        }
    }

    @GetMapping("/delete")
    public void GETDelete(){

    }

    @PostMapping("/delete")
    public String POSTDelete(@RequestParam (name = "book_idx") int book_idx){
        int result = bookServiceIf.delete(book_idx);

        return "redirect:/admin/book/itemlist";
    }
}
