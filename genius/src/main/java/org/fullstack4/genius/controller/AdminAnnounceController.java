package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;
import org.fullstack4.genius.Common.FileUtil;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.BbsFileServiceIf;
import org.fullstack4.genius.service.BbsServiceIf;
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
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping(value="/admin/announce")
@RequiredArgsConstructor
public class AdminAnnounceController {
    private final BbsServiceIf bbsServiceIf;
    private final BbsFileServiceIf bbsFileServiceIf;
    String category_code = "bc02";

    @GetMapping("/list")
    public void GETList(@Valid PageRequestDTO pageRequestDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
            , Model model
    ){
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        pageRequestDTO.setPage_block_size(10);
        pageRequestDTO.setCategory_code(category_code);

        PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);
        //List<BbsDTO> bbsDTOList = bbsServiceIf.listAll(category_code);

        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/contentregist")
    public void GETContentRegist(BbsDTO bbsDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes){


    }
    @GetMapping("/announceFileDownload")
    public String GETBbsFileDownload(@RequestParam("file_idx") int file_idx,
                                     @RequestParam("bbs_idx") String bbs_idx,
                                     HttpServletRequest req,
                                     HttpServletResponse res,
                                     Model model) throws UnsupportedEncodingException {
        BbsFileDTO fileDTO = bbsFileServiceIf.getFile(file_idx);
        String upload_path = req.getServletContext().getRealPath("");
        log.info("==================");
        log.info("path : " + upload_path+"resources\\upload\\bbs\\"+fileDTO.getSave_name());
        log.info("=================");
        File file = new File(upload_path+"resources\\upload\\bbs\\"+fileDTO.getSave_name());

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
        return "redirect:/admin/announce/view?bbs_idx="+bbs_idx;
    }

    @PostMapping("/contentregist")
    public String POSTContentRegist(BbsDTO bbsDTO,
                                    MultipartHttpServletRequest files,
                                    BindingResult bindingResult,
                                    HttpServletRequest request,
                                    RedirectAttributes redirectAttributes,
                                    Model model){
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        List<MultipartFile> list = files.getFiles("files");
        log.info("fileupload list >> " + list);
        log.info("list size : " + list.size());
        bbsDTO.setFileYN("N");
        for(int i=0;i<list.size();i++){
            if(list.get(i).getSize()!=0){
                bbsDTO.setFileYN("Y");
                break;
            }
        }
        bbsDTO.setCategory_code("bc02");

        int result = bbsServiceIf.regist(bbsDTO);
        String uploadFoler = CommonUtil.getUploadFolder(request,"bbs");
        for(int i=0;i<list.size();i++){
            if(list.get(i).getSize()==0){
                break;
            }
            FileDTO fileDTO = FileDTO.builder()
                    .file(list.get(i))
                    .uploadFolder(uploadFoler)
                    .build();
            log.info("========================");
            log.info("postQnaRegist >> qnaDTO" + bbsDTO);
            log.info("========================");
            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            log.info("=======================");
            log.info("upload : " + map);
            log.info("=======================");
            if(map.get("result").equals("success")) {
                BbsFileDTO bbsFileDTO = BbsFileDTO.builder()
                        .path("/resources/upload/bbs/")
                        .bbs_idx(result)
                        .category_code("bc02")
                        .original_name(map.get("orgName"))
                        .save_name(map.get("newName")).build();
                bbsFileServiceIf.regist(bbsFileDTO);
            }
        }
        if(result > 0) {
            log.info("등록 성공 ===============");
            return "redirect:/admin/announce/list";
        } else {
            log.info("등록 실패 ===============");
            return "redirect:/admin/announce/contentregist";
        }
    }

    @GetMapping("/contentmodify")
    public void GETContentModify(int bbs_idx
            , Model model){
        BbsDTO bbsDTO = bbsServiceIf.view(bbs_idx);
        if(bbsDTO.getFileYN().equals("Y")){
            List<BbsFileDTO> fileDTOList = bbsFileServiceIf.getFileList(bbsDTO.getBbs_idx(), bbsDTO.getCategory_code());
            log.info(fileDTOList);
            model.addAttribute("fileList", fileDTOList);
        }
        model.addAttribute("bbsDTO", bbsDTO);
    }

