package org.fullstack4.genius.service;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.mapper.OrderMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class OrderServiceImpl  implements OrderServiceIf {

    private final OrderMapper orderMapper;
    private final ModelMapper modelMapper;

    @Override
    public int regist(OrderDTO orderDTO) {
        return 0;
    }

    @Override
    public List<OrderDTO> AdminlistAll() {
        List<OrderVO> orders = orderMapper.AdminlistAll();
        List<OrderDTO> dtolist = orders.stream()
                .map(vo->modelMapper.map(vo,OrderDTO.class))
                .collect(Collectors.toList());
        return dtolist;
    }

    @Override
    public List<OrderDTO> listAll(String user_id) {
        List<OrderVO> orders = orderMapper.listAll(user_id);
        List<OrderDTO> dtolist = orders.stream()
                .map(vo->modelMapper.map(vo,OrderDTO.class))
                .collect(Collectors.toList());
        return dtolist;
    }

    @Override
    public List<OrderDTO> orderDetail(String order_num) {
        List<OrderVO> orders = orderMapper.orderDetail(order_num);
        List<OrderDTO> dtolist = orders.stream()
                .map(vo->modelMapper.map(vo,OrderDTO.class))
                .collect(Collectors.toList());
        return dtolist;
    }

    @Override
    public OrderDTO view(String user_id) {
        OrderVO orderVO = orderMapper.view(user_id);
        OrderDTO orderDTO = modelMapper.map(orderVO, OrderDTO.class);

        log.info("================================");
        log.info("OrderDTO : " + orderDTO.toString());
        log.info("================================");

        return orderDTO;

    }

    @Override
    public int cancelOrder(int order_idx) {

        int result = orderMapper.cancelOrder(order_idx);
        return result;

    }

    @Override
    public int delete(OrderDTO orderDTO) {
        return 0;
    }

    @Override
    public int OrderTotalCount(PageRequestDTO requestDTO) {
        return 0;
    }

    @Override
    public List<OrderDTO> OrderListByPage(PageRequestDTO requestDTO) {
        return null;
    }
}
