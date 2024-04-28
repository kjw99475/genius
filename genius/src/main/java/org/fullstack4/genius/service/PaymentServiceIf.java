package org.fullstack4.genius.service;

import org.fullstack4.genius.dto.PaymentDTO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface PaymentServiceIf {
    int charge(PaymentDTO paymentDTO);

    List<PaymentDTO> listAll(String member_id);
    int pointview(String member_id);
    PaymentDTO view(String member_id);
    int modify(PaymentDTO PaymentDTO);
    int delete(PaymentDTO PaymentDTO);
    int PaymentTotalCount(PageRequestDTO requestDTO);
    List<PaymentDTO> PaymentListByPage(PageRequestDTO requestDTO);
}
