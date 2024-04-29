package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface OrderServiceIf {
    int regist(OrderDTO orderDTO);
    int detailregist(OrderDTO orderDTO);

    List<OrderDTO> AdminlistAll();
    List<OrderDTO> listAll(String user_id);
    List<OrderDTO> orderDetail(String order_num);
    OrderDTO view(String user_id);
    int cancelOrder(int order_idx);
    int delete(OrderDTO orderDTO);
    int OrderTotalCount(PageRequestDTO requestDTO);
    List<OrderDTO> OrderListByPage(PageRequestDTO requestDTO);
}