    @PostMapping("/contentmodify")
    public String POSTContentModify(@Valid BbsDTO newBbsDTO,
                                    MultipartHttpServletRequest files,
                                    @RequestParam(name = "orgFiles", defaultValue = "") String orgFiles,
                                    BindingResult bindingResult,
                                    RedirectAttributes redirectAttributes,
                                    HttpServletRequest request,
                                    Model model){
        if(bindingResult.hasErrors()){
            log.info("BookController >> list Error");
            redirectAttributes.addFlashAttribute("bbsDTO",newBbsDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        newBbsDTO.setFileYN("N");
        // (지현 추가) 수정 시 파일 업로드 로직
        // 1. 기존 파일 삭제된 건 체크 후 삭제로직 진행
        BbsDTO orgBbsDTO = bbsServiceIf.view(newBbsDTO.getBbs_idx());
        if(orgBbsDTO.getFileYN().equals("Y")){
            List<BbsFileDTO> OrgfileDTOList = bbsFileServiceIf.getFileList(orgBbsDTO.getBbs_idx(), "bc02");
            if (!orgFiles.isEmpty()) {
                // 기존 파일을 유지하거나 일부만 지웠을 겨우
                newBbsDTO.setFileYN("Y");
                for(BbsFileDTO fileDTO : OrgfileDTOList) {
                    if(!orgFiles.contains( String.valueOf(fileDTO.getFile_idx()))) {

                        bbsFileServiceIf.deleteFile(String.valueOf(fileDTO.getFile_idx()));
                    }
                }
            } else {
                // 기존 파일 다 지웠을 경우
                for(BbsFileDTO fileDTO : OrgfileDTOList) {
                    bbsFileServiceIf.deleteFile(String.valueOf(fileDTO.getFile_idx()));
                }
            }
        }

        List<MultipartFile> newFileList = files.getFiles("files");
        String uploadFolder = CommonUtil.getUploadFolder(request,"bbs");
        for(MultipartFile file : newFileList) {
            if(file.getSize() == 0) {
                break;
            }
            newBbsDTO.setFileYN("Y");
            FileDTO fileDTO = FileDTO.builder()
                    .file(file)
                    .uploadFolder(uploadFolder)
                    .build();
            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            if(map.get("result").equals("success")) {
                BbsFileDTO bbsFileDTO = BbsFileDTO.builder()
                        .path("/resources/upload/bbs/")
                        .bbs_idx(orgBbsDTO.getBbs_idx())
                        .category_code("bc02")
                        .original_name(map.get("orgName"))
                        .save_name(map.get("newName")).build();
                bbsFileServiceIf.regist(bbsFileDTO);
            }
        }
        int result = bbsServiceIf.modify(newBbsDTO);
        if(result > 0) {
            log.info("수정 성공==============");
            return "redirect:/admin/announce/view?bbs_idx=" +newBbsDTO.getBbs_idx();
        } else {
            log.info("수정 실패==============");
            return "redirect:/admin/announce/contentmodify?bbs_idx=" + newBbsDTO.getBbs_idx();
        }
    }

    @GetMapping("/view")
    public void GETView(int bbs_idx
            , Model model) {
        BbsDTO bbsDTO = bbsServiceIf.view(bbs_idx);
        BbsDTO prebbsDTO = bbsServiceIf.preView(bbs_idx, category_code);
        BbsDTO postbbsDTO = bbsServiceIf.postView(bbs_idx, category_code);
        log.info(bbsDTO);
        if(bbsDTO.getFileYN().equals("Y")){
            List<BbsFileDTO> fileDTOList = bbsFileServiceIf.getFileList(bbsDTO.getBbs_idx(), bbsDTO.getCategory_code());
            log.info(fileDTOList);
            model.addAttribute("fileList", fileDTOList);
        }

        model.addAttribute("bbsDTO", bbsDTO);
        model.addAttribute("prebbsDTO", prebbsDTO);
        model.addAttribute("postbbsDTO", postbbsDTO);

    }

    @PostMapping("/view")
    public void POSTView(){

    }

    @PostMapping("/delete")
    public String POSTDelete(int bbs_idx) {
        int result = bbsServiceIf.delete(bbs_idx);
        if(result > 0) {
            log.info("삭제 성공 >> " + bbs_idx);
            return "redirect:/admin/announce/list";
        } else {
            log.info("삭제 실패 >> " + bbs_idx);
            return "redirect:/admin/announce/view?bbs_idx=" + bbs_idx;
        }
    }

    @PostMapping("/delete_chk")
    public String POSTDelete_chk(@RequestParam("chk_del") String[] chk_del) {
        int cnt = 0;
        for(int i=0; i<chk_del.length; i++) {
            int bbs_idx = Integer.parseInt(chk_del[i]);
            int result = bbsServiceIf.delete(bbs_idx);
            if(result > 0) {
                log.info("삭제 성공 idx : " + bbs_idx);
                cnt +=1;
            } else {
                log.info("삭제 실패 idx : " + bbs_idx);
            }
        }
        log.info("삭제 개수 >> " + cnt);
        return "redirect:/admin/announce/list";
    }

}
