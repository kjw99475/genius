package service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.service.BookServiceIf;
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
public class YUNTEST {

    @Autowired
    private BookServiceIf bookServiceIf;

    @Test
    public void testBookRegist(){
        BookDTO bookDTO= BookDTO.builder()
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
        int result = bookServiceIf.regist(bookDTO);
        log.info("======================");
        log.info("BookServiceIfTest >> regist result : " +  result);
        log.info("======================");
    }
    @Test
    public void testBookDelete(){
        int result = bookServiceIf.delete(9);
        log.info("======================");
        log.info("BookServiceIfTest >>delete result : " +  result);
        log.info("======================");
    }
    @Test
    public void testBookList(){
        log.info("=================================");
        log.info("BookServiceIfTest >> testBookList START");
        List<BookDTO> list = bookServiceIf.listAll();
        log.info(list);
        log.info("BookServiceIfTest >> testBookList END");
        log.info("=================================");
    }

    @Test
    public void testBookListByPage(){
        log.info("=================================");
        log.info("BookServiceTests >> testBookListByPage START");
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .page_size(10)
                .build();
        PageResponseDTO<BookDTO> responseDTO = bookServiceIf.BookListByPage(pageRequestDTO);
        responseDTO.getDtoList().forEach(
                vo->log.info(vo)
        );
        log.info("BookServiceTests >> testBookListByPage END");
        log.info("=================================");
    }

}
