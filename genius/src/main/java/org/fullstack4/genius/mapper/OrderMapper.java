package org.fullstack4.genius.mapper;

import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface OrderMapper {
    int regist(OrderVO orderVO);
    int detailregist(OrderVO orderVO);
    int deliveryRegist(OrderVO orderVO);
    List<OrderVO> AdminlistAll();
    List<OrderVO> reviewConfirm(String member_id);
    List<OrderVO> listAll(String user_id);
    List<OrderVO> orderDetail(String order_num);
    OrderVO view(String user_id);
    int cancelOrder(OrderDTO orderDTO);
    int delete(int order_idx);
    int total_count();
    int orderDetailTotalCount(String order_num);
    List<OrderVO> AdminOrderdetail(String order_num);
    int updateOrderState(OrderVO orderVO);
    int updateDcompany(OrderVO orderVO);
    int deliveryEndDate(OrderVO orderVO);
    int requestRefund(OrderVO orderVO);
    int responseRefund(OrderVO orderVO);
    int OrderTotalCount(PageRequestDTO requestDTO);
    List<OrderVO> OrderListByPage(PageRequestDTO requestDTO);
}
