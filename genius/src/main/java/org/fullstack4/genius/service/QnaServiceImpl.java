package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.CommonUtil;
import org.fullstack4.genius.Common.FileUtil;
import org.fullstack4.genius.domain.BbsVO;
import org.fullstack4.genius.domain.BookVO;
import org.fullstack4.genius.domain.QnaVO;
import org.fullstack4.genius.dto.*;
import org.fullstack4.genius.mapper.BbsMapper;
import org.fullstack4.genius.mapper.QnaFileMapper;
import org.fullstack4.genius.mapper.QnaMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaServiceIf {

    private final QnaMapper qnaMapper;
    private final ModelMapper modelMapper;
    private final QnaFileMapper qnaFileMapper;

    @Override
    public int regist(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = qnaMapper.regist(qnaVO);
        int result2 = qnaMapper.refModify(qnaVO.getQna_idx());

        log.info("======================");
        log.info("QnaServiceImpl >> regist >> result : " + result + ", result2 : " + result2);
        log.info("======================");

        return qnaVO.getQna_idx();
    }

    @Override
    public List<QnaDTO> listAll() {
        List<QnaDTO> qnaDTOList = qnaMapper.listAll().stream()
                .map(qnaVO-> modelMapper.map(qnaVO, QnaDTO.class))
                .collect(Collectors.toList());
        return qnaDTOList;
    }

    @Override
    public List<QnaDTO> myListAll() {
        List<QnaDTO> qnaDTOList = qnaMapper.myListAll().stream()
                .map(qnaVO-> modelMapper.map(qnaVO, QnaDTO.class))
                .collect(Collectors.toList());
        return qnaDTOList;
    }

    @Override
    public QnaDTO view(int idx) {
        QnaVO qnaVO = qnaMapper.view(idx);
        QnaDTO qnaDTO = modelMapper.map(qnaVO, QnaDTO.class);

        return qnaDTO;
    }

    @Override
    public int modify(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO,QnaVO.class);
        return qnaMapper.modify(qnaVO);
    }

    @Override
    public int refModify(QnaDTO qnaDTO) {
        int result = qnaMapper.refModify(qnaDTO.getQna_idx());
        return result;
    }

    @Override
    public int delete(int idx) {
        int result = qnaMapper.delete(idx);
        int result2 = qnaMapper.answerDelete(idx);
        return result;
    }

    @Override
    public int readCount(int idx) {
        int result = qnaMapper.readCount(idx);
        return result;
    }

    @Override
    public int totalCount() {
        return qnaMapper.totalCount();
    }

    @Override
    public int answerRegist(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = qnaMapper.answerRegist(qnaVO);
        return qnaVO.getQna_idx();
    }

    @Override
    public int answerStatus(int idx) {
        int result = qnaMapper.answerStatus(idx);
        return result;
    }

    @Override
    public int answerModify(int idx) {
        int result = qnaMapper.answerModify(idx);
        return 0;
    }

    @Override
    public int answerDelete(int idx) {
        int result = qnaMapper.answerDelete(idx);
        return result;
    }

    @Override
    public int qnaTotalCount(PageRequestDTO requestDTO) {
        return qnaMapper.qnaTotalCount(requestDTO);
    }

    @Override
    public PageResponseDTO<QnaDTO> qnaListByPage(PageRequestDTO requestDTO) {
        List<QnaVO> voList = qnaMapper.qnaListByPage(requestDTO);
        List<QnaDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,QnaDTO.class))
                .collect(Collectors.toList());
        int total_count = qnaMapper.qnaTotalCount(requestDTO);

        PageResponseDTO<QnaDTO> responseDTO = PageResponseDTO.<QnaDTO>withAll()
                .requestDTO(requestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }
}
