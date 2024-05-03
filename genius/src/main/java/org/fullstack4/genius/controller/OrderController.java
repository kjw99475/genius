package org.fullstack4.genius.controller;

import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.InsufficientStockException;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
    private final BookServiceIf bookService;


    @GetMapping("/payment")
    public void GETpayment(HttpServletRequest req, Model model
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
            totalprice += cartDTO.getDiscount_price()*cartDTO.getQuantity();
        }
        log.info("#######################"+dto.toString());
        log.info("#######################"+dtolist.toString());
        model.addAttribute("memberdto", dto);
        model.addAttribute("dtolist", dtolist);
        model.addAttribute("totalprice", totalprice);

    }

    @GetMapping("/payment1")
    public void GETpayment1(HttpServletRequest req, Model model
            , @RequestParam(name="book_code") String book_code
            , @RequestParam(name="quantity" ,defaultValue="1") int quantity) {
        HttpSession session = req.getSession();
        String member_id = (String) session.getAttribute("member_id");
        MemberDTO memberDTO = memberService.view(member_id);
        BookDTO bookDTO =bookService.view(book_code);
        bookDTO.setQuantity(quantity);
        log.info("payment: memberdto :"+memberDTO.toString());
        log.info("payment: bookdto :"+bookDTO.toString());
        int totalprice = bookDTO.getDiscount_price()*quantity;
        model.addAttribute("memberdto", memberDTO);
        model.addAttribute("bookdto",bookDTO);
        model.addAttribute("totalprice", totalprice);
    }


    @RequestMapping(value = "/testpayment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String testpayment(@RequestParam HashMap<String, Object> map,HttpServletRequest req) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<>();

        String member_id = map.get("member_id").toString();
        resultMap.put("result", "fail");
        log.info("테스트:" + req.getParameter("order_addr1"));
        MemberDTO dto = memberService.view(member_id);

        /////////////////주문 번호랑 상세 정보 insert ////////////
        int random = (int) (Math.random()*100000)+1;
        String order_num=new SimpleDateFormat("yyMMddHmss").format(new Date())+"-"+random;

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

        OrderDTO orderDTO1 = OrderDTO.builder()
                .member_id(member_id)
                .order_num(order_num)
                .order_state("배송 전")
                .total_price(Integer.parseInt(map.get("price").toString()))
                .order_addr1(req.getParameter("order_addr1"))
                .order_addr2(req.getParameter("order_addr2"))
                .delivery_addr1(req.getParameter("order_addr1"))
                .delivery_addr2(req.getParameter("order_addr2"))
                .order_name(req.getParameter("name"))
                .order_phone(req.getParameter("phone"))
                .order_zipcode(req.getParameter("order_zip_code"))
                .build();
        try {
            if (dto.getPoint() > Integer.parseInt(map.get("price").toString())) {
                paymentServiceIf.testPayment(paymentDTO, orderDTO1, dtolist, member_id, order_num, Integer.parseInt(map.get("price").toString()));
                for (int i = 0; i < dtolist.size(); i++) {
                    cartService.delete(dtolist.get(i));
                }
                resultMap.put("result", "success");
                resultMap.put("msg", "성공적으로 결제되었습니다.");
            } else {
                resultMap.put("result", "fail");
                resultMap.put("msg", "포인트가 부족합니다.");
            }
        }
        catch(InsufficientStockException e) {
                resultMap.put("result", "fail");
                resultMap.put("msg", e.getMessage());
        }


        return new Gson().toJson(resultMap);
    }

    @RequestMapping(value="testuserpayment.dox" ,method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String testUserpayment(@RequestParam HashMap<String, Object> map,HttpServletRequest req) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<>();
        String member_id = map.get("member_id").toString();
        log.info("#####################"+member_id);
        MemberDTO dto = memberService.view(member_id);


        int random = (int) (Math.random()*100000)+1;
        String order_num=new SimpleDateFormat("yyMMddHmss").format(new Date())+"-"+random;

        //////////////////포인트 빠져나가는 DTO및 포인트 결제정보 등록 테이블//////////////////////
        PaymentDTO paymentDTO = PaymentDTO.builder()
                .payment_num(order_num)
                .member_id(map.get("member_id").toString())
                .price(Integer.parseInt("-"+map.get("price").toString()))
                .method("포인트")
                .company("genius")
                .use_type("구매")
                .title("포인트 사용")
                .build();

        ///////////////////////////////주문정보 테이블/////////////////////
        OrderDTO orderDTO = OrderDTO.builder()
                .member_id(member_id)
                .order_num(order_num)
                .order_state("배송 전")
                .total_price(Integer.parseInt(map.get("price").toString()))
                .order_addr1(req.getParameter("order_addr1"))
                .order_addr2(req.getParameter("order_addr2"))
                .delivery_addr1(req.getParameter("order_addr1"))
                .delivery_addr2(req.getParameter("order_addr2"))
                .order_name(req.getParameter("name"))
                .order_phone(req.getParameter("phone"))
                .order_zipcode(req.getParameter("order_zip_code"))
                .build();

        ///////////////////////////주문디테일 테이블//////////////////////////////////////////
        BookDTO bookDTO = bookService.view(map.get("book_code").toString());
        OrderDTO detailorderDTO = OrderDTO.builder()
                .member_id(member_id)
                .order_num(order_num)
                .book_code(bookDTO.getBook_code())
                .book_name(bookDTO.getBook_name())
                .category_class_code(bookDTO.getCategory_class_code())
                .category_subject_code(bookDTO.getCategory_subject_code())
                .order_state("배송 전")
                .price(bookDTO.getDiscount_price())
                .total_price(Integer.parseInt(map.get("price").toString()))
                .amount(Integer.parseInt(map.get("quantity").toString()))
                .build();

        int result = 0;
        try {
            if (dto.getPoint() > Integer.parseInt(map.get("price").toString())) {
                paymentServiceIf.testUserPayment(paymentDTO, orderDTO, detailorderDTO, member_id, order_num, Integer.parseInt(map.get("price").toString()));
                resultMap.put("result", "success");
                resultMap.put("msg","정상적으로 결제되었습니다");
            } else {
                resultMap.put("result", "fail");
                resultMap.put("msg", "포인트가 모자랍니다.");
            }
        }catch(InsufficientStockException e) {
            resultMap.put("result", "error");
            resultMap.put("msg",e.getMessage());
            return new Gson().toJson(resultMap);
        }
        return new Gson().toJson(resultMap);
    }

    @RequestMapping(value = "/userpayment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String userpayment(@RequestParam HashMap<String,Object> map,
                              HttpServletRequest req) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<>();

        String member_id = map.get("member_id").toString();
        log.info("#####################"+member_id);
        MemberDTO dto = memberService.view(member_id);


        int random = (int) (Math.random()*100000)+1;
        String order_num=new SimpleDateFormat("yyMMddHmss").format(new Date())+"-"+random;

        //////////////////포인트 빠져나가는 DTO및 포인트 결제정보 등록 테이블//////////////////////
        PaymentDTO paymentDTO = PaymentDTO.builder()
                .payment_num(order_num)
                .member_id(map.get("member_id").toString())
                .price(Integer.parseInt("-"+map.get("price").toString()))
                .method("포인트")
                .company("genius")
                .use_type("구매")
                .title("포인트 사용")
                .build();

        ///////////////////////////////주문정보 테이블/////////////////////
        OrderDTO orderDTO = OrderDTO.builder()
                .member_id(member_id)
                .order_num(order_num)
                .order_state("배송 전")
                .total_price(Integer.parseInt(map.get("price").toString()))
                .order_addr1(req.getParameter("order_addr1"))
                .order_addr2(req.getParameter("order_addr2"))
                .delivery_addr1(req.getParameter("order_addr1"))
                .delivery_addr2(req.getParameter("order_addr2"))
                .order_name(req.getParameter("name"))
                .order_phone(req.getParameter("phone"))
                .order_zipcode(req.getParameter("order_zip_code"))
                .build();

        ///////////////////////////주문디테일 테이블//////////////////////////////////////////
        BookDTO bookDTO = bookService.view(map.get("book_code").toString());
        OrderDTO detailorderDTO = OrderDTO.builder()
                .member_id(member_id)
                .order_num(order_num)
                .book_code(bookDTO.getBook_code())
                .book_name(bookDTO.getBook_name())
                .category_class_code(bookDTO.getCategory_class_code())
                .category_subject_code(bookDTO.getCategory_subject_code())
                .order_state("배송 전")
                .price(bookDTO.getDiscount_price())
                .total_price(Integer.parseInt(map.get("price").toString()))
                .amount(Integer.parseInt(map.get("quantity").toString()))
                .build();

        
        /////////////////////////상품 출고 테이블//////////////////////////
        /////////////////////////상품 재고 줄이는 테이블////////////////////
        ////////////////////////장바구니 삭제 테이블///////////////////////////
        ////////////////////////배송정보 테이블///////////////////////////

        int result = 0;
        if(dto.getPoint()>Integer.parseInt(map.get("price").toString())){
            result = paymentServiceIf.memberPay(paymentDTO);
            if (result > 0) {
                int regist = orderService.regist(orderDTO);
                int deliveryregist = orderService.deliveryRegist(orderDTO);
                int detailregist = orderService.detailregist(detailorderDTO);
                int result123 = paymentServiceIf.usepoint(paymentDTO);
                paymentServiceIf.releaseBook(detailorderDTO);
                paymentServiceIf.salesBook(detailorderDTO);
                paymentServiceIf.revenue(Integer.parseInt(map.get("price").toString()));
                resultMap.put("result", "success");
            }else {
                resultMap.put("result", "fail");
                resultMap.put("msg","오류가 발생했습니다.");
            }

        }else{
            resultMap.put("result","fail");
            resultMap.put("msg", "포인트가 모자릅니다.");
        }

        return new Gson().toJson(resultMap);

    }


