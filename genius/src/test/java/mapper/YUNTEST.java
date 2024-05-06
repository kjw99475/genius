package mapper;

import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.session.SqlSessionFactory;
import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.domain.QnaVO;
import org.fullstack4.genius.domain.ReviewVO;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.mapper.BbsMapper;
import org.fullstack4.genius.mapper.BookMapper;
import org.fullstack4.genius.mapper.QnaMapper;
import org.fullstack4.genius.mapper.ReviewMapper;
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

    @Autowired(required = false)
    private ReviewMapper reviewMapper;

    @Autowired(required = false)
    private QnaMapper qnaMapper;
    @Autowired(required = false)
    private BbsMapper bbsMapper;

    @Test
    public void insertReview(){
        List<BookVO> blist = bookMapper.listAll();
        log.info(blist);
        for(BookVO vo : blist){
            if(vo.getSales_status().equals("1")){
                ReviewVO rvo = ReviewVO.builder()
                        .book_code(vo.getBook_code())
                        .member_id("whdbs1771438")
                        .rank(5)
                        .review_contents("추천합니다.").build();
                int result = reviewMapper.regist(rvo);
                log.info(result);
            }
        }
    }

    @Test
    public void testbbs(){
        BbsVO bbsVO = BbsVO.builder()
                .bbs_title("").build();
    }


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
    public void testQnaListByPage() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .page_size(6)
                .build();
        List<QnaVO> qnaList = qnaMapper.qnaListByPage(pageRequestDTO);
        log.info("=================================");
        log.info(qnaList);
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
        BookVO vo = bookMapper.view("b0001");
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
    @Test
    public void testReviewList(){
        log.info("=================================");
        List<ReviewVO> voList = reviewMapper.listAll("b0001");
        voList.forEach(list->log.info(list));
        log.info("=================================");
    }
    @Test
    public void reviewDelete(){
        int result = reviewMapper.delete(5);
        log.info("======================");
        log.info("reviewDelete result : " + result);
        log.info("======================");
    }
    @Test
    public void bookModify(){
        BookVO bookVO = bookMapper.view("b0001");
        bookVO.setBook_idx(17);
        int result = bookMapper.modify(bookVO);
        log.info("======================");
        log.info("BookMapperTest : bookModify result : " + result);
        log.info("======================");
    }
    @Test
    public void testReviewRegist(){
        log.info("================================");
            ReviewVO reviewVO = ReviewVO.builder()
                    .book_code("b0002")
                    .member_id("test")
                    .rank(3)
                    .review_contents("리뷰 테스트1").build();
            int result = reviewMapper.regist(reviewVO);
        log.info("================================");
    }
    @Test
    public void testModify(){
        BookVO bookVO = bookMapper.view("test");
    }
    @Test
    public void testReviewRankAvg(){
        log.info("================================");
        int result = reviewMapper.updateAvg("b0001");
        log.info("result : " + result);
        log.info("================================");
    }
    @Test
    public void testUpdateRef(){

        int result = qnaMapper.refModify(9);
        log.info("result : " + result);
        log.info("===============================");
    }

    @Test
    public void testViewQna(){
        QnaVO qnaVO = qnaMapper.view(1);
        log.info("================================");
        log.info("qnaMapperTest >> testViewQna >> qnaVO : " +qnaVO);
        log.info("================================");
    }
    @Test
    public void testQnaList(){
        List<QnaVO> volist = qnaMapper.listAll();
        log.info("================================");
        log.info("qnaMapperTest >> testQnaList >> volist : " +volist);
        log.info("================================");
    }
    @Test
    public void testQnaModify(){
        QnaVO qnaVO = qnaMapper.view(32);
        qnaVO.setTitle("수정테스트");
        int result = qnaMapper.modify(qnaVO);
        log.info("================================");
        log.info("qnaMapperTest >> testQnaModify >> result : " +result);
        log.info("================================");
    }
    @Test
    public void testQnaRegist(){
        for(int i=0;i<100;i++) {
            QnaVO qnaVO = QnaVO.builder()
                    .title("질문test")
                    .contents("질문test")
                    .member_id("test1")
                    .build();
            log.info("================================");
            int result = qnaMapper.regist(qnaVO);
            int result2 = qnaMapper.refModify(qnaVO.getQna_idx());
        }
        log.info("================================");
    }
}
