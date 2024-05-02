package org.fullstack4.springmvc.dto;

import lombok.Builder;
import lombok.Data;
import lombok.extern.log4j.Log4j2;

import java.util.List;

@Log4j2
@Data
public class PageResponseDTO<E> {
    private int total_count;
    private int page;
    private int page_size;
    private int page_skip_count;
    private int total_page;
    private int page_block_size;
    private int page_block_start;
    private int page_block_end;

    private boolean prev_page_flag;
    private boolean next_page_flag;

    List<E> dtoList;

    private String linkParams;

    PageResponseDTO() {}

    @Builder(builderMethodName = "withAll")
    public PageResponseDTO(PageRequestDTO requestDTO, List<E> dtoList, int total_count) {
        log.info("========================================");
        log.info("PageResponseDTO START");
        this.total_count = total_count;
        this.page = requestDTO.getPage();
        this.page_size = requestDTO.getPage_size();
        this.page_skip_count = (this.page-1)*this.page_size;
        this.total_page = (this.total_count > 0 ?
                (int)Math.ceil(this.total_count/(double)this.page_size) : 1);
        this.page_block_size = requestDTO.getPage_block_size();
        //this.page_block_start = requestDTO.getPage_block_start();
        //this.page_block_end = requestDTO.getPage_block_end();
        this.setPage_block_start();
        this.setPage_block_end();
        this.prev_page_flag = (this.page_block_start > 1);
        this.next_page_flag = (this.total_page > this.page_block_end);
        this.dtoList = dtoList;

        this.linkParams = "?page_siz="+ this.page_size;

        log.info("PageResponseDTO END");
        log.info("========================================");
    }

    public int getTotal_page() {
        return (this.total_count > 0 ?
                (int)Math.ceil(this.total_count/(double)this.page_size) : 1);
    }

    public int getPage_skip_count() {
        return (this.page-1)*this.page_size;
    }

    public void setPage_block_start() {
        this.page_block_start = (
                    (int)Math.floor(this.page/(double)this.page_block_size)
                    *this.page_block_size
                ) + 1;
    }

    public void setPage_block_end() {
        this.page_block_end = (
                        (int)Math.floor(this.page/(double)this.page_block_size)
                        *this.page_block_size
                ) + this.page_block_size;
        this.page_block_end = ( this.total_page > this.page_block_end ? this.page_block_end : this.total_page);
    }

}
