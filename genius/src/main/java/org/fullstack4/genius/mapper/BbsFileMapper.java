package org.fullstack4.genius.mapper;

import org.fullstack4.genius.domain.BbsFileVO;
import org.fullstack4.genius.domain.QnaFileVO;

import java.util.List;

public interface BbsFileMapper {
    int regist(BbsFileVO bbsFileVO);
    List<BbsFileVO> getFileList(int bbs_idx);
    BbsFileVO getFile(int file_idx);
}
