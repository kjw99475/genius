package org.fullstack4.genius.controller;


import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.OrderServiceIf;
import org.fullstack4.genius.service.PaymentServiceIf;
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
    private final PaymentServiceIf paymentServiceIf;

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
        log.info(orderDTO.toString());
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

    @RequestMapping(value = "/refundResponse.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String refundRequest(@RequestParam HashMap<String,Object> map){
        HashMap<String, Object> resultMap = new HashMap<>();
        log.info("###################"+map.toString());
        String order_state;
        boolean refund;
        String order_num = map.get("order_num").toString();

        List<OrderDTO> orderDTOImp = orderService.AdminOrderdetail(order_num);
        
        if(map.get("order_refund_response").toString().equals("Y")) {
                    order_state = "환불 완료";
                    refund = true;
        }
        else{
                    order_state = "환불 불가";
                    refund = false;
        }
        OrderDTO orderDTO = OrderDTO.builder()
                .order_num(order_num)
                .order_state(order_state)
                .order_refund_response(map.get("order_refund_response").toString())
                .build();
        int result = orderService.responseRefund(orderDTO);
        log.info(result);
        if(result > 0) {
            orderService.updateOrderState(orderDTO);
            if(refund){
                PaymentDTO paymentDTO = PaymentDTO.builder()
                        .payment_num(order_num)
                        .member_id(orderDTOImp.get(0).getMember_id())
                        .price(orderDTOImp.get(0).getTotal_price())
                        .method("포인트")
                        .company("genius")
                        .use_type("환불")
                        .title("포인트 환불")
                        .build();

                for(int i = 0; i<orderDTOImp.size();i++){
                    OrderDTO dto = orderDTOImp.get(i);
                    dto.setAmount(Integer.parseInt("-"+orderDTOImp.get(i).getAmount()));
                    log.info("테슽테틋ㅅ: " + dto.toString());
                    paymentServiceIf.salesBook(dto);
                    paymentServiceIf.deleteBookRelease(dto);
                }

                paymentServiceIf.memberPay(paymentDTO);
                paymentServiceIf.usepoint(paymentDTO);
            }
            resultMap.put("result", "success");
        }
        else{
            resultMap.put("result", "fail");
            resultMap.put("message", "오류");
        }

        return new Gson().toJson(resultMap);
    }

}
