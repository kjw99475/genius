package mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.CartVO;
import org.fullstack4.genius.mapper.CartMapper;
import org.fullstack4.genius.service.CartServiceImpl;
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

    @Autowired(required = false)
    private CartMapper cart;

    @Test
    public void ViewCart(){
        List<CartVO> voList = cart.listAll("test");
        log.info(voList);

    }
}
