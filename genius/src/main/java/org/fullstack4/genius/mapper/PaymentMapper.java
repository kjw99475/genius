package org.fullstack4.genius.mapper;

import org.fullstack4.genius.domain.PaymentVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface PaymentMapper {

    int charge(PaymentVO PaymentVO);

    List<PaymentVO> listAll(String user_id);
    PaymentVO view(String member_id);
    int modify(PaymentVO Paymentvo);
    int delete(PaymentVO Paymentvo);
    int PaymentTotalCount(PageRequestDTO requestDTO);
    List<PaymentVO> PaymentListByPage(PageRequestDTO requestDTO);
}
