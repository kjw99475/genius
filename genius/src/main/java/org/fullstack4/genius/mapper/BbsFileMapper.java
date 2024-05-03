package org.fullstack4.genius.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.genius.domain.BbsFileVO;
import org.fullstack4.genius.domain.QnaFileVO;

import java.util.List;

public interface BbsFileMapper {
    int regist(BbsFileVO bbsFileVO);
    List<BbsFileVO> getFileList(@Param("bbs_idx")int bbs_idx,@Param("category_code") String category_code);
    BbsFileVO getFile(int file_idx);
    int deleteFile(String file_idx);
}
