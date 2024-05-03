package org.fullstack4.genius.service;

import org.fullstack4.genius.Common.InsufficientStockException;
import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;

import java.util.List;

public interface OrderServiceIf {
    int regist(OrderDTO orderDTO);
    int detailregist(OrderDTO orderDTO);
    int deliveryRegist(OrderDTO orderDTO);

    void testUpdate(String[] ordernumList,String[] deliveryList) throws InsufficientStockException;
    List<OrderDTO> AdminlistAll();
    List<OrderDTO> listAll(String user_id);
    List<OrderDTO> orderDetail(String order_num);
    OrderDTO view(String user_id);
    int cancelOrder(OrderDTO orderDTO);
    int delete(OrderDTO orderDTO);
    List<OrderDTO> AdminOrderdetail(String order_num);
    int updateOrderState(OrderDTO orderDTO);
    int deliveryEndDate(OrderDTO orderDTO);
    int updateDcompany(OrderDTO orderDTO);
    int requestRefund(OrderDTO orderDTO);
    int responseRefund(OrderDTO orderDTO);
    int OrderTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<OrderDTO> OrderListByPage(PageRequestDTO requestDTO);
}
