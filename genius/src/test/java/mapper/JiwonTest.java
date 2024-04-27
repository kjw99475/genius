package mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.dto.BbsDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.mapper.BbsMapper;
import org.fullstack4.genius.mapper.BookMapper;
import org.fullstack4.genius.mapper.ReviewMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;
import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class JiwonTest {
    @Autowired(required = false)
    private BookMapper bookMapper;
    @Autowired(required = false)
    private BbsMapper bbsMapper;

    @Autowired(required = false)
    private ReviewMapper reviewMapper;

    @Test
    public void testTotalCount(){
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .page_size(4)
                .build();
        int total_count = bookMapper.BookTotalCount(pageRequestDTO);
        log.info("=================================");
        log.info("testBbsTotalCount : " + total_count);
        log.info("=================================");
    }

    @Test
    public void testBookList(){
        List<BbsVO> list = bbsMapper.listAll();
        log.info("=================================");
        log.info(list);
        log.info("=================================");
    }
}
