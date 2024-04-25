package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.genius.domain.DeliveryVO;

@Mapper
public interface DeliveryMapper {
    int regist(DeliveryVO DeliveryVO);
    DeliveryVO select(DeliveryVO DeliveryVO);
    int update(DeliveryVO DeliveryVO);
    int leave(DeliveryVO DeliveryVO);
    int idCheck(String user_id);
}
