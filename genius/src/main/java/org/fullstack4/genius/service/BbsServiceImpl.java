package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.dto.BbsDTO;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.mapper.BbsMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

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
    public BbsDTO preView(int idx, String category_code) {
        BbsDTO bbsDTO = null;
        BbsVO bbsVO = bbsMapper.preView(idx, category_code);
        if (bbsVO != null) {
            bbsDTO = modelMapper.map(bbsVO, BbsDTO.class);
        }
        return bbsDTO;
    }

    @Override
    public BbsDTO postView(int idx, String category_code) {
        BbsDTO bbsDTO = null;
        BbsVO bbsVO = bbsMapper.postView(idx, category_code);
        if (bbsVO != null) {
            bbsDTO = modelMapper.map(bbsVO, BbsDTO.class);
        }
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

    public int readCount(int idx) {
        int result = bbsMapper.readCount(idx);
        return result;
    }

    @Override
    public int bbsTotalCount(PageRequestDTO requestDTO) {
        int total_count = bbsMapper.bbsTotalCount(requestDTO);
        return total_count;
    }

    @Override
    public PageResponseDTO<BbsDTO> bbsListByPage(PageRequestDTO requestDTO) {
//        List<BbsDTO> bbsDTOList = bbsMapper.bbsListByPage(requestDTO).stream()
//                        .map(bbsVO -> modelMapper.map(bbsVO, BbsDTO.class))
//                .collect(Collectors.toList());
//        return bbsDTOList;

        List<BbsVO> voList = bbsMapper.bbsListByPage(requestDTO);
        log.info("========================");
        log.info("voList : " + voList);
        log.info("========================");
        List<BbsDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,BbsDTO.class))
                .collect(Collectors.toList());
        int total_count = bbsMapper.bbsTotalCount(requestDTO);

        PageResponseDTO<BbsDTO> responseDTO = PageResponseDTO.<BbsDTO>withAll()
                .requestDTO(requestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }
}
