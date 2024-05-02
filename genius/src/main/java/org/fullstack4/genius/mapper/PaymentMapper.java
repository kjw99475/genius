package org.fullstack4.genius.mapper;

import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.domain.PaymentVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface PaymentMapper {

    int charge(PaymentVO paymentVO);
    int usepoint(PaymentVO paymentVO);
    int memberPay(PaymentVO paymentVO);
    int totalCount(PageRequestDTO requestDTO);
    List<PaymentVO> listAll(String user_id);
    PaymentVO view(String member_id);
    int pointview(String member_id);
    List<OrderVO> viewOrder(String member_id);
    List<OrderVO> viewOrderdetail(String order_num);

    int refund(PaymentVO Paymentvo);
    int delete(PaymentVO Paymentvo);

    int deleteBookRelease(OrderVO orderVO);
    int salesBook(OrderVO orderVO);
    int releaseBook(OrderVO orderVO);
    int OrderTotalCount(PageRequestDTO requestDTO);
    List<OrderVO> viewOrderListbypage(PageRequestDTO requestDTO);
    int PaymentTotalCount(PageRequestDTO requestDTO);
    List<PaymentVO> PaymentListByPage(PageRequestDTO requestDTO);
}
