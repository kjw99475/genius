package org.fullstack4.genius.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/admin/banner")
@RequiredArgsConstructor
public class BannerController {

    @GetMapping("/bannerList")
    public void GETBannerList(){

    }

    @GetMapping("/bannerRegist")
    public void GETBannerRegist(){

    }

    @PostMapping("/bannerRegist")
    public void POSTBannerRegist(){

    }

    @GetMapping("/bannerModfiy")
    public void GETBannerModify(){

    }

    @PostMapping("/bannerModify")
    public void POSTBannerModify(){

    }
}
