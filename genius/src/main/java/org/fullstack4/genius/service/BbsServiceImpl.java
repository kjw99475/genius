package org.fullstack4.genius.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.BbsDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class BbsServiceImpl implements BbsServiceIf {
    @Override
    public int regist(BbsDTO bbsDTO) {
        return 0;
    }

    @Override
    public List<BbsDTO> listAll() {
        return null;
    }

    @Override
    public BbsDTO view(int idx) {
        return null;
    }

    @Override
    public int modify(BbsDTO bbsDTO) {
        return 0;
    }

    @Override
    public int delete(int idx) {
        return 0;
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
