package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;
import org.fullstack4.genius.Common.FileUtil;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.QnaFileServiceIf;
import org.fullstack4.genius.service.QnaServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping(value="/admin/qna")
@RequiredArgsConstructor
public class AdminQnaController {
    private final QnaServiceIf qnaService;
    private final QnaFileServiceIf qnaFileServiceIf;
    @GetMapping("/list")
    public void GETList(@Valid PageRequestDTO pageRequestDTO,
                        BindingResult bindingResult,
                        RedirectAttributes redirectAttributes,
                        Model model){
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<QnaDTO> responseDTO = qnaService.qnaListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/contentregist")
    public void GETContentRegist(){

    }

    @PostMapping("/contentregist")
    public String POSTContentRegist(@Valid QnaDTO qnaDTO,
                                    BindingResult bindingResult,
                                    MultipartHttpServletRequest files,
                                    HttpServletRequest request,
                                    RedirectAttributes redirectAttributes,
                                    Model model){

        if(bindingResult.hasErrors()){
            log.info("AdminQnaController >> Regist Error");
            redirectAttributes.addFlashAttribute("qnaDTO",qnaDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/admin/qna/contentregist";
        }

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
        int result = qnaService.regist(qnaDTO);
        String uploadFoler = CommonUtil.getUploadFolder(request,"qna");
        for(int i=0;i<list.size();i++){
            if(list.get(i).getSize()==0){
                break;
            }
            FileDTO fileDTO = FileDTO.builder()
                    .file(list.get(i))
                    .uploadFolder(uploadFoler)
                    .build();
            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            if(map.get("result").equals("success")) {
                QnaFileDTO qnaFileDTO = QnaFileDTO.builder()
                        .path("/resources/upload/qna/")
                        .qna_idx(result)
                        .original_name(map.get("orgName"))
                        .save_name(map.get("newName")).build();
                int fileResult = qnaFileServiceIf.regist(qnaFileDTO);
                if(fileResult < 1){
                    redirectAttributes.addFlashAttribute("qnaDTO",qnaDTO);
                    redirectAttributes.addFlashAttribute("err", " 파일 업로드 실패");
                    return "redirect:/admin/qna/contentregist";
                }
            }
            else{
                redirectAttributes.addFlashAttribute("qnaDTO",qnaDTO);
                redirectAttributes.addFlashAttribute("err", " 파일 업로드 실패");
                return "redirect:/admin/qna/contentregist";
            }
        }
        if(result>0){
            return "redirect:/admin/qna/list";
        }
        else{
            redirectAttributes.addFlashAttribute("qnaDTO",qnaDTO);
            redirectAttributes.addFlashAttribute("err", "등록 실패");

            return "redirect:/admin/qna/contentregist";
        }

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
        log.info("adminqnaController");
        if(qnaDTO.getFileYN().equals("Y")){
            List<QnaFileDTO> fileDTOList = qnaFileServiceIf.getFileList(qnaDTO.getQna_idx());
            log.info(fileDTOList);
            model.addAttribute("fileList", fileDTOList);
        }
        model.addAttribute("prevDTO", prevDTO);
        model.addAttribute("nextDTO", nextDTO);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/view")
    public void POSTView(){

    }


    @GetMapping("/contentmodify")
    public void GETContentModify(@RequestParam(name = "qna_idx")int qna_idx,
                                 Model model){
        QnaDTO qnaDTO = qnaService.view(qna_idx);
        if(qnaDTO.getFileYN().equals("Y")){
            List<QnaFileDTO> fileDTOList = qnaFileServiceIf.getFileList(qnaDTO.getQna_idx());
            log.info(fileDTOList);
            model.addAttribute("fileList", fileDTOList);
        }
        qnaDTO.setContents(qnaDTO.getContents().replace("<p>",""));
        log.info("contents : " + qnaDTO.getContents());
        log.info("length : " + qnaDTO.getContents().length());
        qnaDTO.setContents(qnaDTO.getContents().trim());


        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/contentmodify")
    public String POSTContentModify(@Valid QnaDTO newQnaDTO,
                                    BindingResult bindingResult,
                                    MultipartHttpServletRequest files,
                                    @RequestParam(name = "orgFiles", defaultValue = "") String orgFiles,
                                    RedirectAttributes redirectAttributes,
                                    HttpServletRequest request,
                                    Model mode){
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("qnaDTO",newQnaDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/admin/qna/contentmodify?qna_idx="+newQnaDTO.getQna_idx();
        }
        newQnaDTO.setFileYN("N");
        QnaDTO orgQnaDTO = qnaService.view(newQnaDTO.getQna_idx());
        if(orgQnaDTO.getFileYN().equals("Y")){
            List<QnaFileDTO> OrgfileDTOList = qnaFileServiceIf.getFileList(orgQnaDTO.getQna_idx());
            if (!orgFiles.isEmpty()) {
                log.info("orgFiles1 : " + orgFiles);
                // 기존 파일을 유지하거나 일부만 지웠을 겨우
                newQnaDTO.setFileYN("Y");
                for(QnaFileDTO fileDTO : OrgfileDTOList) {
                    if(!orgFiles.contains( String.valueOf(fileDTO.getFile_idx()))) {
                        qnaFileServiceIf.deleteFile(String.valueOf(fileDTO.getFile_idx()));
                    }
                }
            } else {
                log.info("orgFiles2 : " + orgFiles);
                // 기존 파일 다 지웠을 경우
                for(QnaFileDTO fileDTO : OrgfileDTOList) {
                    qnaFileServiceIf.deleteFile(String.valueOf(fileDTO.getFile_idx()));
                }
            }
        }
        List<MultipartFile> newFileList = files.getFiles("files");
        String uploadFolder = CommonUtil.getUploadFolder(request,"qna");
        log.info("newfilelist : " + newFileList);
        for(MultipartFile file : newFileList) {
            if(file.getSize() == 0) {
                break;
            }
            newQnaDTO.setFileYN("Y");
            FileDTO fileDTO = FileDTO.builder()
                    .file(file)
                    .uploadFolder(uploadFolder)
                    .build();
            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            if(map.get("result").equals("success")) {
                QnaFileDTO qnaFileDTO = QnaFileDTO.builder()
                        .path("/resources/upload/qna/")
                        .qna_idx(orgQnaDTO.getQna_idx())
                        .original_name(map.get("orgName"))
                        .save_name(map.get("newName")).build();
                qnaFileServiceIf.regist(qnaFileDTO);
            }
        }

        int result = qnaService.modify(newQnaDTO);
        log.info("AdminBookController : POSTItemModify >> result : " + result);
        if(result >0){
            return "redirect:/admin/qna/view?qna_idx="+newQnaDTO.getQna_idx();
        }
        else{
            return "redirect:/admin/qna/contentmodify?qna_idx="+newQnaDTO.getQna_idx();
        }
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
        return "redirect:/admin/qna/view?qna_idx="+qna_idx;
    }


    @GetMapping("/answerregist")
    public void GETAnswerRegist(@RequestParam(name = "qna_idx")int qna_idx,
                                Model model){
        QnaDTO qnaDTO = qnaService.view(qna_idx);
        if(qnaDTO.getFileYN().equals("Y")){
            List<QnaFileDTO> fileDTOList = qnaFileServiceIf.getFileList(qnaDTO.getQna_idx());
            log.info(fileDTOList);
            model.addAttribute("fileList", fileDTOList);
        }

        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/answerregist")
    public String PostAnswerRegist(@Valid QnaDTO qnaDTO,
                                   BindingResult bindingResult,
                                   @RequestParam(name = "ref_idx")int ref_idx,
                                   MultipartHttpServletRequest files,
                                   HttpServletRequest request,
                                   RedirectAttributes redirectAttributes,
                                   Model model){
        if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("newQnaDTO",qnaDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/admin/qna/answerregist?qna_idx="+ref_idx;
        }
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
        int result = qnaService.answerRegist(qnaDTO);
        int result2 = qnaService.answerStatus(qnaDTO.getRef_idx());
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

        if(result >0){
            return "redirect:/admin/qna/view?qna_idx="+result;
        }
        else{

            return "redirect:/admin/qna/view?qna_idx="+qnaDTO.getRef_idx();
        }
    }

    @GetMapping("/answermodify")
    public void GETAnswerModify(){

    }

    @PostMapping("/answermodify")
    public void PostAnswerModify(){

    }



}
