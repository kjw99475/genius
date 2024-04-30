package org.fullstack4.genius.controller;


import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.OrderServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/admin/order")
@RequiredArgsConstructor
public class AdminOrderController {

    private final OrderServiceIf orderService;

    @GetMapping("/list")
    public void GETList(Model model, @RequestParam(name="page", defaultValue = "1")int page,
                        @RequestParam(name="page_size", defaultValue = "10")int page_size,
                        PageRequestDTO pageRequestDTO){
        pageRequestDTO.setPage_size(page_size);
        pageRequestDTO.setPage(page);
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<OrderDTO> responseDTO = orderService.OrderListByPage(pageRequestDTO);

        log.info("=====================================");
        log.info("responseDTO : " + responseDTO);
        log.info("=====================================");

        model.addAttribute("orderDTOlist", responseDTO.getDtoList());
        model.addAttribute("pageDTO", responseDTO);

    }

    @GetMapping("/view")
    public void GETView(){

    }

    @RequestMapping(value = "/deliveryupdate.dox", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String viewMember(Model model , @RequestParam HashMap<String,Object> map){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        log.info("=======================딜리버리 테스트=============");
        log.info("ordernumList : " + map.get("ordernumList"));

        // 갯수 세기
        return new Gson().toJson(resultMap);
    }

}
