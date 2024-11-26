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
@RequestMapping("/cust")
@RequiredArgsConstructor
public class CustController {

    final CustService custService;

    String dir = "cust/";

    // 고객 목록 조회 기능 추가
    @RequestMapping("/list")
    public String list(Model model) {
        List<CustDto> list = new ArrayList<>();
        try {
            list = custService.get(); // 모든 고객 정보를 가져옵니다.
            model.addAttribute("custs", list); // 모델에 고객 목록을 담아서 JSP로 전달
            model.addAttribute("top","top");
            model.addAttribute("left", "left");
            model.addAttribute("center", dir + "list"); // 해당 페이지로 이동
        } catch (Exception e) {
            throw new RuntimeException("고객 목록을 가져오는 데 실패했습니다.", e);
        }
        return "index"; // index.jsp로 반환 (기본 페이지로)
    }

    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        // Database에서 데이터를 가지고 온다.
        List<CustDto> list = new ArrayList<>();
        try {
            list = custService.get();
            model.addAttribute("custs", list);
            model.addAttribute("top","top");
            model.addAttribute("center", dir + "get");
            model.addAttribute("left", "left");
        } catch (Exception e) {
            throw new Exception("ER0001");
        }
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir + "add");
        model.addAttribute("left", "left");
        model.addAttribute("top",   "top");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") String id) {
        // Database에서 데이터를 가지고 온다.
        CustDto custDto = null;
        try {
            custDto = custService.get(id);
            model.addAttribute("top","top");
            model.addAttribute("cust", custDto);
            model.addAttribute("center", dir + "detail");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }

    @RequestMapping("/update")
    public String update(Model model, CustDto custDto) {
        try {
            custService.modify(custDto);
            return "redirect:/cust/detail?id=" + custDto.getCustId();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, CustDto custDto) throws Exception {
        custService.add(custDto);
        return "redirect:/cust/detail?id=" + custDto.getCustId();
    }

    @RequestMapping("/delete")
    public String delete(Model model, @RequestParam("id") String id) {
        try {
            custService.del(id);
            return "redirect:/cust/get";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
