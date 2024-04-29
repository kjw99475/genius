package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.dto.QnaDTO;
import org.fullstack4.genius.service.OrderServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/admin/order")
@RequiredArgsConstructor
public class AdminOrderController {

    private final OrderServiceIf orderService;

    @GetMapping("/list")
    public void GETList(Model model, @RequestParam(name="page", defaultValue = "1")int page,
                        PageRequestDTO pageRequestDTO){
        pageRequestDTO.setPage_size(10);
        pageRequestDTO.setPage(page);
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<OrderDTO> responseDTO = orderService.OrderListByPage(pageRequestDTO);
        model.addAttribute("orderDTOlist", responseDTO.getDtoList());
        model.addAttribute("pageDTO", responseDTO);

    }

    @GetMapping("/view")
    public void GETView(){

    }

}
