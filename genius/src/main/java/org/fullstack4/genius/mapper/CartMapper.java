package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.CartVO;
import org.fullstack4.genius.dto.PageRequestDTO;


import java.util.List;

@Mapper
public interface CartMapper {
    int regist(CartVO cartVO);
    int updateCart(CartVO cartVO);
    int updateCart1(CartVO cartVO);
    int exist(String book_code);
    List<CartVO> listAll(String member_id);
    CartVO view(int cart_idx);
    int modify(CartVO cartVO);
    int delete(CartVO cartVO);
    int CartTotalCount(String user_id,PageRequestDTO requestDTO);
    List<CartVO> CartListByPage(String user_id,PageRequestDTO requestDTO);
}
