package mapper;

import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.session.SqlSessionFactory;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.mapper.BookMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.awt.print.Book;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class YUNTEST {
    @Autowired(required = false)
    private BookMapper bookMapper;

    @Test
    public void testRegistBook(){
        BookVO vo= BookVO.builder()
                .book_code("test")
                .book_name("test")
                .author("test")
                .price(12)
                .quantity(13)
                .category_class_code("c01")
                .category_subject_code("s01")
                .publisher("test")
                .book_info("test")
                .isbn("123")
                .contents("1234")
                .publication_date(LocalDate.now()).build();
        int result = bookMapper.regist(vo);
        log.info("======================");
        log.info("result : " +  result);
        log.info("======================");
    }
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
    public void testBbsListByPage(){
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(9)
                .page_size(4)
                .build();
        List<BookVO> bbsList = bookMapper.BookListByPage(pageRequestDTO);
        log.info("=================================");
        log.info(bbsList);
        log.info("=================================");
    }
    @Test
    public void testListBook(){
        List<BookVO> list = bookMapper.listAll();

        log.info("============================");
        log.info(list);
        log.info("============================");
    }
    @Test
    public void view(){
        BookVO vo = bookMapper.view(1);
        log.info("============================");
        log.info(vo);
        log.info("============================");
    }
    @Test
    public void delete(){
        int result = bookMapper.delete(7);
        log.info("============================");
        log.info("result : " + result);
        log.info("============================");
    }
    @Test
    public void testsubjectCategory(){
        log.info("=================================");
        log.info("BookMapperTests >> testsubjectCategory START");
        List<Map<String, String>> subjectList =  bookMapper.bookSubjectCategoryList();
        log.info(subjectList);
        log.info("BookMapperTests >> testsubjectCategory END");
        log.info("=================================");
    }
    @Test
    public void testclassCategory(){
        log.info("=================================");
        log.info("BookMapperTests >> testclassCategory START");
        List<Map<String, String>> classList =  bookMapper.bookClassCategoryList();
        log.info(classList);
        log.info("BookMapperTests >> testclassCategory END");
        log.info("=================================");
    }

}
