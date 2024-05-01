package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.dto.QnaDTO;
import org.fullstack4.genius.service.QnaServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/admin/qna")
@RequiredArgsConstructor
public class AdminQnaController {
    final QnaServiceIf qnaService;
    @GetMapping("/list")
    public void GETList(@Valid PageRequestDTO pageRequestDTO,
                        BindingResult bindingResult,
                        RedirectAttributes redirectAttributes,
                        Model model){
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<QnaDTO> responseDTO = qnaService.qnaListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }
    @GetMapping("/contentQuestion")
    public void GETContentQuestion(){

    }

    @PostMapping("/contentQuestion")
    public void POSTContentQuestion(){

    }

    @GetMapping("/contentregist")
    public void GETContentRegist(){

    }

    @PostMapping("/contentregist")
    public void POSTContentRegist(@Valid QnaDTO qnaDTO,
                                  BindingResult bindingResult,
                                  RedirectAttributes redirectAttributes){

    }

    @GetMapping("/view")
    public void GETView(@RequestParam(name = "qna_idx")int qna_idx,
                        Model model){
        QnaDTO qnaDTO = qnaService.view(qna_idx);
        List<QnaDTO> qnaDTOList = qnaService.listAll();
        QnaDTO prevDTO = null;
        QnaDTO nextDTO = null;
        int listIdx = 0;
        for(QnaDTO dto : qnaDTOList){
            if(dto.getQna_idx()==qna_idx && listIdx != qnaDTOList.size()-1){
                prevDTO = qnaDTOList.get(listIdx+1);
            }
            if (dto.getQna_idx()==qna_idx && listIdx != 0){
                nextDTO = qnaDTOList.get(listIdx-1);
            }
            listIdx++;
        }
        model.addAttribute("prevDTO", prevDTO);
        model.addAttribute("nextDTO", nextDTO);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/view")
    public void POSTView(){

    }


    @GetMapping("/modifyQuestion")
    public void GETModifyQuestion(){

    }

    @PostMapping("/modifyQuestion")
    public void POSTModifyQuestion(){

    }
    @GetMapping("/contentmodify")
    public void GETContentModify(@RequestParam(name = "qna_idx")int qna_idx,
                                 Model model){
        QnaDTO qnaDTO = qnaService.view(qna_idx);

        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/contentmodify")
    public String POSTContentModify(QnaDTO qnaDTO,
                                  BindingResult bindingResult,
                                  RedirectAttributes redirectAttributes){
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/admin/qna/contentmodify?qna_idx="+qnaDTO.getQna_idx();
        }
        int result = qnaService.modify(qnaDTO);
        log.info("AdminBookController : POSTItemModify >> result : " + result);
        if(result >0){
            return "redirect:/admin/qna/view?qna_idx="+qnaDTO.getQna_idx();
        }
        else{
            return "redirect:/admin/qna/contentmodify?qna_idx="+qnaDTO.getQna_idx();
        }
    }


    @GetMapping("/modify")
    public void GETModify(){

    }
    @PostMapping("delete")
    public String GETDelete(HttpServletRequest req){
        String[] del = req.getParameterValues("del_chk");
        if(del !=null){
            for(int i=0;i<del.length;i++){
                qnaService.delete(Integer.parseInt(del[i]));
            }
        }

        return "redirect:/admin/qna/list";
    }



}
