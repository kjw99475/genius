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
                                  MultipartHttpServletRequest files,
                                  BindingResult bindingResult,
                                  HttpServletRequest request,
                                  RedirectAttributes redirectAttributes,
                                  Model model){

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
            return "redirect:/admin/qna/list";
        }else{
            redirectAttributes.addFlashAttribute(qnaDTO);
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

        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/answerregist")
    public String PostAnswerRegist(@Valid QnaDTO qnaDTO,
                                   MultipartHttpServletRequest files,
                                   BindingResult bindingResult,
                                   HttpServletRequest request,
                                   RedirectAttributes redirectAttributes,
                                   Model model){
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
