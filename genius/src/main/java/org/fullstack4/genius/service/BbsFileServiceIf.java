package org.fullstack4.genius.service;

import org.fullstack4.genius.dto.BbsFileDTO;
import org.fullstack4.genius.dto.QnaFileDTO;

import java.util.List;

public interface BbsFileServiceIf {

    int regist(BbsFileDTO bbsFileDTO);
    List<BbsFileDTO> getFileList(int bbs_idx, String category_code);
    BbsFileDTO getFile(int file_idx);
}
