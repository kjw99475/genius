package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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
        pageRequestDTO.setPage_size(10);
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
    public void POSTContentRegist(){

    }

    @GetMapping("/view")
    public void GETView(){

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
    public void GETContentModify(){

    }

    @PostMapping("/contentmodify")
    public void POSTContentModify(){

    }


    @GetMapping("/modify")
    public void GETModify(){

    }



}
