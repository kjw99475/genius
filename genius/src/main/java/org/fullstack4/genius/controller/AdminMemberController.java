package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping(value="/admin/member")
@RequiredArgsConstructor
public class AdminMemberController {
    private final MemberServiceIf memberServiceIf;
    @GetMapping("/memberList")
    public void GETMemberList(
            PageRequestDTO pageRequestDTO,
            HttpServletRequest request,
            Model model)
    {
        log.info("GETMemberList==================pageRequestDTO" + pageRequestDTO);
        PageResponseDTO<MemberDTO> pageResponseDTO = memberServiceIf.list(pageRequestDTO);
        model.addAttribute("pageResponseDTO", pageResponseDTO);
    }


    @GetMapping("/memberView")
    public void GETMemberView(
            @RequestParam(name = "member_id", defaultValue = "") String member_id,
            Model model
            ){
        log.info("GETMemberView >>>>>>>>>>>> GETMemberView()");
        MemberDTO memberDTO = memberServiceIf.view(member_id);
        model.addAttribute("memberDTO", memberDTO);

    }

    @PostMapping("/memberModify")
    public String POSTMemberModify(@Valid MemberInfoDTO newMemberDTO,
                                   BindingResult bindingResult,
                                   RedirectAttributes redirectAttributes,
                                   HttpServletRequest request,
                                   @RequestParam("file")MultipartFile file){
        log.info("===========================================");
        log.info("AdminMemberController >>>>>>>>>>>>>>>>> POSTMemberModify");
        MemberDTO orgMemberDTO = memberServiceIf.view(newMemberDTO.getMember_id());
        if(!CommonUtil.parseString(orgMemberDTO.getSocial_type()).isEmpty() || (CommonUtil.parseString(newMemberDTO.getPwd()).isEmpty())) {
            newMemberDTO.setPwd(orgMemberDTO.getPwd());
            newMemberDTO.setPwdCheck(orgMemberDTO.getPwd());
        }
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("err", bindingResult.getAllErrors());
            redirectAttributes.addAttribute("member_id", newMemberDTO.getMember_id());
            return "redirect:/admin/member/memberView";
        }
        FileDTO fileDTO = null;
        if(file.getSize() > 0) {
            String uploadFolder =  CommonUtil.getUploadFolder(request, "profile");
            fileDTO = FileDTO.builder()
                    .file(file)
                    .uploadFolder(uploadFolder)
                    .build();
        } else {
            newMemberDTO.setProfile(orgMemberDTO.getProfile());
        }
        int result = memberServiceIf.modifyInfo(newMemberDTO, fileDTO);
        if(result > 0 ){
            redirectAttributes.addFlashAttribute("result","정상 처리되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("result", "정보 수정에 실패하였습니다.");
        }
        redirectAttributes.addAttribute("member_id", newMemberDTO.getMember_id());
        return "redirect:/admin/member/memberView";
    }

    @PostMapping("/memberLeave")
    public String POSTMemberDelete(PageRequestDTO pageRequestDTO,
                                  @RequestParam(name = "target", defaultValue = "") String target,
                                  @RequestParam(name = "link", defaultValue = "list") String link,
                                  RedirectAttributes redirectAttributes){
        int result = memberServiceIf.leave(target);
        log.info("POSTMemberDelete >>>>>>>>>>>> POSTMemberDelete()");
        if (result == 0) {
            redirectAttributes.addFlashAttribute("err","탈퇴 처리 실패");
        }
        if(link.equals("view")) {
            redirectAttributes.addAttribute("member_id",target);
            return "redirect:/admin/member/memberView";
        } else {
            redirectAttributes.addFlashAttribute("pageRequestDTO", pageRequestDTO);
            return "redirect:/admin/member/memberList";
        }

    }
}
