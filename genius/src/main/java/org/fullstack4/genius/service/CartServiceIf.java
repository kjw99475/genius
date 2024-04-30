package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.CartVO;
import org.fullstack4.genius.dto.CartDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;

import java.util.List;

public interface CartServiceIf {

    int regist(CartDTO cartDTO);
    int exist(String book_code,String member_id);
    int updateCart(CartDTO cartDTO);
    int updateCart1(CartDTO cartDTO);
    List<CartDTO> listAll(String member_id);
    CartDTO view(int cart_idx);
    int modify(CartDTO cartDTO);
    int delete(CartDTO cartDTO);
    int CartTotalCount(String member_id, PageRequestDTO requestDTO);
    PageResponseDTO<CartDTO> CartListByPage(String member_id, PageRequestDTO requestDTO);
}
