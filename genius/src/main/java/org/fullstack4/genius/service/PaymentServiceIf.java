package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.domain.PaymentVO;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.dto.PaymentDTO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface PaymentServiceIf {
    int charge(PaymentDTO paymentDTO);
    int memberPay(PaymentDTO paymentDTO);
    int totalCount(PageRequestDTO pageRequestDTO);
    int usepoint(PaymentDTO paymentDTO);
    List<PaymentDTO> listAll(String member_id);
    int pointview(String member_id);
    PaymentDTO view(String member_id);
    int modify(PaymentDTO PaymentDTO);
    int delete(PaymentDTO PaymentDTO);
    List<OrderDTO> viewOrder(String member_id);
    List<OrderDTO> viewOrderdetail(String order_num);

    int deleteBookRelease(OrderDTO orderDTO);
    int salesBook(OrderDTO orderDTO);
    int releaseBook(OrderDTO orderDTO);
    int OrderTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<OrderDTO> viewOrderListByPage(PageRequestDTO requestDTO);
    int PaymentTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<PaymentDTO> PaymentListByPage(PageRequestDTO requestDTO);
}
