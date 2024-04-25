package org.fullstack4.genius.service;

import org.fullstack4.genius.dto.DeliveryDTO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public class DeliveryServiceImpl implements DeliveryServiceif{
    @Override
    public int regist(DeliveryDTO DeliveryDTO) {
        return 0;
    }

    @Override
    public List<DeliveryDTO> listAll() {
        return null;
    }

    @Override
    public DeliveryDTO view(int idx) {
        return null;
    }

    @Override
    public int modify(DeliveryDTO DeliveryDTO) {
        return 0;
    }

    @Override
    public int delete(int idx) {
        return 0;
    }

    @Override
    public int DeliveryTotalCount(PageRequestDTO requestDTO) {
        return 0;
    }

    @Override
    public List<DeliveryDTO> DeliveryListByPage(PageRequestDTO requestDTO) {
        return null;
    }
}
