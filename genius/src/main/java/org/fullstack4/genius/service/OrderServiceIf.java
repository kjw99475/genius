package org.fullstack4.genius.service;

import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface OrderServiceIf {
    int regist(OrderDTO orderDTO);

    List<OrderDTO> listAll(String user_id);
    OrderDTO view(String user_id);
    int modify(OrderDTO orderDTO);
    int delete(OrderDTO orderDTO);
    int OrderTotalCount(PageRequestDTO requestDTO);
    List<OrderDTO> OrderListByPage(PageRequestDTO requestDTO);
}
