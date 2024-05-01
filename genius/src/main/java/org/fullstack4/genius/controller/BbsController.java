package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.BbsServiceIf;
import org.fullstack4.genius.service.BookServiceIf;
import org.fullstack4.genius.service.QnaServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping(value="/bbs")
@RequiredArgsConstructor
public class BbsController {
    private final QnaServiceIf qnaServiceIf;
    private final BbsServiceIf bbsServiceIf;

    @GetMapping("/noticeList")
    public void GETNoticeList(@Valid PageRequestDTO pageRequestDTO,
                              BindingResult bindingResult,
                              RedirectAttributes redirectAttributes,
                              Model model
    ) {
        String category_code = "bc02";
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
//        pageRequestDTO.setPage_size(page_size);
        pageRequestDTO.setPage_block_size(10);
        pageRequestDTO.setCategory_code(category_code);

        PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }


    @GetMapping("/noticeView")
    public void GETNoticeView(@RequestParam(name="bbs_idx") int bbs_idx,
                              Model model
    ) {
        String category_code = "bc02";

        int readCnt = bbsServiceIf.readCount(bbs_idx);
        BbsDTO bbsDTO = bbsServiceIf.view(bbs_idx);
        BbsDTO prebbsDTO = bbsServiceIf.preView(bbs_idx, category_code);
        BbsDTO postbbsDTO = bbsServiceIf.postView(bbs_idx, category_code);

        model.addAttribute("bbsDTO", bbsDTO);
        model.addAttribute("prebbsDTO", prebbsDTO);
        model.addAttribute("postbbsDTO", postbbsDTO);
    }

