package org.fullstack4.genius.controller;


import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;
import org.fullstack4.genius.Common.FileUtil;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.*;

@Log4j2
@Controller
@RequestMapping(value="/mypage")
@RequiredArgsConstructor
public class MypageController {

    private final PaymentServiceIf paymentService;
    private final CartServiceIf cartService;
    private final MemberServiceIf memberService;
    private final QnaServiceIf qnaService;
    private final OrderServiceIf orderService;

    @GetMapping("/mypage")
    public String GETMypage(HttpServletRequest request,
                          HttpServletResponse response,
                          Model model){
        HttpSession session = request.getSession();
        String member_id = CommonUtil.parseString(session.getAttribute("member_id"));
        MemberDTO memberDTO = memberService.view(member_id);
        model.addAttribute("memberDTO", memberDTO);
        return "/mypage/mypage";
    }

    @PostMapping("/mypage")
    public String POSTMypage(MemberDTO newMemberDTO,
                           HttpServletRequest request,
                           RedirectAttributes redirectAttributes,
                           @RequestParam("file") MultipartFile file){
        log.info("===========================================");
        log.info("MypageController >>>>>>>>>>>>>>>>> POSTMypage");
        HttpSession session = request.getSession();
        String member_id = CommonUtil.parseString(session.getAttribute("member_id"));
        MemberDTO orgMemberDTO = memberService.view(member_id);
        newMemberDTO.setMember_id(member_id);
        FileDTO fileDTO = null;
        if(file.getSize() > 0) {
            String uploadFolder =  CommonUtil.getUploadFolder(request, "profile");
            fileDTO = FileDTO.builder()
                    .file(file)
                    .uploadFolder(uploadFolder)
                    .build();
        } else {
            newMemberDTO.setProfile(orgMemberDTO.getProfile());
        }
        int result = memberService.modifyInfo(newMemberDTO, fileDTO);
        if(result > 0 ){
            log.info("정보 수정 성공");
        } else {
            redirectAttributes.addFlashAttribute("err", "정보 수정 실패");
            log.info("정보 수정 실패");
        }
        return "redirect:/mypage/mypage";
    }

