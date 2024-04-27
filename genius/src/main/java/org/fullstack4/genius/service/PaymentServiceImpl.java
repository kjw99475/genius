package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PaymentDTO;
import org.fullstack4.genius.mapper.PaymentMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;


@Log4j2
@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentServiceIf{

    private final PaymentMapper paymentMapper;
    private final ModelMapper modelMapper;
    @Override
    public int regist(PaymentDTO PaymentDTO) {
        return 0;
    }

    @Override
    public List<PaymentDTO> listAll(String user_id) {
        return null;
    }

    @Override
    public PaymentDTO view(String user_id) {
        return null;
    }

    @Override
    public int modify(PaymentDTO PaymentDTO) {
        return 0;
    }

    @Override
    public int delete(PaymentDTO PaymentDTO) {
        return 0;
    }

    @Override
    public int PaymentTotalCount(PageRequestDTO requestDTO) {
        return 0;
    }

    @Override
    public List<PaymentDTO> PaymentListByPage(PageRequestDTO requestDTO) {
        return null;
    }
}
