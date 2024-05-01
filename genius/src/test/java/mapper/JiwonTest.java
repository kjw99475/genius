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
import java.time.LocalDateTime;
import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class JiwonTest {
    @Autowired(required = false)
    private BbsMapper bbsMapper;

    @Test
    public void testBbsList(){
        List<BbsVO> list = bbsMapper.listAll("bc01");
        log.info("=================================");
        log.info(list.size());
        log.info("=================================");
    }

    @Test
    public void testBbsListByPage(){
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .category_code("bc01")
                .page_size(4)
                .build();
        List<BbsVO> list = bbsMapper.bbsListByPage(pageRequestDTO);
        log.info("=================================");
        log.info(list.toString());
    }

    @Test
    public void testBbsInsert(){
        int result = bbsMapper.regist(BbsVO.builder()
                        .bbs_title("테스트 제목33")
                        .category_code("bc01")
                        .member_id("홍길동")
                        .bbs_contents("테서터 내용")
                        .reg_date(LocalDate.parse("2024-04-28"))
                        .fileYN("N")
                .build());
        log.info("==================================");
        log.info(result);
    }

    @Test
    public void testBbsView(){
        BbsVO bbsVO = bbsMapper.view(21);
        log.info("=================================");
        log.info(bbsVO.toString());
    }

    @Test
    public void testBbsModify(){
        int result = bbsMapper.modify(BbsVO.builder()
                        .bbs_idx(12)
                        .bbs_title("제목수정테스트")
                        .member_id("test1234")
                        .bbs_contents("내용수정테스트")
                        .fileYN("N")
                        .reg_date(LocalDate.parse("2024-04-29"))
                .build());
        log.info("=================================");
        log.info(result);
    }

    @Test
    public void testBbsDelete() {
        int result = bbsMapper.delete(11);
    }

    @Test
    public void testBbsTotalCount() {
        int result = bbsMapper.bbsTotalCount(PageRequestDTO.builder()
                .search_type(new String[]{""})
                .search_word("") //서치 어ㅏ직 안됨
                .search_date1(LocalDate.parse("2024-04-25"))
                .search_date2(LocalDate.parse("2024-04-28"))
                .build());
        log.info("개수 : " + result);
    }

    @Test
    public void testBbsprepost() {
        BbsVO bbsVO = bbsMapper.preView(1, "bc01");
//        BbsVO bbsVO = bbsMapper.postView(4, "bc01");
        log.info(bbsVO.toString());
    }
}