package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.BbsFileVO;
import org.fullstack4.genius.domain.QnaFileVO;
import org.fullstack4.genius.dto.BbsFileDTO;
import org.fullstack4.genius.dto.QnaFileDTO;
import org.fullstack4.genius.mapper.BbsFileMapper;
import org.fullstack4.genius.mapper.QnaFileMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BbsFileServiceImpl implements BbsFileServiceIf {

    private final BbsFileMapper bbsFileMapper;
    private final ModelMapper modelMapper;


    @Override
    public int regist(BbsFileDTO bbsFileDTO) {
        BbsFileVO bbsFileVO = modelMapper.map(bbsFileDTO, BbsFileVO.class);
        int result = bbsFileMapper.regist(bbsFileVO);
        return result;
    }

    @Override
    public List<BbsFileDTO> getFileList(int bbs_idx, String category_code) {

        List<BbsFileVO> volist = bbsFileMapper.getFileList(bbs_idx, category_code);
        List<BbsFileDTO> dtoList = volist.stream()
                .map(vo->modelMapper.map(vo, BbsFileDTO.class))
                .collect(Collectors.toList());
        return dtoList;
    }

    @Override
    public BbsFileDTO getFile(int file_idx) {
        BbsFileVO bbsFileVO = bbsFileMapper.getFile(file_idx);
        BbsFileDTO bbsFileDTO = modelMapper.map(bbsFileVO, BbsFileDTO.class);

        return bbsFileDTO;
    }
}
