package org.fullstack4.genius.service;

import org.fullstack4.genius.dto.DeliveryDTO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public interface DeliveryServiceif {
    int regist(DeliveryDTO DeliveryDTO);

    List<DeliveryDTO> listAll();
    DeliveryDTO view(int idx);
    int modify(DeliveryDTO DeliveryDTO);
    int delete(int idx);
    int DeliveryTotalCount(PageRequestDTO requestDTO);
    List<DeliveryDTO> DeliveryListByPage(PageRequestDTO requestDTO);
}
