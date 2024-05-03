package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.domain.QnaFileVO;
import org.fullstack4.genius.domain.QnaVO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.dto.QnaDTO;
import org.fullstack4.genius.dto.QnaFileDTO;
import org.fullstack4.genius.mapper.QnaFileMapper;
import org.fullstack4.genius.mapper.QnaMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class QnaFileServiceImpl implements QnaFileServiceIf {

    private final QnaFileMapper qnaFileMapper;
    private final ModelMapper modelMapper;


    @Override
    public int regist(QnaFileDTO qnaFileDTO) {
        QnaFileVO qnaFileVO = modelMapper.map(qnaFileDTO, QnaFileVO.class);
        int result = qnaFileMapper.regist(qnaFileVO);
        return result;
    }

    @Override
    public List<QnaFileDTO> getFileList(int qna_idx) {
        List<QnaFileVO> volist = qnaFileMapper.getFileList(qna_idx);
        List<QnaFileDTO> dtoList = volist.stream()
                .map(vo->modelMapper.map(vo, QnaFileDTO.class))
                .collect(Collectors.toList());
        return dtoList;
    }

    @Override
    public QnaFileDTO getFile(int file_idx) {
        QnaFileVO qnaFileVO = qnaFileMapper.getFile(file_idx);
        QnaFileDTO qnaFileDTO = modelMapper.map(qnaFileVO, QnaFileDTO.class);

        return qnaFileDTO;
    }

    @Override
    public int deleteFile(String file_idx) {
        return qnaFileMapper.deleteFile(file_idx);
    }
}
