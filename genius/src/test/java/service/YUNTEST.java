package service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.domain.QnaVO;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.service.BbsServiceIf;
import org.fullstack4.genius.service.BookServiceIf;
import org.fullstack4.genius.service.QnaServiceIf;
import org.fullstack4.genius.service.ReviewServiceIf;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class YUNTEST {

    @Autowired
    private BookServiceIf bookServiceIf;

    @Autowired
    private ReviewServiceIf reviewServiceIf;
    @Autowired
    private QnaServiceIf qnaServiceIf;
    @Autowired
    private BbsServiceIf bbsServiceIf;
    @Test
    public void testbbs(){
        for (int i = 0;i<20;i++) {
            BbsDTO bbsDTO = BbsDTO.builder()
                    .bbs_title("기적의 계산법 5권 초등 3학년 도서 관련 자료 입니다.")
                    .member_id("admin")
                    .category_code("bc01")
                    .fileYN("N")
                    .member_name("관리자")
                    .bbs_contents("기적의 계산법 5권 초등 3학년 도서 관련 자료 입니다.").build();
            bbsServiceIf.regist(bbsDTO);
            BbsDTO bbsDTO1 = BbsDTO.builder()
                    .bbs_title("기적의 계산법 5권 초등 3학년 도서 관련 자료 입니다.")
                    .member_id("admin")
                    .category_code("bc01")
                    .fileYN("N")
                    .member_name("관리자")
                    .bbs_contents("기적의 계산법 5권 초등 3학년 도서 관련 자료 입니다.").build();
            bbsServiceIf.regist(bbsDTO1);
            BbsDTO bbsDTO2 = BbsDTO.builder()
                    .bbs_title("큰별쌤 최태성의 하루 한장 한국사 1 도서 관련 자료 입니다.")
                    .member_id("admin")
                    .category_code("bc01")
                    .fileYN("N")
                    .member_name("관리자")
                    .bbs_contents("큰별쌤 최태성의 하루 한장 한국사 1 도서 관련 자료 입니다.").build();
            bbsServiceIf.regist(bbsDTO2);
            BbsDTO bbsDTO3 = BbsDTO.builder()
                    .bbs_title("중등 평가문제 국어2 도서 관련 질문 자료 입니다.")
                    .member_id("admin")
                    .category_code("bc01")
                    .fileYN("N")
                    .member_name("관리자")
                    .bbs_contents("중등 평가문제 국어2 도서 관련 질문 자료 입니다.").build();
            bbsServiceIf.regist(bbsDTO3);
            BbsDTO bbsDTO4 = BbsDTO.builder()
                    .bbs_title("체크체크 기출심화N제 수학 중2 도서 관련 자료 입니다.")
                    .member_id("admin")
                    .category_code("bc01")
                    .fileYN("N")
                    .member_name("관리자")
                    .bbs_contents("체크체크 기출심화N제 수학 중2 도서 관련 자료 입니다.").build();
            bbsServiceIf.regist(bbsDTO4);
        }
    }

//    @Test
//    public void testBookRegist(){
//        BookDTO bookDTO= BookDTO.builder()
//                .book_code("test")
//                .book_name("test")
//                .author("test")
//                .price(12)
//                .quantity(13)
//                .category_class_code("c01")
//                .category_subject_code("s01")
//                .publisher("test")
//                .book_info("test")
//                .isbn("123")
//                .contents("1234")
//                .publication_date(LocalDate.now()).build();
//        int result = bookServiceIf.regist(bookDTO);
//        log.info("======================");
//        log.info("BookServiceIfTest >> regist result : " +  result);
//        log.info("======================");
//    }
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
                .type("0")
                .search_word("천재")
                .build();
        PageResponseDTO<BookDTO> responseDTO = bookServiceIf.BookListByPage(pageRequestDTO);
        responseDTO.getDtoList().forEach(
                vo->log.info(vo)
        );
        log.info("BookServiceTests >> testBookListByPage END");
        log.info("=================================");
    }
    @Test
    public void testView(){
        log.info(bookServiceIf.view("b0001"));
    }
    @Test
    public void testReviewRegist(){
        ReviewDTO reviewDTO = ReviewDTO.builder()
                .review_idx(0)
                .book_code("b0001")
                .rank(4)
                .member_id("test")
                .reg_date(null)
                .review_contents("리뷰 테스트4").build();
        int result = reviewServiceIf.regist(reviewDTO);
        log.info("==========================");
        log.info("result : " + result);
        log.info("==========================");
    }
//    @Test
//    public void reviewDelete(){
//        int result = reviewServiceIf.delete(4);
//        log.info("======================");
//        log.info("reviewDelete result : " + result);
//        log.info("======================");
//    }

    @Test
    public void reviewList(){
        List<ReviewDTO> list = reviewServiceIf.listAll("b0001");
        log.info("=========================");
        log.info(list);
        log.info("=========================");
    }
    @Test
    public void testModifyBook(){
        BookDTO bookDTO = bookServiceIf.view("b0002");
        bookDTO.setBook_idx(17);
//        int result = bookServiceIf.modify(bookDTO);
        log.info("======================");
//        log.info("BookMapperTest : bookModify result : " + result);
        log.info("======================");
    }
    @Test
    public void testQnaRegist(){
        QnaDTO qnaDTO = QnaDTO.builder()
                .title("test15제목")
                .contents("test15답변")
                .member_id("test").build();
        qnaServiceIf.regist(qnaDTO);
        log.info("qnaDTO : " + qnaDTO);
    }
    @Test
    public void testQnaModify(){
        QnaDTO qnaDTO = qnaServiceIf.view(32);
        qnaDTO.setTitle("수정테스트2");
        int result = qnaServiceIf.modify(qnaDTO);
        log.info("================================");
        log.info("qnaMapperTest >> testQnaModify >> result : " +result);
        log.info("================================");
    }
    @Test
    public void updateRankAvg(){
        int result = reviewServiceIf.updateAvg("b0001");
        log.info("=========================");
        log.info(result);
        log.info("=========================");
    }
    @Test
    public void testQnaList(){
        List<QnaDTO> qnaDTOList = qnaServiceIf.listAll();
        log.info("=========================");
        log.info(qnaDTOList);
        log.info("=========================");
    }

    @Test
    public void testClassCategoryList(){
        log.info(bookServiceIf.bookClassCategoryList());
    }
    @Test
    public void testSubjectCategoryList(){
        log.info(bookServiceIf.bookSubjectCategoryList());
    }


}
