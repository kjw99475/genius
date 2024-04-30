package org.fullstack4.genius.mapper;

import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface OrderMapper {
    int regist(OrderVO orderVO);
    int detailregist(OrderVO orderVO);
    int deliveryRegist(OrderVO orderVO);
    List<OrderVO> AdminlistAll();
    List<OrderVO> listAll(String user_id);
    List<OrderVO> orderDetail(String order_num);
    OrderVO view(String user_id);
    int cancelOrder(int order_idx);
    int delete(int order_idx);
    int total_count();
    int updateDcompany(OrderVO orderVO);
    int OrderTotalCount(PageRequestDTO requestDTO);
    List<OrderVO> OrderListByPage(PageRequestDTO requestDTO);
}
