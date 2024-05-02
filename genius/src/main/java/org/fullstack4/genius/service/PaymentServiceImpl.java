package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.domain.PaymentVO;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.dto.PaymentDTO;
import org.fullstack4.genius.mapper.PaymentMapper;
import org.modelmapper.ModelMapper;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Log4j2
@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentServiceIf{

    private final PaymentMapper paymentMapper;
    private final ModelMapper modelMapper;
    @Override
    public int charge(PaymentDTO paymentDTO) {
        PaymentVO vo = modelMapper.map(paymentDTO, PaymentVO.class);
        log.info("=====================================================");
        log.info("PaymentVO : " + vo);
        log.info("=====================================================");
        int result = paymentMapper.charge(vo);
        return result;
    }

    @Override
    public int memberPay(PaymentDTO paymentDTO) {
        PaymentVO vo = modelMapper.map(paymentDTO, PaymentVO.class);
        log.info("=====================================================");
        log.info("PaymentVO : " + vo);
        log.info("=====================================================");
        int result = paymentMapper.memberPay(vo);
        return result;
    }

    @Override
    public int totalCount(PageRequestDTO pageRequestDTO) {
        int totalCount = paymentMapper.totalCount(pageRequestDTO);
        return totalCount;
    }

    @Override
    public int usepoint(PaymentDTO paymentDTO) {
        PaymentVO vo = modelMapper.map(paymentDTO, PaymentVO.class);
        log.info("=====================================================");
        log.info("PaymentVO : " + vo);
        log.info("=====================================================");
        int result = paymentMapper.usepoint(vo);
        return result;
    }

    @Override
    public List<PaymentDTO> listAll(String user_id) {
        List<PaymentVO> vos = paymentMapper.listAll(user_id);
        List<PaymentDTO> dtos = vos.stream()
                .map(vo->modelMapper.map(vo,PaymentDTO.class))
                .collect(Collectors.toList());
        return dtos;
    }

    @Override
    public int pointview(String member_id) {
        int mypoint = paymentMapper.pointview(member_id);
        return mypoint;

    }

    @Override
    public PaymentDTO view(String member_id) {
        PaymentVO vo = paymentMapper.view(member_id);
        PaymentDTO paymentDTO = modelMapper.map(vo, PaymentDTO.class);
        return paymentDTO;
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
    public List<OrderDTO> viewOrder(String member_id) {
        List<OrderVO> volist = paymentMapper.viewOrder(member_id);
        List<OrderDTO> dtolist = volist.stream()
                .map(vo->modelMapper.map(vo,OrderDTO.class))
                .collect(Collectors.toList());

        return dtolist;
    }

    @Override
    public List<OrderDTO> viewOrderdetail(String order_num) {
        List<OrderVO> volist = paymentMapper.viewOrderdetail(order_num);
        List<OrderDTO> dtolist = volist.stream()
                .map(vo->modelMapper.map(vo,OrderDTO.class))
                .collect(Collectors.toList());

        return dtolist;
    }

    @Override
    public int deleteBookRelease(OrderDTO orderDTO) {
        OrderVO orderVO = modelMapper.map(orderDTO, OrderVO.class);
        int result = paymentMapper.deleteBookRelease(orderVO);
        return result;
    }

    @Override
    public int salesBook(OrderDTO orderDTO) {
        OrderVO vo = modelMapper.map(orderDTO, OrderVO.class);
        int result = paymentMapper.salesBook(vo);
        return result;
    }

    @Override
    public int releaseBook(OrderDTO orderDTO) {
        OrderVO vo = modelMapper.map(orderDTO,OrderVO.class);
        int result = paymentMapper.releaseBook(vo);
        return result;
    }

    @Override
    public int OrderTotalCount(PageRequestDTO requestDTO) {
        int total_count = paymentMapper.OrderTotalCount(requestDTO);
        return total_count;
    }

    @Override
    public PageResponseDTO<OrderDTO> viewOrderListByPage(PageRequestDTO requestDTO) {
        List<OrderVO> voList = paymentMapper.viewOrderListbypage(requestDTO);
        List<OrderDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo, OrderDTO.class))
                .collect(Collectors.toList());

        int total_count = paymentMapper.OrderTotalCount(requestDTO);

        PageResponseDTO<OrderDTO> responseDTO = PageResponseDTO.<OrderDTO>withAll()
                .requestDTO(requestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int PaymentTotalCount(PageRequestDTO requestDTO) {
        return 0;
    }

    @Override
    public PageResponseDTO<PaymentDTO> PaymentListByPage(PageRequestDTO requestDTO) {
        int total_count =paymentMapper.totalCount(requestDTO);
        List<PaymentVO> voList = paymentMapper.PaymentListByPage(requestDTO);
        List<PaymentDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,PaymentDTO.class))
                .collect(Collectors.toList());
        PageResponseDTO<PaymentDTO> responseDTO = PageResponseDTO.<PaymentDTO>withAll()
                .requestDTO(requestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }
}
