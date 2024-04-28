package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.BbsDTO;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.service.BbsServiceIf;
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

@Log4j2
@Controller
@RequestMapping(value="/admin/bbs")
@RequiredArgsConstructor
public class AdminBbsController {
    public final BbsServiceIf bbsServiceIf;


    @GetMapping("/bbsList")
    public void GETList(@Valid PageRequestDTO pageRequestDTO
                        , BindingResult bindingResult
                        , RedirectAttributes redirectAttributes
                        , Model model){
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setPage_size(9);
        pageRequestDTO.setPage_block_size(10);
        //PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.BbsListByPage(pageRequestDTO);

        List<BbsDTO> bbsDTOList = bbsServiceIf.listAll();
        model.addAttribute("bbsDTOList", bbsDTOList);
    }

    @GetMapping("/contentregist")
    public void GETContentRegist(BbsDTO bbsDTO
                                , BindingResult bindingResult
                                , RedirectAttributes redirectAttributes){


    }

    @PostMapping("/contentregist")
    public String POSTContentRegist(BbsDTO bbsDTO
                                  , BindingResult bindingResult
                                  , RedirectAttributes redirectAttributes){
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        int result = bbsServiceIf.regist(bbsDTO);
        if(result > 0) {
            log.info("등록 성공 ===============");
            return "redirect:/admin/bbs/bbsList";
        } else {
            log.info("등록 실패 ===============");
            return "redirect:/admin/bbs/contentregist";
        }
    }

    @GetMapping("/contentmodify")
    public void GETContentModify(int bbs_idx
                                , Model model){
        BbsDTO bbsDTO = bbsServiceIf.view(bbs_idx);
        model.addAttribute("bbsDTO", bbsDTO);
    }

    @PostMapping("/contentmodify")
    public String POSTContentModify(BbsDTO bbsDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes){
        int result = bbsServiceIf.modify(bbsDTO);
        if(result > 0) {
            log.info("수정 성공==============");
            return "redirect:/admin/bbs/view?bbs_idx=" +bbsDTO.getBbs_idx();
        } else {
            log.info("수정 실패==============");
            return "redirect:/admin/bbs/contentmodify?bbs_idx=" + bbsDTO.getBbs_idx();
        }
    }

    @GetMapping("/view")
    public void GETView(int bbs_idx
                        , Model model) {
        BbsDTO bbsDTO = bbsServiceIf.view(bbs_idx);
        model.addAttribute("bbsDTO", bbsDTO);
    }

    @PostMapping("/view")
    public void POSTView(){

    }

    @PostMapping("/delete")
    public String POSTDelete(int bbs_idx) {
        int result = bbsServiceIf.delete(bbs_idx);
        if(result > 0) {
            log.info("삭제 성공 >> " + bbs_idx);
            return "redirect:/admin/bbs/bbsList";
        } else {
            log.info("삭제 실패 >> " + bbs_idx);
            return "redirect:/admin/bbs/view?bbs_idx=" + bbs_idx;
        }
    }

}
