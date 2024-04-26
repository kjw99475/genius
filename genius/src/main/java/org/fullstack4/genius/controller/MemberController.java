package org.fullstack4.genius.controller;


import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.service.MemberServiceIf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@Log4j2
@Controller
@RequestMapping(value="/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberServiceIf memberService;

    @GetMapping("/join")
    public void GETJoin(){

    }

    @PostMapping("/join")
    public void POSTJoin(){

    }

    @GetMapping("/complete")
    public void GETComplete(){

    }


    @RequestMapping(value = "/viewMember.dox", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String viewMember(Model model , @RequestParam(name = "member_id")String member_id){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        MemberDTO dto = memberService.view(member_id);
        resultMap.put("dto", dto);
        	// 갯수 세기
        return new Gson().toJson(resultMap);
    }



}
