package service;

import lombok.extern.log4j.Log4j2;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
        int idx = 1;
        int result = order.cancelOrder(idx);

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
        OrderDTO orderDTO = OrderDTO.builder()
                .order_num("240501155033-47610")
                .order_refund_request("Y")
                .build();
        int result = order.requestRefund(orderDTO);

        log.info("========="+orderDTO.toString());
    }
}
