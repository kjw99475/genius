package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;

import java.util.List;

public interface OrderServiceIf {
    int regist(OrderDTO orderDTO);
    int detailregist(OrderDTO orderDTO);
    int deliveryRegist(OrderDTO orderDTO);

    List<OrderDTO> AdminlistAll();
    List<OrderDTO> listAll(String user_id);
    List<OrderDTO> orderDetail(String order_num);
    OrderDTO view(String user_id);
    int cancelOrder(int order_idx);
    int delete(OrderDTO orderDTO);
    List<OrderDTO> AdminOrderdetail(String order_num);
    int updateOrderState(OrderDTO orderDTO);
    int updateDcompany(OrderDTO orderDTO);
    int requestRefund(OrderDTO orderDTO);
    int responseRefund(OrderDTO orderDTO);
    int OrderTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<OrderDTO> OrderListByPage(PageRequestDTO requestDTO);
}