    @GetMapping("/qnaList")
    public void GETQnaList(@Valid PageRequestDTO pageRequestDTO,
                           BindingResult bindingResult,
                           RedirectAttributes redirectAttributes,
                           Model model) {
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        List<QnaDTO> qnaDTOList = qnaServiceIf.listAll();
        log.info(qnaDTOList);
        pageRequestDTO.setPage_size(10);
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<QnaDTO> responseDTO = qnaServiceIf.qnaListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }
    @GetMapping("/qnaViewQ")
    public void GETQnaViewQ(@RequestParam(name="qna_idx") int qna_idx,
                            Model model) {
        QnaDTO qnaDTO = qnaServiceIf.view(qna_idx);
        log.info("bbsController >> qnaview >> " + qnaDTO);
        List<QnaDTO> qnaDTOList = qnaServiceIf.listAll();
        QnaDTO prevDTO = null;
        QnaDTO nextDTO = null;
        int listIdx = 0;
        int readCnt = qnaServiceIf.readCount(qna_idx);
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

    @GetMapping("/qnaViewA")
    public void GETViewA(@RequestParam(name="qna_idx") int qna_idx,
                         Model model) {
        QnaDTO qnaDTO = qnaServiceIf.view(qna_idx);

        log.info("bbsController >> qnaview >> " + qnaDTO);
        List<QnaDTO> qnaDTOList = qnaServiceIf.listAll();
        QnaDTO prevDTO = null;
        QnaDTO nextDTO = null;
        int listIdx = 0;
        int readCnt = qnaServiceIf.readCount(qna_idx);
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

    @GetMapping("/qnaRegistQ")
    public void GETQnaRegistQ() {

    }

    @PostMapping("/qnaRegistQ")
    public String POSTQnaRegistQ(@Valid QnaDTO qnaDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                               Model model) {
        if(bindingResult.hasErrors()){
            log.info("BookController >> list Error");
            redirectAttributes.addFlashAttribute("qnaDTO",qnaDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        log.info("========================");
        log.info("postQnaRegist >> qnaDTO" + qnaDTO);
        log.info("========================");
        int result = qnaServiceIf.regist(qnaDTO);

        if(result>0){
            return "redirect:/bbs/qnaList";
        }else{
            redirectAttributes.addFlashAttribute(qnaDTO);
            return "redirect:/bbs/qnaRegistQ";
        }

    }
    @GetMapping("/qnaModifytQ")
    public void GETQnaModifytQ(@RequestParam(name="qna_idx") int qna_idx,
                               Model model) {
        QnaDTO qnaDTO = qnaServiceIf.view(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/qnaModifytQ")
    public String POSTQnaModifyQ(@Valid QnaDTO qnaDTO,
                                 BindingResult bindingResult,
                                 RedirectAttributes redirectAttributes,
                                 Model model) {
        if(bindingResult.hasErrors()){
            log.info("BookController >> list Error");
            redirectAttributes.addFlashAttribute("qnaDTO",qnaDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        log.info("========================");
        log.info("postQnaModify >> qnaDTO" + qnaDTO);
        log.info("========================");
        int result = qnaServiceIf.modify(qnaDTO);

        if(result>0){
            return "redirect:/bbs/qnaViewQ?qna_idx="+ qnaDTO.getQna_idx();
        }else{
            redirectAttributes.addFlashAttribute("qnaDTO",qnaDTO);
            return "redirect:/bbs/qnaModifytQ?qna_idx="+qnaDTO.getQna_idx();
        }
    }
    @PostMapping("qnaDelete")
    public String qnaDelete(@RequestParam(name="qna_idx") int qna_idx,
                            Model model){
        int result = qnaServiceIf.delete(qna_idx);
        if(result>0){
            return "redirect:/bbs/qnaList";
        } else {
            return "redirect:/bbs/qnaViewQ?qna_idx=" + qna_idx;
        }
    }

    @GetMapping("/faqList")
    public void FaqList(@Valid PageRequestDTO pageRequestDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
            , Model model
    ) {
        String category_code = "bc03";
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
//        pageRequestDTO.setPage_size(page_size);
        pageRequestDTO.setPage_block_size(10);
        pageRequestDTO.setCategory_code(category_code);

        PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/boardList")
    public void GETBoardList(@Valid PageRequestDTO pageRequestDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
            , Model model
    ) {
        String category_code = "bc01";
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
//        pageRequestDTO.setPage_size(page_size);
        pageRequestDTO.setPage_block_size(10);
        pageRequestDTO.setCategory_code(category_code);

        PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/boardView")
    public void GETBoardView(int bbs_idx
            , Model model
    ) {
        String category_code = "bc01";

        int readCnt = bbsServiceIf.readCount(bbs_idx);
        BbsDTO bbsDTO = bbsServiceIf.view(bbs_idx);
        BbsDTO prebbsDTO = bbsServiceIf.preView(bbs_idx, category_code);
        BbsDTO postbbsDTO = bbsServiceIf.postView(bbs_idx, category_code);

        model.addAttribute("bbsDTO", bbsDTO);
        model.addAttribute("prebbsDTO", prebbsDTO);
        model.addAttribute("postbbsDTO", postbbsDTO);

    }

    @GetMapping("/boardRegist")
    public void GETboardRegist(BbsDTO bbsDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
    ) {

    }

    @PostMapping("/boardRegist")
    public String POSTboardRegist(BbsDTO bbsDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
    ) {
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        int result = bbsServiceIf.regist(bbsDTO);
        if(result > 0) {
            log.info("등록 성공 ===============");
            return "redirect:/bbs/boardList";
        } else {
            log.info("등록 실패 ===============");
            return "redirect:/bbs/boardRegist";
        }
    }
    @GetMapping("/boardModify")
    public void GETboardModify(int bbs_idx
            , Model model){
        BbsDTO bbsDTO = bbsServiceIf.view(bbs_idx);
        model.addAttribute("bbsDTO", bbsDTO);
    }

    @PostMapping("/boardModify")
    public String POSTboardModify(BbsDTO bbsDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes){
        int result = bbsServiceIf.modify(bbsDTO);
        if(result > 0) {
            log.info("수정 성공==============");
            return "redirect:/bbs/boardView?bbs_idx=" +bbsDTO.getBbs_idx();
        } else {
            log.info("수정 실패==============");
            return "redirect:/bbs/boardModify?bbs_idx=" + bbsDTO.getBbs_idx();
        }
    }
    @PostMapping("/boardDelete")
    public String boardDelete(int bbs_idx) {
        int result = bbsServiceIf.delete(bbs_idx);
        if(result > 0) {
            log.info("삭제 성공 >> " + bbs_idx);
            return "redirect:/bbs/boardList";
        } else {
            log.info("삭제 실패 >> " + bbs_idx);
            return "redirect:/bbs/boardView?bbs_idx=" + bbs_idx;
        }
    }




    @RequestMapping(value="/fileUpload", method= RequestMethod.POST)
    public String fileUploadPOST(@RequestParam("file") MultipartFile file) {

        return "/bbs/fileUpload";
    }

    @RequestMapping(value="/fileUpload2", method= RequestMethod.POST)
    public String fileUpload2POST(MultipartHttpServletRequest files) {

        return "/bbs/fileUpload2";
    }
}
