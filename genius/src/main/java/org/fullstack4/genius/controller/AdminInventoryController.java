package org.fullstack4.genius.controller;


import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.genius.Common.InsufficientStockException;
import org.fullstack4.genius.dto.BookDTO;
import org.fullstack4.genius.dto.OrderDTO;
import org.fullstack4.genius.dto.PageRequestDTO;
import org.fullstack4.genius.dto.PageResponseDTO;
import org.fullstack4.genius.service.BookServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.awt.print.Book;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping(value="/admin/inventory")
@RequiredArgsConstructor
public class AdminInventoryController {
    private final BookServiceIf bookServiceIf;
    @GetMapping("/list")
    public void GETList(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Model model){
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<BookDTO> responseDTO = bookServiceIf.BookListByPage(pageRequestDTO);

        List<Map<String,String>> subjectList = bookServiceIf.bookSubjectCategoryList();
        List<Map<String,String>> classList = bookServiceIf.bookClassCategoryList();
        model.addAttribute("subjectList",subjectList);
        model.addAttribute("classList",classList);
        model.addAttribute("responseDTO", responseDTO);
    }

    @RequestMapping(value = "/inventoryupdate.dox", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String deliveryUpdate(Model model , @RequestParam HashMap<String,Object> map){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();


        String BookCodeList = map.get("BookCodeList").toString();
        String SalesStatusList = map.get("SalesStatusList").toString();
        String SalesStartDateList = map.get("SalesStartDateList").toString();
        String SalesEndDateList = map.get("SalesEndDateList").toString();
        String SalesQuantityList = map.get("SalesQuantityList").toString();

        BookCodeList = BookCodeList.replace("\"","");
        BookCodeList = BookCodeList.replace("[","");
        BookCodeList = BookCodeList.replace("]","");
        String[] bookCodeList = BookCodeList.split(",");

        SalesStatusList = SalesStatusList.replace("\"","");
        SalesStatusList = SalesStatusList.replace("[","");
        SalesStatusList = SalesStatusList.replace("]","");
        String[] salesStatusList = SalesStatusList.split(",");

        SalesStartDateList = SalesStartDateList.replace("\"","");
        SalesStartDateList = SalesStartDateList.replace("[","");
        SalesStartDateList = SalesStartDateList.replace("]","");
        String[] salesStartDateList = SalesStartDateList.split(",");

        SalesEndDateList = SalesEndDateList.replace("\"","");
        SalesEndDateList = SalesEndDateList.replace("[","");
        SalesEndDateList = SalesEndDateList.replace("]","");
        String[] salesEndDateList = SalesEndDateList.split(",");

        SalesQuantityList = SalesQuantityList.replace("\"","");
        SalesQuantityList = SalesQuantityList.replace("[","");
        SalesQuantityList = SalesQuantityList.replace("]","");
        String[] salesQuantityList = SalesQuantityList.split(",");

        log.info("=======================인벤토리 테스트 시작=============");
        log.info("========================"+ Arrays.toString(bookCodeList)+"===================");
        log.info("========================"+ Arrays.toString(salesStatusList)+"===================");
        log.info("========================"+ Arrays.toString(salesStartDateList)+"===================");
        log.info("========================"+ Arrays.toString(salesEndDateList)+"===================");
        log.info("========================"+ Arrays.toString(salesQuantityList)+"===================");
        log.info("=======================인벤토리 테스트 끝=============");

        try{
            bookServiceIf.testInventoryUpdate(bookCodeList, salesStatusList, salesStartDateList, salesEndDateList, salesQuantityList);
            resultMap.put("result", "success");
            resultMap.put("msg", "정상적으로 적용되었습니다.");
        }catch(InsufficientStockException e){
            resultMap.put("result", "error");
            resultMap.put("msg",e.getMessage());
            return new Gson().toJson(resultMap);
        }
        return new Gson().toJson(resultMap);

    }

    @GetMapping("/modify")
    public void GETModify(){

    }

    @PostMapping("/modify")
    public void POSTModify(){

    }
}
