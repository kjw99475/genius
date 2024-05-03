package org.fullstack4.genius.mapper;

import org.fullstack4.genius.domain.QnaFileVO;
import org.fullstack4.genius.domain.QnaVO;

import java.util.List;

public interface QnaFileMapper {
    int regist(QnaFileVO qnaFileVO);
    List<QnaFileVO> getFileList(int qna_idx);
    QnaFileVO getFile(int file_idx);
    int deleteFile(String file_idx);
}
