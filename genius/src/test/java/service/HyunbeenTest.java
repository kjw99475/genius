package service;

import com.google.gson.Gson;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.InsufficientStockException;
import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;


import java.sql.Array;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class HyunbeenTest {

    @Autowired
    private CartServiceIf cart;

    @Autowired
    private MemberServiceIf member;

    @Autowired
    private OrderServiceIf order;

    @Autowired
    private PaymentServiceIf payment;

    @Test
    public void insertCart(){
        CartDTO dto = CartDTO.builder()
                .member_id("test")
                .book_code("b0003")
                .quantity(2)
                .build();

        log.info("================================");
        log.info("CartDTO() : " + dto.toString());
        log.info("================================");

        int result = cart.regist(dto);
    }

    @Test
    public void viewCart(){
        List<CartDTO> dto = cart.listAll("test");
        log.info("================================");
        log.info("CartDTO() : " + dto.toString());
        log.info("================================");
    }

    @Test
    public void deleteCart(){
        CartDTO cartdto = CartDTO.builder()
                .member_id("test")
                .cart_idx(1)
                .build();

        log.info("==============================");
        log.info("CartDTO() : " + cartdto.toString());
        log.info("==============================");

        int result = cart.delete(cartdto);
        log.info("==============================");
        log.info("result : "+ result);
        log.info("==============================");
    }

    @Test
    public void viewMember(){
        String Member_id = "test";
        MemberDTO dto = member.view(Member_id);

        log.info("===================================");
        log.info("memberDTO: " + dto.toString());
        log.info("===================================");
    }

    @Test
    public void viewOrder(){
        String Member_id = "test";
        OrderDTO dto = order.view(Member_id);

        List<OrderDTO> dtolist2 = order.AdminlistAll();
        List<OrderDTO> dtolist = order.listAll(Member_id);
        List<OrderDTO> dtolist1 = order.orderDetail("o00001");

        log.info("===================================");
        log.info("memberDTO: " + dto.toString());
        log.info("memberDTO: " + dtolist.toString());
        log.info("memberDTO: " + dtolist1.toString());
        log.info("memberDTO: " + dtolist2.toString());
        log.info("===================================");
    }

    @Test
    public void orderCancel(){
        OrderDTO orderDTO = new OrderDTO();
        int result = order.cancelOrder(orderDTO);

        log.info("===================================");
        log.info("result: " + result);
        log.info("===================================");
    }

    @Test
    public void viewPayment(){
        String Member_id = "test";
        PaymentDTO dto = payment.view(Member_id);

        log.info("===================================");
        log.info("memberDTO: " + dto.toString());
        log.info("===================================");
    }

    @Test
    public void InsertPayment(){
        PaymentDTO dto = PaymentDTO.builder()
                .payment_num("12121-12121")
                .member_id("test")
                .price(100)
                .method("card")
                .company("kg")
                .build();

        log.info("=====================================================");
        log.info("PaymentDTO : " + dto);
        log.info("=====================================================");

        int result = payment.charge(dto);

        log.info("=====================================================");
        log.info("result : " + result);
        log.info("=====================================================");

    }

    @Test
    public void Orderview(){
        String id = "test";
        List<OrderDTO> dtolist = payment.viewOrder(id);
        log.info("=====================================");
        log.info("dtolist: " + dtolist.toString());
        log.info("=====================================");

        List<List<OrderDTO>> detaillist = new ArrayList<List<OrderDTO>>();
        for(int i = 0; i < dtolist.size(); i++){
            String ordernum = dtolist.get(i).getOrder_num();
            List<OrderDTO> detail = payment.viewOrderdetail(ordernum);
            log.info("=====================================");
            log.info("detail"+i+": " + detail.toString());
            log.info("=====================================");
            detaillist.add(detail);
        }

        log.info("=====================================");
        log.info("detaillist  "+" : " + detaillist.toString());
        log.info("=====================================");
    }

    @Test
    public void AdminOrder(){
//        List<OrderDTO> list = order.AdminlistAll();
//        log.info("====================================");
//        log.info("list: " + list.toString());
//        log.info("====================================");

        OrderDTO dto = OrderDTO.builder()
                .order_num("o00001")
                .delivery_company("CJ대한통운")
                .build();
        int result = order.updateDcompany(dto);
    }

    @Test
    public void garadata(){


        for(int i = 0; i<10;i++) {
            int random = (int) (Math.random()*100000)+1;
            String order_num=new SimpleDateFormat("yyMMddHmss").format(new Date())+"-"+random;
            OrderDTO orderDTO = OrderDTO.builder()
                    .member_id("test")
                    .order_num(order_num)
                    .order_state("배송 전")
                    .total_price(10000 + (20 * i))
                    .delivery_addr1("서울시 중랑구")
                    .delivery_addr2("테스트 주소")
                    .build();

            int regist = order.regist(orderDTO);
            int regist1 = order.deliveryRegist(orderDTO);
        }

    }

    @Test
    public void pagingTest12(){
        String[] search_type = new String[]{"01","02"};
        List<OrderDTO> list = order.AdminlistAll();
        PageRequestDTO pageRequestDTO = new PageRequestDTO();
        pageRequestDTO.setPage_size(10);
        pageRequestDTO.setPage(11);
        pageRequestDTO.setSearch_word("배송 전");
        pageRequestDTO.setType("01");
        pageRequestDTO.setPage_block_size(10);

        PageResponseDTO<OrderDTO> responseDTO = order.OrderListByPage(pageRequestDTO);

        log.info("=====================================");
        log.info("pageRequestDTO: " + responseDTO.toString());
        log.info("===================================");


//        String member_id ="test";
//        PageRequestDTO requestDTO = new PageRequestDTO();
//        requestDTO.setPage_size(10);
//        requestDTO.setPage(1);
//        requestDTO.setPage_block_size(10);
//
//
////        PageResponseDTO<OrderDTO> responseDTO = payment.viewOrderListByPage(member_id,requestDTO);
//        PageResponseDTO<PaymentDTO> responseDTO = payment.PaymentListByPage(member_id,requestDTO);
//        log.info("===================================");
//        log.info("responseDTO: " + responseDTO.toString());
//        log.info("===================================");

    }

    @Test
    public void detailOrder(){
//        OrderDTO orderDTO = OrderDTO.builder()
//                .order_num("240501155033-47610")
//                .order_refund_request("Y")
//                .build();
//        int result = order.requestRefund(orderDTO);
//
//        log.info("========="+orderDTO.toString());

        int total_price = 300;
        int result = payment.revenue(total_price);
        log.info("===================================");
        log.info("total_price: " + total_price);
        log.info("result: " + result);
        log.info("==================================");
    }

    @Test
    public void gara(){
//        String[] bookCodeList = new String[]{"c03s0333444","c03s0351542","c03s0333145","c03s0351322"};
//        String[] memberList = new String[]{"admin","dltjdrp123","wjddirdyd123","wjdwndqn123"};
//        log.info("bookCodeList : " + Arrays.toString(bookCodeList));
//
//        int result = 0;
//        for(int i = 0 ; i < bookCodeList.length; i++) {
//            int exist = cart.exist(bookCodeList[i], memberList[i]);
//
//            if (exist != 0) {
//                CartDTO cartDTO = CartDTO.builder()
//                        .book_code(bookCodeList[i])
//                        .member_id(memberList[i])
//                        .quantity(i)
//                        .build();
//                result = cart.updateCart(cartDTO);
//            } else if (exist == 0) {
//                CartDTO cartDTO = CartDTO.builder()
//                        .book_code(bookCodeList[i])
//                        .member_id(memberList[i])
//                        .quantity(i)
//                        .build();
//                result = cart.regist(cartDTO);
//            }
//        }


        HashMap<String, Object> resultMap = new HashMap<>();

        String member_id = "admin";
        resultMap.put("result", "fail");
        MemberDTO dto = member.view(member_id);

        /////////////////주문 번호랑 상세 정보 insert ////////////
        int random = (int) (Math.random()*100000)+1;
        String order_num=new SimpleDateFormat("yyMMddHmss").format(new Date())+"-"+random;

        //////////////회원정보 포인트 빠져나가기//////////////////
        PaymentDTO paymentDTO = PaymentDTO.builder()
                .payment_num(order_num)
                .member_id(member_id)
                .price(Integer.parseInt("-"+40600))
                .method("포인트")
                .company("genius")
                .use_type("구매")
                .title("포인트 사용")
                .build();

        log.info("ajax :####"+paymentDTO);

        String[] cartlist = new String[]{"91","83"};
        log.info("cartlist: " + Arrays.toString(cartlist));
        List<CartDTO> dtolist = new ArrayList<CartDTO>();
        for(int i = 0; i<cartlist.length; i++) {
            CartDTO dto1 = cart.view(Integer.parseInt(cartlist[i]));
            dtolist.add(dto1);
        }

        OrderDTO orderDTO1 = OrderDTO.builder()
                .member_id(member_id)
                .order_num(order_num)
                .order_state("배송 전")
                .total_price(Integer.parseInt("40600"))
                .order_addr1("경복궁")
                .order_addr2("서울 종로구 사직로 161")
                .delivery_addr2("경복궁")
                .delivery_addr1("서울 종로구 사직로 161")
                .order_name("관리자")
                .order_phone("01043734457")
                .order_zipcode("03045")
                .build();
        try {
            if (dto.getPoint() > 40600) {
                payment.testPayment(paymentDTO, orderDTO1, dtolist, member_id, order_num, 40600);
                for (int i = 0; i < dtolist.size(); i++) {
                    cart.delete(dtolist.get(i));
                }

                log.info("성공적으로 결제되었습니다.");
            } else {

                log.info("포인트가 부족합니다.");
            }
        }
        catch(InsufficientStockException e) {
            log.info(e.getMessage());
        }




    }
}
