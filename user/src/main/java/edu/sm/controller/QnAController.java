package edu.sm.controller;


import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CustService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/qna")
@RequiredArgsConstructor
public class QnAController {




    String qdir = "qna/";
    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("top",qdir+"top");
        model.addAttribute("center",qdir+"center");
        return "index";
    }


//    @RequestMapping("/detail")
//    public String detail(Model model,@RequestParam("id") String id){
//        // Database에서 데이터를 가지고 온다.
//        CustDto custDto = null;
//        try {
//            custDto = custService.get(id);
//            model.addAttribute("cust", custDto);
//            model.addAttribute("center",Qdir+"detail");
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//        return "index";
//    }
//    @RequestMapping("/update")
//    public String update(Model model,CustDto custDto){//화면에서 form의 이름이 객체 이름과 같아야된다.
//
//        try {
//            custService.modify(custDto);
//            return "redirect:/cust/detail?id="+custDto.getCustId();
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }
//    @RequestMapping("/addimpl")
//    public String addimpl(Model model,CustDto custDto) throws Exception {
//        custService.add(custDto);
//        return "redirect:/cust/detail?id="+custDto.getCustId();
//
//    }
//    @RequestMapping("/delete")
//    public String delete(Model model,@RequestParam("id") String id){
//
//        try {
//            custService.del(id);
//            return "redirect:/cust/get";
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }
}
