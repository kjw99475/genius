package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.CartVO;
import org.fullstack4.genius.dto.PageRequestDTO;


import java.util.List;

@Mapper
public interface CartMapper {
    int regist(CartVO cartVO);
    List<CartVO> listAll();
    CartVO view(String user_id);
    int modify(CartVO cartVO);
    int delete(CartVO cartVO);
    int CartTotalCount(String user_id,PageRequestDTO requestDTO);
    List<CartVO> CartListByPage(String user_id,PageRequestDTO requestDTO);
}
