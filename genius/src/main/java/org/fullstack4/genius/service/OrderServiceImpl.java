package org.fullstack4.genius.service;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.InsufficientStockException;
import org.fullstack4.genius.domain.OrderVO;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.dto.QnaDTO;
import org.fullstack4.genius.mapper.OrderMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        OrderVO orderVO = modelMapper.map(orderDTO, OrderVO.class);
        int result = orderMapper.regist(orderVO);

        return result;
    }

    @Override
    public int detailregist(OrderDTO orderDTO) {
        OrderVO orderVO = modelMapper.map(orderDTO, OrderVO.class);
        int result = orderMapper.detailregist(orderVO);

        return result;
    }

    @Override
    public int deliveryRegist(OrderDTO orderDTO) {
        OrderVO orderVO = modelMapper.map(orderDTO, OrderVO.class);
        int result = orderMapper.deliveryRegist(orderVO);

        return result;
    }

    @Override
    @Transactional(rollbackFor = {InsufficientStockException.class, Exception.class})
    public void testUpdate(String[] ordernumList, String[] deliveryList) throws InsufficientStockException {
        int result = 0;
        int result1 = 0;
        for(int i=0;i<ordernumList.length;i++){
            if(!deliveryList[i].equals("")) {
                OrderDTO dto = OrderDTO.builder()
                        .order_num(ordernumList[i])
                        .delivery_company(deliveryList[i])
                        .delivery_state("배송 중")
                        .order_state("배송 중")
                        .build();

                OrderVO vo = modelMapper.map(dto, OrderVO.class);
                result1 += orderMapper.updateOrderState(vo);
                result += orderMapper.updateDcompany(vo);
            }else if(deliveryList[i].equals("")){
                throw new InsufficientStockException("선택되지 않은 항목의 택배사가 있습니다.");
            }
        }
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
    public int cancelOrder(OrderDTO orderDTO) {

        int result = orderMapper.cancelOrder(orderDTO);
        return result;

    }

    @Override
    public int delete(OrderDTO orderDTO) {
        return 0;
    }

    @Override
    public List<OrderDTO> AdminOrderdetail(String order_num) {
        List<OrderVO> orderVO = orderMapper.AdminOrderdetail(order_num);
        List<OrderDTO> orderDTO = orderVO.stream()
                .map(vo->modelMapper.map(vo,OrderDTO.class))
                .collect(Collectors.toList());

        return orderDTO;
    }

    @Override
    public int updateOrderState(OrderDTO orderDTO) {
        OrderVO vo = modelMapper.map(orderDTO, OrderVO.class);
        int result = orderMapper.updateOrderState(vo);

        return result;
    }

    @Override
    public int deliveryEndDate(OrderDTO orderDTO) {
        OrderVO vo = modelMapper.map(orderDTO, OrderVO.class);
        int result = orderMapper.deliveryEndDate(vo);
        return result;
    }

    @Override
    public int updateDcompany(OrderDTO orderDTO) {
        OrderVO vo = modelMapper.map(orderDTO, OrderVO.class);
        int result = orderMapper.updateDcompany(vo);

        return result;
    }

    @Override
    public int requestRefund(OrderDTO orderDTO) {
        OrderVO orderVO = modelMapper.map(orderDTO, OrderVO.class);
        int result = orderMapper.requestRefund(orderVO);
        log.info(orderVO.toString());

        return result;
    }

    @Override
    public int responseRefund(OrderDTO orderDTO) {
        OrderVO orderVO = modelMapper.map(orderDTO, OrderVO.class);
        int result = orderMapper.responseRefund(orderVO);
        log.info(orderVO.toString());

        return result;
    }



    @Override
    public int OrderTotalCount(PageRequestDTO requestDTO) {
        return 0;
    }



    @Override
    public PageResponseDTO<OrderDTO> OrderListByPage(PageRequestDTO requestDTO)
    {
        List<OrderVO> voList = orderMapper.OrderListByPage(requestDTO);
        for(int i =0; i<voList.size(); i++){
            voList.get(i).setAmount(orderMapper.orderDetailTotalCount(voList.get(i).getOrder_num()));
        }
        List<OrderDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo, OrderDTO.class))
                .collect(Collectors.toList());


        log.info("requsetDTO 테스트 :" + requestDTO );
        int total_count = orderMapper.OrderTotalCount(requestDTO);

        PageResponseDTO<OrderDTO> responseDTO = PageResponseDTO.<OrderDTO>withAll()
                .requestDTO(requestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        log.info("responseDTO 테스트 :" + responseDTO );

        return responseDTO;
    }
}
