package org.fullstack4.genius.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.DeliveryVO;
import org.fullstack4.genius.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface MemberMapper {
    int regist(DeliveryVO DeliveryVO);

    List<DeliveryVO> listAll();
    DeliveryVO view(int idx);
    int modify(DeliveryVO DeliveryVO);
    int delete(int idx);
    int DeliveryTotalCount(PageRequestDTO requestDTO);
    List<DeliveryVO> DeliveryListByPage(PageRequestDTO requestDTO);
}
