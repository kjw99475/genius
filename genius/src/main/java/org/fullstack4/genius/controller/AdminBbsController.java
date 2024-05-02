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
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping(value="/admin/bbs")
@RequiredArgsConstructor
public class AdminBbsController {
    private final BbsServiceIf bbsServiceIf;
    private final BbsFileServiceIf bbsFileServiceIf;
    String category_code = "bc01";

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
//        pageRequestDTO.setPage_size(page_size);
        pageRequestDTO.setPage_block_size(10);
        pageRequestDTO.setCategory_code(category_code);

        PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);
        //List<BbsDTO> bbsDTOList = bbsServiceIf.listAll(category_code);
        log.info("페이지리퀘" + pageRequestDTO.toString());
        model.addAttribute("responseDTO", responseDTO);
    }


//    @GetMapping("/list")
//    public void GETList(@Valid PageRequestDTO pageRequestDTO
//                        , BindingResult bindingResult
//                        , RedirectAttributes redirectAttributes
//                        , Model model){
//        if(bindingResult.hasErrors()){
//            log.info("BbsController >> list Error");
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//        }
//        pageRequestDTO.setPage_size(10);
//        pageRequestDTO.setPage_block_size(10);
//
//        //PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.listByPage(pageRequestDTO);
//        List<BbsDTO> bbsDTOList = bbsServiceIf.listAll(category_code);
//        model.addAttribute("bbsDTOList", bbsDTOList);
//    }

    @GetMapping("/contentregist")
    public void GETContentRegist(BbsDTO bbsDTO
                                , BindingResult bindingResult
                                , RedirectAttributes redirectAttributes
                                , Model model
    ){
        model.addAttribute("bbsDTO", bbsDTO);
    }

    @PostMapping("/contentregist")
    public String POSTContentRegist(BbsDTO bbsDTO
                                  , MultipartHttpServletRequest files
                                  , BindingResult bindingResult
                                  , HttpServletRequest request
                                  , RedirectAttributes redirectAttributes
                                  , Model model){
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
        //카테고리 체크
        bbsDTO.setCategory_code(category_code);

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
            log.info("postbbsRegist >> bbsDTO" + bbsDTO);
            log.info("========================");
            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            log.info("=======================");
            log.info("upload : " + map);
            log.info("=======================");
            if(map.get("result").equals("success")) {
                BbsFileDTO bbsFileDTO = BbsFileDTO.builder()
                        .path("/resources/upload/bbs/")
                        .bbs_idx(result)
                        .original_name(map.get("orgName"))
                        .save_name(map.get("newName"))
                        .category_code("bc01").build();
                bbsFileServiceIf.regist(bbsFileDTO);
            }
        }
        if(result > 0) {
            log.info("등록 성공 ===============");
            return "redirect:/admin/bbs/list";
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
        BbsDTO prebbsDTO = bbsServiceIf.preView(bbs_idx, category_code);
        BbsDTO postbbsDTO = bbsServiceIf.postView(bbs_idx, category_code);

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
            return "redirect:/admin/bbs/list";
        } else {
            log.info("삭제 실패 >> " + bbs_idx);
            return "redirect:/admin/bbs/view?bbs_idx=" + bbs_idx;
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
        return "redirect:/admin/bbs/list";
    }

}
