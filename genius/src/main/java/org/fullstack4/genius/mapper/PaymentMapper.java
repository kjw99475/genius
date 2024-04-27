package org.fullstack4.genius.mapper;

import org.fullstack4.genius.domain.PaymentVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface PaymentMapper {

    int regist(PaymentVO PaymentVO);

    List<PaymentVO> listAll(String user_id);
    PaymentVO view(String user_id);
    int modify(PaymentVO PaymentVO);
    int delete(PaymentVO PaymentVO);
    int PaymentTotalCount(PageRequestDTO requestDTO);
    List<PaymentVO> PaymentListByPage(PageRequestDTO requestDTO);
}
