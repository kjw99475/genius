package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.CartVO;
import org.fullstack4.genius.dto.CartDTO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface CartServiceIf {

    int regist(CartDTO cartDTO);
    int exist(String book_code);
    int updateCart(CartDTO cartDTO);
    int updateCart1(CartDTO cartDTO);
    List<CartDTO> listAll(String member_id);
    CartDTO view(int cart_idx);
    int modify(CartDTO cartDTO);
    int delete(CartDTO cartDTO);
    int CartTotalCount(String user_id, PageRequestDTO requestDTO);
    List<CartDTO> CartListByPage(String user_id,PageRequestDTO requestDTO);
}
