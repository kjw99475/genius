package service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.CartDTO;
import org.fullstack4.genius.service.CartServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class HyunbeenTest {

    @Autowired(required = false)
    private CartServiceImpl cart;

    @Test
    public void insertCart(){
        CartDTO dto = CartDTO.builder()
                .member_id("test")
                .book_code("b0003")
                .quantity(2)
                .build();

        cart.regist(dto);
    }
}
