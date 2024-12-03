package edu.sm.controller;



import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.ProductDto;
import edu.sm.app.dto.PtDto;
import edu.sm.app.dto.WorkoutLogDto;
import edu.sm.app.service.ProductService;
import edu.sm.app.service.PtService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Controller
@RequestMapping("/pt")
@RequiredArgsConstructor

public class PtController {
    String dir = "pt/";
    private final PtService ptService;

    @RequestMapping("")
    public String pt(Model model, HttpSession session) throws Exception {
        // 세션에서 로그인된 사용자 정보 가져오기
        CustDto loggedInUser = (CustDto) session.getAttribute("loginid");

        // 사용자 ID를 이용해 내역 조회
        String custId = loggedInUser.getCustId();
        List<PtDto> pts = PtService.get(custId);


        model.addAttribute("ptlist", pts);
        model.addAttribute("top", dir + "top");
        model.addAttribute("center", dir + "center");

        return "index";
    }



}
