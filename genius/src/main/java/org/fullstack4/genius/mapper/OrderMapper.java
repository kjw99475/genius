package org.fullstack4.genius.mapper;

import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface OrderMapper {
    int regist(OrderVO orderVO);

    List<OrderVO> listAll(String user_id);
    OrderVO view(String user_id);
    int modify(OrderVO orderVO);
    int delete(OrderVO orderVO);
    int OrderTotalCount(PageRequestDTO requestDTO);
    List<OrderVO> OrderListByPage(PageRequestDTO requestDTO);
}
