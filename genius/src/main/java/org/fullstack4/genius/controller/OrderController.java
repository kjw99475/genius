package org.fullstack4.genius.controller;

import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.CartDTO;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.dto.OrderDTO;
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
import java.text.SimpleDateFormat;
import java.util.*;

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
    public String payment(@RequestParam HashMap<String,Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();

        String member_id = map.get("member_id").toString();
        log.info("#####################"+member_id);
        MemberDTO dto = memberService.view(member_id);

        /////////////////주문 번호랑 상세 정보 insert ////////////
        int random = (int) (Math.random()*100000)+1;
        String order_num=new SimpleDateFormat("yyMMddHmss").format(new Date())+random;

        //////////////회원정보 포인트 빠져나가기//////////////////
        PaymentDTO paymentDTO = PaymentDTO.builder()
                .payment_num(order_num)
                .member_id(map.get("member_id").toString())
                .price(Integer.parseInt("-"+map.get("price").toString()))
                .method("포인트")
                .company("genius")
                .use_type("구매")
                .title("포인트 사용")
                .build();

        log.info("ajax :####"+paymentDTO);

        String cart_idx = map.get("cart_idx").toString();
        log.info("cart_idx: " + cart_idx);
        cart_idx = cart_idx.replace("[","");
        cart_idx = cart_idx.replace("]","");
        log.info("cart_idx replace: " + cart_idx);
        String[] cartlist = cart_idx.split(",");
        log.info("cartlist: " + Arrays.toString(cartlist));
        List<CartDTO> dtolist = new ArrayList<CartDTO>();
        for(int i = 0; i<cartlist.length; i++) {
            CartDTO dto1 = cartService.view(Integer.parseInt(cartlist[i]));
            dtolist.add(dto1);
        }

        log.info("dtolist: " + dtolist);





        ///////////////////////포인트 결제정보//////////////////////



        int result = 0;
        if(dto.getPoint()>Integer.parseInt(map.get("price").toString())){
            result = paymentServiceIf.memberPay(paymentDTO);
            if (result > 0) {
                for (int i = 0; i < dtolist.size(); i++) {
                    int result1 = cartService.delete(dtolist.get(i));
                }
                OrderDTO orderDTO1 = OrderDTO.builder()
                        .member_id(member_id)
                        .order_num(order_num)
                        .order_state("배송 전")
                        .total_price(Integer.parseInt(map.get("price").toString()))
                        .build();
                int regist = orderService.regist(orderDTO1);
                for (int i = 0; i < dtolist.size(); i++) {
                    OrderDTO detailorderDTO = OrderDTO.builder()
                            .member_id(member_id)
                            .order_num(order_num)
                            .book_code(dtolist.get(i).getBook_code())
                            .category_class_code(dtolist.get(i).getCategory_class_code())
                            .category_subject_code(dtolist.get(i).getCategory_subject_code())
                            .order_state("배송 전")
                            .price(dtolist.get(i).getPrice())
                            .total_price(dtolist.get(i).getPrice() * dtolist.get(i).getQuantity())
                            .amount(dtolist.get(i).getQuantity())
                            .build();
                    orderService.detailregist(detailorderDTO);
                }
                int result123 = paymentServiceIf.usepoint(paymentDTO);
                resultMap.put("result", "success");
            }else {
                resultMap.put("result", "fail");
            }

        }else{
            resultMap.put("result", "fail");
        }

        return new Gson().toJson(resultMap);
    }

    @PostMapping("/payment")
    public void POSTpayment1() {

    }


}
