package mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.mapper.CartMapper;
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
    private CartMapper cart;

    @Test
    public void insertCart(){

    }
}