//    @RequestMapping(value = "/cartpayment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//    @ResponseBody
//    public String cartpayment(@RequestParam HashMap<String,Object> map,HttpServletRequest req) throws Exception {
//        HashMap<String, Object> resultMap = new HashMap<>();
//
//        String member_id = map.get("member_id").toString();
//        resultMap.put("result", "fail");
//        log.info("테스트:" + req.getParameter("order_addr1"));
//        MemberDTO dto = memberService.view(member_id);
//
//        /////////////////주문 번호랑 상세 정보 insert ////////////
//        int random = (int) (Math.random()*100000)+1;
//        String order_num=new SimpleDateFormat("yyMMddHmss").format(new Date())+"-"+random;
//
//        //////////////회원정보 포인트 빠져나가기//////////////////
//        PaymentDTO paymentDTO = PaymentDTO.builder()
//                .payment_num(order_num)
//                .member_id(map.get("member_id").toString())
//                .price(Integer.parseInt("-"+map.get("price").toString()))
//                .method("포인트")
//                .company("genius")
//                .use_type("구매")
//                .title("포인트 사용")
//                .build();
//
//        log.info("ajax :####"+paymentDTO);
//
//        String cart_idx = map.get("cart_idx").toString();
//        log.info("cart_idx: " + cart_idx);
//        cart_idx = cart_idx.replace("[","");
//        cart_idx = cart_idx.replace("]","");
//        log.info("cart_idx replace: " + cart_idx);
//        String[] cartlist = cart_idx.split(",");
//        log.info("cartlist: " + Arrays.toString(cartlist));
//        List<CartDTO> dtolist = new ArrayList<CartDTO>();
//        for(int i = 0; i<cartlist.length; i++) {
//            CartDTO dto1 = cartService.view(Integer.parseInt(cartlist[i]));
//            dtolist.add(dto1);
//        }
//
//        log.info("dtolist: " + dtolist);
//
//
//
//
//
//        ///////////////////////포인트 결제정보//////////////////////
//
//
//
//        int result = 0;
//        if(dto.getPoint()>Integer.parseInt(map.get("price").toString())){
//            result = paymentServiceIf.memberPay(paymentDTO);
//            if (result > 0) {
//
//                OrderDTO orderDTO1 = OrderDTO.builder()
//                        .member_id(member_id)
//                        .order_num(order_num)
//                        .order_state("배송 전")
//                        .total_price(Integer.parseInt(map.get("price").toString()))
//                        .order_addr1(req.getParameter("order_addr1"))
//                        .order_addr2(req.getParameter("order_addr2"))
//                        .delivery_addr1(req.getParameter("order_addr1"))
//                        .delivery_addr2(req.getParameter("order_addr2"))
//                        .order_name(req.getParameter("name"))
//                        .order_phone(req.getParameter("phone"))
//                        .order_zipcode(req.getParameter("order_zip_code"))
//                        .build();
//
//                int regist = orderService.regist(orderDTO1);
//                int deliveryregist = orderService.deliveryRegist(orderDTO1);
//
//                for (int i = 0; i < dtolist.size(); i++) {
//                    OrderDTO detailorderDTO = OrderDTO.builder()
//                            .member_id(member_id)
//                            .order_num(order_num)
//                            .book_code(dtolist.get(i).getBook_code())
//                            .book_name(dtolist.get(i).getBook_name())
//                            .category_class_code(dtolist.get(i).getCategory_class_code())
//                            .category_subject_code(dtolist.get(i).getCategory_subject_code())
//                            .order_state("배송 전")
//                            .price(dtolist.get(i).getPrice())
//                            .total_price(dtolist.get(i).getPrice() * dtolist.get(i).getQuantity())
//                            .amount(dtolist.get(i).getQuantity())
//                            .build();
//                    orderService.detailregist(detailorderDTO);
//                    paymentServiceIf.releaseBook(detailorderDTO);
//                    paymentServiceIf.salesBook(detailorderDTO);
//                    paymentServiceIf.revenue(Integer.parseInt(map.get("price").toString()));
//                }
//                log.info("4##############################");
//                int result123 = paymentServiceIf.usepoint(paymentDTO);
//
//                for (int i = 0; i < dtolist.size(); i++) {
//                    int result1 = cartService.delete(dtolist.get(i));
//                }
//                resultMap.put("result", "success");
//            }else {
//                resultMap.put("result", "fail");
//            }
//
//        }else{
//            resultMap.put("result", "fail");
//        }
//        log.info("5##############################");
//        return new Gson().toJson(resultMap);
//    }

    @PostMapping("/payment")
    public void POSTpayment1() {

    }


}
