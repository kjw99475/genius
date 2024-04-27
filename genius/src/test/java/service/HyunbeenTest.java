package service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.CartDTO;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PaymentDTO;
import org.fullstack4.genius.service.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

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
    public void viewPayment(){
        String Member_id = "test";
        PaymentDTO dto = payment.view(Member_id);

        log.info("===================================");
        log.info("memberDTO: " + dto.toString());
        log.info("===================================");
    }
}
