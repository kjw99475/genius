package org.fullstack4.genius.controller;

import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.CartDTO;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.dto.PaymentDTO;
import org.fullstack4.genius.service.CartServiceIf;
import org.fullstack4.genius.service.MemberServiceIf;
import org.fullstack4.genius.service.OrderServiceIf;
import org.fullstack4.genius.service.PaymentServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/order")
@RequiredArgsConstructor
public class OrderController {

    private final MemberServiceIf memberService;
    private final CartServiceIf cartService;
    private final OrderServiceIf orderService;
    private final PaymentServiceIf paymentServiceIf;

    @GetMapping("/payment")
    public void GETpayment1(HttpServletRequest req, Model model
            , @RequestParam(name="cart_idx") List<String> Cart_idx) {
        log.info("###################"+Cart_idx.toString());
        HttpSession session = req.getSession();
        String member_id = (String) session.getAttribute("member_id");
        log.info("#########member_id##############"+member_id);
        MemberDTO dto = memberService.view(member_id);

        List<CartDTO> dtolist = new ArrayList<CartDTO>();
        int totalprice = 0;
        for(int i = 0; i<Cart_idx.size()-1; i++) {
            CartDTO cartDTO = cartService.view(Integer.parseInt(Cart_idx.get(i)));
            dtolist.add(cartDTO);
            totalprice += cartDTO.getPrice()*cartDTO.getQuantity();
        }
        log.info("#######################"+dto.toString());
        log.info("#######################"+dtolist.toString());
        model.addAttribute("memberdto", dto);
        model.addAttribute("dtolist", dtolist);
        model.addAttribute("totalprice", totalprice);

    }

    @RequestMapping(value = "/payment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String payment(@RequestParam HashMap<String,Object> map){
        HashMap<String, Object> resultMap = new HashMap<>();

        String member_id = map.get("member_id").toString();
        MemberDTO dto = memberService.view(member_id);
        PaymentDTO paymentDTO = PaymentDTO.builder()
                .member_id(map.get("member_id").toString())
                .price(Integer.parseInt("-"+map.get("price").toString()))
                .build();

        int a = 0;
        a = a+paymentDTO.getPrice();
        log.info("이거슨 테스트:" + a);
        paymentServiceIf.memberPay(paymentDTO);
        String test = map.get("dtolist").toString();
        log.info("dtolist : " +test);

//        if (result > 0) {
//            resultMap.put("result", "success");
//        } else {
//            resultMap.put("result", "fail");
//        }


        return new Gson().toJson(resultMap);
    }

    @PostMapping("/payment")
    public void POSTpayment1() {

    }


}