    @GetMapping("/myquestions")
    public void GETQuestion(@Valid PageRequestDTO pageRequestDTO,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes,
                            HttpServletRequest request,
                            Model model){
        if(bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        HttpSession session = request.getSession();
        pageRequestDTO.setMember_id((String) session.getAttribute("member_id"));
        pageRequestDTO.setPage_size(10);
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<QnaDTO> responseDTO = qnaService.qnaListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }

    @PostMapping("/myquestions")
    public void POSTQuestion(){

    }

    @GetMapping("/payhistory")
    public void GETPayhistory(HttpServletRequest req,Model model
                            ,PageRequestDTO pageRequestDTO){
        HttpSession session = req.getSession();
        String member_id = session.getAttribute("member_id").toString();
//        List<OrderDTO> dtolist = paymentService.viewOrder(member_id);

        pageRequestDTO.setMember_id(member_id);
        pageRequestDTO.setPage_size(10);
        pageRequestDTO.setPage_block_size(10);

        PageResponseDTO<OrderDTO> responseDTO = paymentService.viewOrderListByPage(pageRequestDTO);

        List<List<OrderDTO>> detaillist = new ArrayList<List<OrderDTO>>();
        for(int i = 0; i < responseDTO.getDtoList().size(); i++){
            String ordernum = responseDTO.getDtoList().get(i).getOrder_num();
            List<OrderDTO> detail = paymentService.viewOrderdetail(ordernum);
            detaillist.add(detail);
        }

        log.info("===================================시작=============================");
        log.info("responseDTO : " + responseDTO.getDtoList());
        log.info("detaillist : " + detaillist);
        log.info("===================================끝=============================");

        model.addAttribute("dtolist", responseDTO.getDtoList());
        model.addAttribute("pageDTO", responseDTO);
        model.addAttribute("detaillist", detaillist);
    }

    @PostMapping("/payhistory")
    public void POSTPayhistory(){

    }

    @GetMapping("/cart")
    public void GETCart(Model model, HttpServletRequest req,
                        @RequestParam(name="page", defaultValue = "1")int page,
                        PageRequestDTO pageRequestDTO){
        HttpSession session = req.getSession();
        String member_id = (String) session.getAttribute("member_id");


        pageRequestDTO.setPage_size(5);
        pageRequestDTO.setPage(page);
        pageRequestDTO.setPage_block_size(10);

        PageResponseDTO<CartDTO> responseDTO = cartService.CartListByPage(member_id,pageRequestDTO);
//        List<CartDTO> dto =cartService.listAll(member_id);
        model.addAttribute("pageDTO", responseDTO);
        model.addAttribute("list",responseDTO.getDtoList());
    }


    @RequestMapping(value = "/addcart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String AddCart(@RequestParam HashMap<String,Object> map){
        String BookCodeList = map.get("book_code").toString();
        BookCodeList = BookCodeList.replace("\"","");
        BookCodeList = BookCodeList.replace("[","");
        BookCodeList = BookCodeList.replace("]","");
        String[] bookCodeList = BookCodeList.split(",");
        log.info("bookCodeList : " + Arrays.toString(bookCodeList));
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        int result = 0;
        for(int i = 0 ; i < bookCodeList.length; i++) {
            int exist = cartService.exist(bookCodeList[i], map.get("member_id").toString());

            if (exist != 0) {
                CartDTO cartDTO = CartDTO.builder()
                        .book_code(bookCodeList[i])
                        .member_id(map.get("member_id").toString())
                        .quantity(Integer.parseInt(map.get("quantity").toString()))
                        .build();
                result = cartService.updateCart(cartDTO);
            } else if (exist == 0) {
                CartDTO cartDTO = CartDTO.builder()
                        .book_code(bookCodeList[i])
                        .member_id(map.get("member_id").toString())
                        .quantity(Integer.parseInt(map.get("quantity").toString()))
                        .build();
                result = cartService.regist(cartDTO);
            }
        }
        if(result > 0) {
            resultMap.put("result", "success");
        }else{
            resultMap.put("result", "fail");
        }
        return new Gson().toJson(resultMap);
    }

    @RequestMapping(value = "/addcart1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String AddCart1(@RequestParam HashMap<String,Object> map){
        HashMap<String, Object> resultMap = new HashMap<>();
            CartDTO cartDTO = CartDTO.builder()
                    .book_code(map.get("book_code").toString())
                    .member_id(map.get("member_id").toString())
                    .quantity(Integer.parseInt(map.get("quantity").toString()))
                    .build();
            int result = cartService.updateCart1(cartDTO);
            if (result > 0) {
                resultMap.put("result", "success");
            } else {
                resultMap.put("result", "fail");
            }


        return new Gson().toJson(resultMap);
    }
    @PostMapping("/cart")
    public void POSTCart(){

    }

    @RequestMapping(value = "/cartdelete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String DeleteCart(@RequestParam HashMap<String,Object> map){
        HashMap<String, Object> resultMap = new HashMap<>();
        String cartList = map.get("cart_idx").toString();
        cartList = cartList.replace("\"","");
        cartList = cartList.replace("[","");
        cartList = cartList.replace("]","");
        String[] CartList = cartList.split(",");
        int result = 0;
        for(int i=0; i<CartList.length; i++) {
            CartDTO cartDTO = CartDTO.builder()
                    .cart_idx(Integer.parseInt(CartList[i]))
                    .member_id(map.get("member_id").toString())
                    .build();
            result=cartService.delete(cartDTO);
        }

        if(result>0){
            resultMap.put("result", "success");
        }else{
            resultMap.put("result", "fail");
        }

        return new Gson().toJson(resultMap);
    }

    @GetMapping("/point")
    public void GETPoint(Model model,HttpServletRequest req,
                         PageRequestDTO pageRequestDTO){
        HttpSession session = req.getSession();
        String member_id = (String) session.getAttribute("member_id");
        int mypoint = paymentService.pointview(member_id);

        pageRequestDTO.setMember_id(member_id);
        pageRequestDTO.setPage_size(10);
        pageRequestDTO.setPage_block_size(10);

        PageResponseDTO<PaymentDTO> responseDTO = paymentService.PaymentListByPage(pageRequestDTO);


        model.addAttribute("point",mypoint);
        model.addAttribute("mypaymentlist",responseDTO.getDtoList());
        model.addAttribute("pageDTO", responseDTO);

    }

    @PostMapping("/point")
    public void POSTPoint(){

    }

    @RequestMapping(value = "/point.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String ChargePoint(Model model , @RequestParam HashMap<String, Object> map){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        PaymentDTO dto = PaymentDTO.builder()
                .payment_num(map.get("payment_num").toString())
                .member_id(map.get("member_id").toString())
                .price(Integer.parseInt(map.get("price").toString()))
                .method(map.get("method").toString())
                .company(map.get("company").toString())
                .build();
        log.info("=====================================================");
        log.info("PaymentDTO : " + dto);
        log.info("=====================================================");
        int result = paymentService.charge(dto);
        if(result > 0) {
            int result2 = paymentService.memberPay(dto);
            if(result2 > 0) {
                resultMap.put("result", "success");
            }
            else{
                resultMap.put("result", "fail");
            }
        }
        else{
            resultMap.put("result", "fail");
        }

        return new Gson().toJson(resultMap);
    }


    @RequestMapping(value = "/refundRequest.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String refundRequest(@RequestParam HashMap<String,Object> map){
        HashMap<String, Object> resultMap = new HashMap<>();
        log.info("###################"+map.toString());
        OrderDTO orderDTO = OrderDTO.builder()
                .order_num(map.get("order_num").toString())
                .order_state("환불 요청")
                .order_refund_request(map.get("order_refund_request").toString())
                .build();
        int result = orderService.requestRefund(orderDTO);
        log.info(result);
        if(result > 0) {
            resultMap.put("result", "success");
        }
        else{
            resultMap.put("result", "fail");
            resultMap.put("message", "오류");
        }

        return new Gson().toJson(resultMap);
    }

    @RequestMapping(value = "/cancelRequest.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String cancelRequest(@RequestParam HashMap<String,Object> map){
        HashMap<String, Object> resultMap = new HashMap<>();
        log.info("###################"+map.toString());

        String order_num = map.get("order_num").toString();
        List<OrderDTO> orderDTOImp = orderService.AdminOrderdetail(order_num);

        OrderDTO orderDTO = OrderDTO.builder()
                .order_num(map.get("order_num").toString())
                .order_state("주문 취소")
                .cancel_YN(map.get("order_cancel_request").toString())
                .build();
        int result = orderService.cancelOrder(orderDTO);
        log.info(result);
        if(result > 0) {
            PaymentDTO paymentDTO = PaymentDTO.builder()
                    .payment_num(order_num)
                    .member_id(orderDTOImp.get(0).getMember_id())
                    .price(orderDTOImp.get(0).getTotal_price())
                    .method("포인트")
                    .company("genius")
                    .use_type("주문 취소")
                    .title("포인트 환불")
                    .build();

            for(int i = 0; i<orderDTOImp.size();i++){
                OrderDTO dto = orderDTOImp.get(i);
                dto.setAmount(Integer.parseInt("-"+orderDTOImp.get(i).getAmount()));
                log.info("테슽테틋ㅅ: " + dto.toString());
                paymentService.salesBook(dto);
                paymentService.deleteBookRelease(dto);
            }

            paymentService.memberPay(paymentDTO);
            paymentService.usepoint(paymentDTO);
            resultMap.put("result", "success");
        }
        else{
            resultMap.put("result", "fail");
            resultMap.put("message", "오류");
        }

        return new Gson().toJson(resultMap);
    }
}
