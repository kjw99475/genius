package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.dto.BbsDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.mapper.BbsMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BbsServiceImpl implements BbsServiceIf {

    private final BbsMapper bbsMapper;
    private final ModelMapper modelMapper;

    @Override
    public int regist(BbsDTO bbsDTO) {
        BbsVO bbsVO = modelMapper.map(bbsDTO, BbsVO.class);
        log.info("=============================");
        log.info("bbsVO >>" + bbsVO.toString());
        int result = bbsMapper.regist(bbsVO);
        log.info("result >>" + result);
        log.info("=============================");
        return result;
    }

    @Override
    public List<BbsDTO> listAll(String category_code) {
        List<BbsDTO> bbsDTOList = bbsMapper.listAll(category_code).stream()
                .map(bbsVO-> modelMapper.map(bbsVO, BbsDTO.class))
                .collect(Collectors.toList());
        return bbsDTOList;
    }

    @Override
    public BbsDTO view(int idx) {
        BbsVO bbsVO = bbsMapper.view(idx);
        BbsDTO bbsDTO = modelMapper.map(bbsVO, BbsDTO.class);
        return bbsDTO;
    }

    @Override
    public int modify(BbsDTO bbsDTO) {
        BbsVO bbsVO = modelMapper.map(bbsDTO, BbsVO.class);
        int result = bbsMapper.modify(bbsVO);
        return result;
    }

    @Override
    public int delete(int idx) {
        int result = bbsMapper.delete(idx);
        return result;
    }

    @Override
    public int bbsTotalCount(PageRequestDTO requestDTO) {
        return 0;
    }

    @Override
    public List<BbsDTO> bbsListByPage(PageRequestDTO requestDTO) {
        return null;
    }
}
