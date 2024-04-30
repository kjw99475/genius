package org.fullstack4.genius.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.BannerDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.service.BannerServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
        model.addAttribute("pageResponseDTO", pageResponseDTO);
    }

    @GetMapping("/bannerRegist")
    public void GETBannerRegist(){

    }

    @PostMapping("/bannerRegist")
    public void POSTBannerRegist(){

    }

    @GetMapping("/bannerModify")
    public void GETBannerModify(){

    }

    @PostMapping("/bannerModify")
    public void POSTBannerModify(){

    }
}
