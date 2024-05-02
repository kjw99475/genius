package org.fullstack4.genius.service;


import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.FileDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface BookServiceIf {
    int regist(BookDTO BookDTO,FileDTO imgfileDTO,FileDTO videofileDTO);
    int InsertRestore(BookDTO bookDTO);
    List<BookDTO> listAll();
    BookDTO view(String book_code);
    int modify(BookDTO bookDTO, FileDTO imgfileDTO,FileDTO videofileDTO);
    int delete(int idx);
    int BookTotalCount(PageRequestDTO requestDTO);
    int BookInventoryUpdate(BookDTO bookDTO);
    PageResponseDTO<BookDTO> BookListByPage(PageRequestDTO requestDTO);
    List<Map<String, String>> bookSubjectCategoryList();
    List<Map<String, String>> bookClassCategoryList();
}
