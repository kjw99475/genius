package org.fullstack4.genius.controller;


import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.dto.PaymentDTO;
import org.fullstack4.genius.service.PaymentServiceIf;
import org.fullstack4.genius.service.PaymentServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@Log4j2
@Controller
@RequestMapping(value="/mypage")
@RequiredArgsConstructor
public class MypageController {

    private final PaymentServiceIf paymentService;
    @GetMapping("/mypage")
    public void GETMypage(){

    }

    @PostMapping("/mypage")
    public void POSTMypage(){

    }

    @GetMapping("/myquestions")
    public void GETQuestion(){

    }

    @PostMapping("/myquestions")
    public void POSTQuestion(){

    }

    @GetMapping("/payhistory")
    public void GETPayhistory(){

    }

    @PostMapping("/payhistory")
    public void POSTPayhistory(){

    }

    @GetMapping("/cart")
    public void GETCart(){

    }

    @PostMapping("/cart")
    public void POSTCart(){

    }

    @GetMapping("/point")
    public void GETPoint(){

    }

    @PostMapping("/point")
    public void POSTPoint(){

    }

    @RequestMapping(value = "/point.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String ChargePoint(Model model , @RequestParam HashMap<String, Object> map){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        PaymentDTO paymentDTO = PaymentDTO.builder()
                
                .build();
        log.info("=====================================================");
        log.info("PaymentDTO : " + map);
        log.info("=====================================================");
//        int result = paymentService.charge(dto);
//        if(result > 0) {
//            resultMap.put("result", "success");
//        }
//        else{
//            resultMap.put("result", "fail");
//        }
        // 갯수 세기
        return new Gson().toJson(resultMap);
    }

}
