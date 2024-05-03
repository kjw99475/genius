package org.fullstack4.genius.service;

import org.fullstack4.genius.domain.QnaFileVO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.dto.QnaDTO;
import org.fullstack4.genius.dto.QnaFileDTO;

import java.util.List;

public interface QnaFileServiceIf {

    int regist(QnaFileDTO qnaFileDTO);
    List<QnaFileDTO> getFileList(int qna_idx);
    QnaFileDTO getFile(int file_idx);
    int deleteFile(String file_idx);
}
