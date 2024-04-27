package org.fullstack4.genius.service;

import org.fullstack4.genius.dto.PaymentDTO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface PaymentServiceIf {
    int regist(PaymentDTO PaymentDTO);

    List<PaymentDTO> listAll(String user_id);
    PaymentDTO view(String user_id);
    int modify(PaymentDTO PaymentDTO);
    int delete(PaymentDTO PaymentDTO);
    int PaymentTotalCount(PageRequestDTO requestDTO);
    List<PaymentDTO> PaymentListByPage(PageRequestDTO requestDTO);
}
