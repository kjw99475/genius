package org.fullstack4.genius.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;
import org.fullstack4.genius.Common.FileUtil;
import org.fullstack4.genius.dto.BannerDTO;
import org.fullstack4.genius.dto.FileDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.service.BannerServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/admin/banner")
@RequiredArgsConstructor
public class BannerController {
    private final BannerServiceIf bannerServiceIf;
    @GetMapping("/bannerList")
    public void GETBannerList(PageRequestDTO pageRequestDTO
                              , Model model){
        PageResponseDTO<BannerDTO> pageResponseDTO = bannerServiceIf.list(pageRequestDTO);
        List<BannerDTO> orderBannerDTO = bannerServiceIf.orderList();
        model.addAttribute("pageResponseDTO", pageResponseDTO);
        model.addAttribute("orderBannerDTO", orderBannerDTO);
    }

    @GetMapping("/bannerRegist")
    public void GETBannerRegist(){

    }

    @PostMapping("/bannerRegist")
    public String POSTBannerRegist(BannerDTO newBannerDTO,
                                   HttpServletRequest request,
                                   RedirectAttributes redirectAttributes,
                                   @RequestParam("file")MultipartFile file){
        log.info("====================POSTBannerRegist");
        HttpSession session = request.getSession();
        String member_id = CommonUtil.parseString(session.getAttribute("member_id"));
        newBannerDTO.setMember_id(member_id);
        String uploadFolder =  CommonUtil.getUploadFolder(request, "banner");
        FileDTO fileDTO = fileDTO = FileDTO.builder()
                .file(file)
                .uploadFolder(uploadFolder)
                .build();
        log.info("newBannerDTO : " + newBannerDTO);
        log.info("fileDTO : " + fileDTO);
        int result = bannerServiceIf.regist(newBannerDTO, fileDTO);
        if(result > 0) {
            log.info("등록 성공");
            return "redirect:/admin/banner/bannerList";
        } else {
            log.info("등록 실패");
            redirectAttributes.addFlashAttribute("err", "등록 실패");
            redirectAttributes.addAttribute("bannerDTO", newBannerDTO);
            return "redirect:/admin/banner/bannerRegist";
        }
    }

    @GetMapping("/bannerModify")
    public void GETBannerModify(@RequestParam(name = "banner_img_idx", defaultValue = "")String banner_img_idx,
                                Model model){
        BannerDTO bannerDTO = null;
        if (!banner_img_idx.equals("")) {
            bannerDTO = bannerServiceIf.view(banner_img_idx);
        }
        model.addAttribute("bannerDTO", bannerDTO);
    }

    @PostMapping("/bannerModify")
    public String POSTBannerModify(BannerDTO newBannerDTO,
                                 HttpServletRequest request,
                                 RedirectAttributes redirectAttributes,
                                 @RequestParam("file") MultipartFile file){
        log.info("====================POSTBannerModify");
        HttpSession session = request.getSession();
        String member_id = CommonUtil.parseString(session.getAttribute("member_id"));
        newBannerDTO.setMember_id(member_id);
        BannerDTO orgBannerDTO = bannerServiceIf.view(newBannerDTO.getBanner_img_idx());
        FileDTO fileDTO = null;
        if (file.getSize() > 0) {
            String uploadFolder =  CommonUtil.getUploadFolder(request, "banner");
            fileDTO = FileDTO.builder()
                    .file(file)
                    .uploadFolder(uploadFolder)
                    .build();
        } else {
            newBannerDTO.setPath(orgBannerDTO.getPath());
            newBannerDTO.setSave_name(orgBannerDTO.getSave_name());
            newBannerDTO.setOriginal_name(orgBannerDTO.getOriginal_name());
        }
        int result = bannerServiceIf.modify(newBannerDTO, fileDTO);
        if(result > 0 ){
            log.info("정보 수정 성공");
        } else {
            redirectAttributes.addFlashAttribute("err", "정보 수정 실패");
            log.info("정보 수정 실패");
        }
        return "redirect:/admin/banner/bannerModify?banner_img_idx="+newBannerDTO.getBanner_img_idx();
    }

    @PostMapping({"/bannerDelete", "/bannerDeleteAll"})
    public String POSTDeleteBanner(@RequestParam(name="banner_img_idx", defaultValue = "") String banner_img_idx,
                                   HttpServletRequest request,
                                   RedirectAttributes redirectAttributes) {
        String requestURL = CommonUtil.parsingURI(request.getRequestURI());
        log.info("==============================POSTDeleteBanner");
        if(requestURL.equals("/banner/bannerDeleteAll")) {
            log.info("banner_img_idx : " + banner_img_idx);
            String[] idxes = banner_img_idx.split(",");
            int total = 0;
            for (String idx : idxes) {
                total += bannerServiceIf.delete(idx);
            }
            String message = "총" + idxes.length + "건 중 " + total + "건 삭제 성공 하였습니다.";
            redirectAttributes.addFlashAttribute("result", message);
        } else if (requestURL.equals("/banner/bannerDelete")) {
            log.info("banner_img_idx : " + banner_img_idx);
            int result = bannerServiceIf.delete(banner_img_idx);
            if (result > 0 ) {
                redirectAttributes.addFlashAttribute("result", "삭제 성공 하였습니다.");
            } else {
                redirectAttributes.addFlashAttribute("result", "삭제 실패 하였습니다.");
            }
        }
        return "redirect:/admin/banner/bannerList";
    }

    @PostMapping("/changeOrder")
    public String POSTChangeOrder(@RequestParam(name = "banner_img_idx", defaultValue = "") String banner_img_idx,
                                  RedirectAttributes redirectAttributes) {
        String[] bannerArr = banner_img_idx.split(",");
        int result = 0;
        for(int i = 0; i < bannerArr.length; i++) {
            result += bannerServiceIf.changeOrder(i+1, bannerArr[i]);
        }
        if (result == bannerArr.length) {
            redirectAttributes.addFlashAttribute("result", "배너 순서 변경이 성공하였습니다.");
        } else {
            redirectAttributes.addFlashAttribute("result", "배너 순서 변경이 총 "+bannerArr.length+"건 중 "+result+"건 성공 하였습니다.");
        }
        return "redirect:/admin/banner/bannerList";
    }
}
