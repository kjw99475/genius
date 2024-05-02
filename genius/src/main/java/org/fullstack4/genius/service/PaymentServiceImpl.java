package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.domain.PaymentVO;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.mapper.CartMapper;
import org.fullstack4.genius.mapper.OrderMapper;
import org.fullstack4.genius.mapper.PaymentMapper;
import org.modelmapper.ModelMapper;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Log4j2
@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentServiceIf{

    private final PaymentMapper paymentMapper;
    private final OrderMapper orderMapper;
    private final CartMapper cartMapper;
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
    public int revenue(int total_price) {
        int result = paymentMapper.revenue(total_price);
        return result;
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
    @Transactional
    public int testPayment(PaymentDTO paymentDTO, OrderDTO orderDTO1,
                            List<CartDTO> dtolist,
                           String member_id,String order_num,int total_price) {

        PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);
        OrderVO orderVO = modelMapper.map(orderDTO1, OrderVO.class);

        int result = paymentMapper.memberPay(paymentVO);
        log.info("======================================텟"+orderVO.toString());
        int result4 = orderMapper.regist(orderVO);
        int result5 = orderMapper.deliveryRegist(orderVO);
        for(int i=0; i<dtolist.size(); i++) {
            OrderDTO detailorderDTO = OrderDTO.builder()
                    .member_id(member_id)
                    .order_num(order_num)
                    .book_code(dtolist.get(i).getBook_code())
                    .book_name(dtolist.get(i).getBook_name())
                    .category_class_code(dtolist.get(i).getCategory_class_code())
                    .category_subject_code(dtolist.get(i).getCategory_subject_code())
                    .order_state("배송 전")
                    .price(dtolist.get(i).getPrice())
                    .total_price(dtolist.get(i).getPrice() * dtolist.get(i).getQuantity())
                    .amount(dtolist.get(i).getQuantity())
                    .build();
            OrderVO detailOrderVO = modelMapper.map(detailorderDTO, OrderVO.class);
            int result1 = orderMapper.detailregist(detailOrderVO);
            int result2 = paymentMapper.releaseBook(detailOrderVO);
            int result3 = paymentMapper.salesBook(detailOrderVO);


        }

        int result6 = paymentMapper.revenue(total_price);
        int result7 = paymentMapper.usepoint(paymentVO);

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
