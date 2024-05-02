package org.fullstack4.genius.controller;


import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
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

        int result = 0;
        int result1 = 0;
        for(int i=0;i<bookCodeList.length;i++){
            if(!bookCodeList[i].equals("")) {
                BookDTO orgBookdto = bookServiceIf.view(bookCodeList[i]);
                BookDTO dto = BookDTO.builder()
                        .book_code(bookCodeList[i])
                        .book_name(orgBookdto.getBook_name())
                        .price(orgBookdto.getPrice())
                        .category_class_code(orgBookdto.getCategory_class_code())
                        .category_subject_code(orgBookdto.getCategory_subject_code())
                        .sales_status(salesStatusList[i])
                        .sales_start_date(LocalDate.parse(salesStartDateList[i]))
                        .sales_end_date(LocalDate.parse(salesEndDateList[i]))
                        .quantity(Integer.parseInt(salesQuantityList[i]))
                        .amount(Integer.parseInt(salesQuantityList[i])- orgBookdto.getQuantity())
                        .build();

                log.info("==========dto" + i + ": ==" + dto.toString());
                result = bookServiceIf.BookInventoryUpdate(dto);
                result1 = bookServiceIf.InsertRestore(dto);
            }
        }
//        int result = 0;
//        int result1 = 0;
//        for(int i=0;i<ordernumList.length;i++){
//            if(!deliveryList[i].equals("")) {
//
//            }
//        }
//
        if(result >0) {
            resultMap.put("result", "success");
        }
        else{
            resultMap.put("result", "fail");
        }
//        resultMap.put("result", "success");
        // 갯수 세기
        return new Gson().toJson(resultMap);
    }

    @GetMapping("/modify")
    public void GETModify(){

    }

    @PostMapping("/modify")
    public void POSTModify(){

    }
}
