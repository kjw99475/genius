package service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.MemberDTO;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.service.MemberServiceIf;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class GeehyunTest {
    @Autowired(required = false)
    private MemberServiceIf memberServiceIf;
    @Test
    public void pagingTest12(){
        PageRequestDTO pageRequestDTO = new PageRequestDTO();
        pageRequestDTO.setPage_size(10);
        pageRequestDTO.setPage(1);
        pageRequestDTO.setPage_block_size(10);

        PageResponseDTO<MemberDTO> responseDTO = memberServiceIf.list(pageRequestDTO);

        log.info("=====================================");
        log.info("pageRequestDTO: " + responseDTO.toString());
        log.info("===================================");

    }
}
