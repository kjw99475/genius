package org.fullstack4.genius.controller;


import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.OrderServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
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
    public void GETView(@RequestParam (name="order_num") String order_num,Model model){
        List<OrderDTO> orderDTO = orderService.AdminOrderdetail(order_num);
        model.addAttribute("orderDTO", orderDTO);
    }

    @RequestMapping(value = "/deliveryupdate.dox", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String deliveryUpdate(Model model , @RequestParam HashMap<String,Object> map){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();


        String ordernum = map.get("ordernumList").toString();
        String delivery = map.get("delivery").toString();

        ordernum = ordernum.replace("\"","");
        ordernum = ordernum.replace("[","");
        ordernum = ordernum.replace("]","");
        String[] ordernumList = ordernum.split(",");

        delivery = delivery.replace("\"","");
        delivery = delivery.replace("[","");
        delivery = delivery.replace("]","");
        String[] deliveryList = delivery.split(",");

        log.info("=======================딜리버리 테스트 시작=============");
        log.info("========================"+ Arrays.toString(ordernumList)+"===================");
        log.info("========================"+ Arrays.toString(deliveryList)+"===================");
        log.info("=======================딜리버리 테스트 끝=============");

        int result = 0;
        int result1 = 0;
        for(int i=0;i<ordernumList.length;i++){
            if(!deliveryList[i].equals("")) {
                OrderDTO dto = OrderDTO.builder()
                        .order_num(ordernumList[i])
                        .delivery_company(deliveryList[i])
                        .delivery_state("배송 중")
                        .order_state("배송 중")
                        .build();
                result1 += orderService.updateOrderState(dto);
                result += orderService.updateDcompany(dto);
            }
        }

        if(result >0) {
            resultMap.put("result", "success");
        }
        else{
            resultMap.put("result", "fail");
        }
        resultMap.put("result", "success");
        // 갯수 세기
        return new Gson().toJson(resultMap);
    }

}
