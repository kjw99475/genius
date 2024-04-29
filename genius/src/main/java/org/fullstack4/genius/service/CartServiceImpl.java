package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.CartVO;
import org.fullstack4.genius.dto.CartDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.mapper.CartMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartServiceIf{

    private final CartMapper cartMapper;
    private final ModelMapper modelMapper;

    @Override
    public int regist(CartDTO cartDTO) {

        log.info("==============================");
        log.info("CartDTO : "+ cartDTO.toString());
        log.info("==============================");

        CartVO vo = modelMapper.map(cartDTO, CartVO.class);
        int result = cartMapper.regist(vo);

        log.info("result : "+ result);
        log.info("==============================");
        log.info("==============================");

        return result;

    }

    @Override
    public int exist(String book_code,String member_id) {
        int exist = cartMapper.exist(book_code,member_id);
        return exist;
    }

    @Override
    public int updateCart(CartDTO cartDTO) {
        CartVO vo = modelMapper.map(cartDTO, CartVO.class);
        int result = cartMapper.updateCart(vo);
        return result;
    }

    @Override
    public int updateCart1(CartDTO cartDTO) {
        CartVO vo = modelMapper.map(cartDTO, CartVO.class);
        int result = cartMapper.updateCart1(vo);
        return result;
    }

    @Override
    public List<CartDTO> listAll(String member_id) {
        List<CartVO> volist = cartMapper.listAll(member_id);
        List<CartDTO> dtolist = volist.stream()
                .map(vo->modelMapper.map(vo,CartDTO.class))
                .collect(Collectors.toList());
        return dtolist;
    }

    @Override
    public CartDTO view(int cart_idx) {
        CartVO vo = cartMapper.view(cart_idx);
        CartDTO dto = modelMapper.map(vo,CartDTO.class);

        return dto;
    }

    @Override
    public int modify(CartDTO cartDTO) {
        return 0;
    }

    @Override
    public int delete(CartDTO cartDTO) {

        CartVO vo = modelMapper.map(cartDTO, CartVO.class);
        int result = cartMapper.delete(vo);
        return result;
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
