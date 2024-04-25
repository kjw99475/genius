package org.fullstack4.genius.service;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class OrderServiceImpl  implements OrderServiceIf {
    @Override
    public int regist(OrderDTO orderDTO) {
        return 0;
    }

    @Override
    public List<OrderDTO> listAll(String user_id) {
        return null;
    }

    @Override
    public OrderDTO view(String user_id) {
        return null;
    }

    @Override
    public int modify(OrderDTO orderDTO) {
        return 0;
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
