package org.fullstack4.genius.service;

import org.fullstack4.genius.dto.CartDTO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

public class CartServiceImpl implements CartServiceIf{
    @Override
    public int regist(CartDTO cartDTO) {
        return 0;
    }

    @Override
    public List<CartDTO> listAll() {
        return null;
    }

    @Override
    public CartDTO view(String user_id) {
        return null;
    }

    @Override
    public int modify(CartDTO cartDTO) {
        return 0;
    }

    @Override
    public int delete(CartDTO cartDTO) {
        return 0;
    }

    @Override
    public int CartTotalCount(String user_id, PageRequestDTO requestDTO) {
        return 0;
    }

    @Override
    public List<CartDTO> CartListByPage(String user_id, PageRequestDTO requestDTO) {
        return null;
    }
}
