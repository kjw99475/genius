package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;
import org.fullstack4.genius.Common.FileUtil;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.BbsServiceIf;
import org.fullstack4.genius.service.BookServiceIf;
import org.fullstack4.genius.service.QnaFileServiceIf;
import org.fullstack4.genius.service.QnaServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
    private final QnaFileServiceIf qnaFileServiceIf;

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
        if(qnaDTO.getFileYN().equals("Y")){
            List<QnaFileDTO> fileDTOList = qnaFileServiceIf.getFileList(qnaDTO.getQna_idx());
            log.info(fileDTOList);
            model.addAttribute("fileList", fileDTOList);
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
        if(qnaDTO.getFileYN().equals("Y")){
            List<QnaFileDTO> fileDTOList = qnaFileServiceIf.getFileList(qnaDTO.getQna_idx());
            log.info(fileDTOList);
            model.addAttribute("fileList", fileDTOList);
        }
        model.addAttribute("prevDTO", prevDTO);
        model.addAttribute("nextDTO", nextDTO);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @GetMapping("/qnaRegistQ")
    public void GETQnaRegistQ() {

    }
    @GetMapping("/qnaFileDownload")
    public String GETQnaFileDownload(@RequestParam("file_idx") int file_idx,
                                        @RequestParam("qna_idx") String qna_idx,
                                     HttpServletRequest req,
                                     HttpServletResponse res,
                                     Model model) throws UnsupportedEncodingException {
        QnaFileDTO fileDTO = qnaFileServiceIf.getFile(file_idx);
        log.info("filedto : " + fileDTO);
        String upload_path = req.getServletContext().getRealPath("");

        File file = new File(upload_path+"resources\\upload\\qna\\"+fileDTO.getSave_name());

        String original_name = fileDTO.getOriginal_name();
        original_name = URLEncoder.encode(original_name,"utf-8");
        log.info("filename : " + fileDTO.getPath()+fileDTO.getSave_name().substring(0,fileDTO.getSave_name().lastIndexOf(".")));
        res.setHeader("Content-Disposition", "attachment; filename=\"" + original_name + "\";");
        res.setHeader("Content-Transfer-Encoding", "binary");
        res.setHeader("Content-Type", fileDTO.getSave_name().substring(fileDTO.getSave_name().lastIndexOf("."),fileDTO.getSave_name().length()));
        res.setHeader("Content-Length", "" + file.length());
        res.setHeader("Pragma", "no-cache;");
        res.setHeader("Expires", "-1;");

        try(
                FileInputStream fis = new FileInputStream(file);
                OutputStream out = res.getOutputStream();
                ){
            int readCount = 0;
            byte[] buffer = new byte[1024];
            while((readCount = fis.read(buffer)) != -1){
                out.write(buffer,0,readCount);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/bbs/qnaViewQ?qna_idx="+qna_idx;
    }

    @PostMapping("/qnaRegistQ")
    public String POSTQnaRegistQ(@Valid QnaDTO qnaDTO,
                               MultipartHttpServletRequest files,
                               BindingResult bindingResult,
                               HttpServletRequest request,
                               RedirectAttributes redirectAttributes,
                               Model model) {
//        if(bindingResult.hasErrors()){
//            log.info("BookController >> list Error");
//            redirectAttributes.addFlashAttribute("qnaDTO",qnaDTO);
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//        }

        List<MultipartFile> list = files.getFiles("files");
        log.info("fileupload list >> " + list);
        log.info("list size : " + list.size());
        qnaDTO.setFileYN("N");
        for(int i=0;i<list.size();i++){
            if(list.get(i).getSize()!=0){
                qnaDTO.setFileYN("Y");
                break;
            }
        }
        int result = qnaServiceIf.regist(qnaDTO);
        String uploadFoler = CommonUtil.getUploadFolder(request,"qna");
        for(int i=0;i<list.size();i++){
            if(list.get(i).getSize()==0){
                break;
            }
            FileDTO fileDTO = FileDTO.builder()
                    .file(list.get(i))
                    .uploadFolder(uploadFoler)
                    .build();
            log.info("========================");
            log.info("postQnaRegist >> qnaDTO" + qnaDTO);
            log.info("========================");
            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            log.info("=======================");
            log.info("upload : " + map);
            log.info("=======================");
            if(map.get("result").equals("success")) {
                QnaFileDTO qnaFileDTO = QnaFileDTO.builder()
                        .path("/resources/upload/qna/")
                        .qna_idx(result)
                        .original_name(map.get("orgName"))
                        .save_name(map.get("newName")).build();
                qnaFileServiceIf.regist(qnaFileDTO);
            }
        }

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
