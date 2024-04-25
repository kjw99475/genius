package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.CartVO;
import org.fullstack4.genius.dto.CartDTO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface CartServiceIf {

    int regist(CartDTO cartDTO);
    List<CartDTO> listAll();
    CartDTO view(String user_id);
    int modify(CartDTO cartDTO);
    int delete(CartDTO cartDTO);
    int CartTotalCount(String user_id, PageRequestDTO requestDTO);
    List<CartDTO> CartListByPage(String user_id,PageRequestDTO requestDTO);
}
