package mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.mapper.BookMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.awt.print.Book;
import java.time.LocalDate;
import java.util.List;

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

}
