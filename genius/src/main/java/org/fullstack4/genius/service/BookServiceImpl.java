package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.FileUtil;
import org.fullstack4.genius.Common.InsufficientStockException;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.FileDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.mapper.BookMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.awt.print.Book;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BookServiceImpl implements BookServiceIf {
    private final BookMapper bookMapper;
    private final ModelMapper modelMapper;


    @Override
    public int regist(BookDTO bookDTO,FileDTO imgfileDTO,FileDTO videofileDTO) {
        log.info("테스트 "+imgfileDTO);
        if (imgfileDTO.getUploadFolder()!= null) {
            // 파일이 교체된 경우
            Map<String, String> map = FileUtil.FileUpload(imgfileDTO);

            if (map.get("result").equals("success")) {
                bookDTO.setBook_img(map.get("newName"));
            }

        }
        if (videofileDTO.getUploadFolder()!= null) {
            // 파일이 교체된 경우
            Map<String, String> map = FileUtil.FileUpload(videofileDTO);

            if (map.get("result").equals("success")) {
                bookDTO.setVideo(map.get("newName"));
            }

        }
        BookVO bookVO = modelMapper.map(bookDTO, BookVO.class);
        int result = bookMapper.regist(bookVO);
        return result;
    }

    @Override
    public int InsertRestore(BookDTO bookDTO) {
        BookVO bookVO = modelMapper.map(bookDTO, BookVO.class);
        int result = bookMapper.InsertRestore(bookVO);
        return result;
    }

    @Override
    public List<BookDTO> listAll() {
        List<BookDTO> bookDTOList = bookMapper.listAll().stream()
                .map(bookVO -> modelMapper.map(bookVO,BookDTO.class))
                .collect(Collectors.toList());
        return bookDTOList;
    }

    @Override
    public BookDTO view(String book_code) {
        BookVO bookvo = bookMapper.view(book_code);
        log.info(bookvo);
        BookDTO bookDTO = modelMapper.map(bookvo, BookDTO.class);

        return bookDTO;
    }

    @Override
    public int modify(BookDTO bookDTO, FileDTO imgfileDTO,FileDTO videofileDTO) {
        int result = 0;
        log.info("테스트 "+imgfileDTO);
        if (imgfileDTO.getUploadFolder()!= null) {
            // 파일이 교체된 경우
            Map<String, String> map = FileUtil.FileUpload(imgfileDTO);

            if (map.get("result").equals("success")) {
                bookDTO.setBook_img(map.get("newName"));
            }

        }
        log.info("테스트 "+videofileDTO);
        if (videofileDTO.getUploadFolder()!= null) {
            // 파일이 교체된 경우
            Map<String, String> map = FileUtil.FileUpload(videofileDTO);

            if (map.get("result").equals("success")) {
                bookDTO.setVideo(map.get("newName"));
            }

        }
        BookVO bookVO = modelMapper.map(bookDTO, BookVO.class);
        result = bookMapper.modify(bookVO);


        return result;
    }

    @Override
    public int delete(int idx) {
        int result = bookMapper.delete(idx);
        return result;
    }

    @Override
    public int BookTotalCount(PageRequestDTO requestDTO) {
        int total_count = bookMapper.BookTotalCount(requestDTO);

        return total_count;
    }

    @Override
    public int BookInventoryUpdate(BookDTO bookDTO) {
        BookVO bookVO = modelMapper.map(bookDTO, BookVO.class);
        int result = bookMapper.BookInventoryUpdate(bookVO);
        return result;
    }

    @Override
    @Transactional(rollbackFor = {InsufficientStockException.class, Exception.class})
    public void testInventoryUpdate(String[] bookCodeList, String[] salesStatusList, String[] salesStartDateList, String[] salesEndDateList, String[] salesQuantityList) throws InsufficientStockException {

        int result = 0;
        int result1 = 0;
        for(int i=0;i<bookCodeList.length;i++){
            if(!bookCodeList[i].equals("")) {
                BookVO orgBookdto = bookMapper.view(bookCodeList[i]);

                /////////날짜 비교////////
                Date date = new Date();
                LocalDate convertedDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                LocalDate startDate = LocalDate.parse(salesStartDateList[i]);
                LocalDate endDate = LocalDate.parse(salesEndDateList[i]);
                int compare = convertedDate.compareTo(startDate);
                int compare2 = convertedDate.compareTo(endDate);
                int compare3 = startDate.compareTo(endDate);
                if(endDate ==null || startDate == null){
                    throw new InsufficientStockException("날짜를 입력하세요.");
                }
                if(compare2>0) {
                    throw new InsufficientStockException("판매 종료일은 현재 날짜보다 적을 수 없습니다.");
                }
                if(compare3>0){
                    throw new InsufficientStockException("판매 시작일이 판매 종료일보다 클 수 없습니다.");
                }
                log.info("입력한 재고:" +Integer.parseInt(salesQuantityList[i]));
                if(Integer.parseInt(salesQuantityList[i])<0){
                    throw new InsufficientStockException("재고는 0보다 작을 수 없습니다.");
                }
                ///////////////////////
                BookVO vo = BookVO.builder()
                        .book_code(bookCodeList[i])
                        .book_name(orgBookdto.getBook_name())
                        .price(orgBookdto.getPrice())
                        .category_class_code(orgBookdto.getCategory_class_code())
                        .category_subject_code(orgBookdto.getCategory_subject_code())
                        .sales_status(salesStatusList[i])
                        .sales_start_date(LocalDate.parse(salesStartDateList[i]))
                        .sales_end_date(LocalDate.parse(salesEndDateList[i]))
                        .quantity(Integer.parseInt(salesQuantityList[i]))
                        .amount(Integer.parseInt(salesQuantityList[i])- orgBookdto.getQuantity())
                        .build();

                log.info("==========dto" + i + ": ==" + vo.toString());
                result += bookMapper.BookInventoryUpdate(vo);
                result1 += bookMapper.InsertRestore(vo);
            }
        }
    }

    @Override
    public PageResponseDTO<BookDTO> BookListByPage(PageRequestDTO requestDTO) {
        List<BookVO> voList = bookMapper.BookListByPage(requestDTO);
        List<BookDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,BookDTO.class))
                .collect(Collectors.toList());
        int total_count = bookMapper.BookTotalCount(requestDTO);

        PageResponseDTO<BookDTO> responseDTO = PageResponseDTO.<BookDTO>withAll()
                .requestDTO(requestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public List<Map<String, String>> bookSubjectCategoryList() {
        return bookMapper.bookSubjectCategoryList();
    }

    @Override
    public List<Map<String, String>> bookClassCategoryList() {
        return bookMapper.bookClassCategoryList();
    }
}
