package edu.sm.controller;

import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.PtDto;
import edu.sm.app.dto.TrainerDto;
import edu.sm.app.service.CustCheckService;
import edu.sm.app.service.PaymentService;
import edu.sm.app.service.PtService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Controller
@RequestMapping("/pt")
@Slf4j
public class PtController {

    @Autowired
    private PtService ptService;
    @Autowired
    private CustCheckService custCheckService;
    private final PaymentService paymentService;

    String pdir = "pt/";

    @RequestMapping("")
    public String ptmain(Model model,
                         CustDto custDto,
                         HttpSession session) throws Exception {
        CustDto loggedInUser = (CustDto) session.getAttribute("loginid");
        String custId = loggedInUser.getCustId();

        List<PtDto> pts = ptService.getPTByTrainerId(custId);

        // 예약 데이터를 모델에 추가
        model.addAttribute("pts", pts);


        model.addAttribute("top", pdir+"top");
        model.addAttribute("center", pdir+"center");


        return "index";
    }

    @RequestMapping("/write")
    public String write(Model model,
                        CustDto custDto,
                        HttpSession session){

        CustDto loggedInUser = (CustDto) session.getAttribute("loginid");
        String custId = loggedInUser.getCustId();


        model.addAttribute("top", pdir+"top");
        model.addAttribute("center", pdir+"write");


        return "index";
    }



    // PT 삭제 처리
    @PostMapping("/delete")
    public String deletePts(Model model,@RequestBody Map<String, List<Integer>> request) {
        List<Integer> ptNos = request.get("ptNos");

        ptService.deletePts(ptNos); // 여러 PT 삭제


        model.addAttribute("top", pdir+"top");
        model.addAttribute("center", pdir+"center");

        return "index";
    }

    @GetMapping("/edit")
    public String editForm(Model model, @RequestParam("ptNo") Integer ptNo, HttpServletRequest request) throws Exception {
        if (ptNo == null) {
            // ptNo가 null이면 예외 처리 또는 리다이렉션
            return "redirect:/pt"; // 예시로 pt 목록 페이지로 이동
        }

        PtDto pt = ptService.gets(ptNo); // ptNo를 이용해 PT 정보 조회
        request.setAttribute("pt", pt);


        model.addAttribute("top", pdir + "top");
        model.addAttribute("center", pdir + "update");
        return "index"; // update.jsp로 이동
    }

    // PT 수정 처리
    @PostMapping("/update")
    public String update(Model model,
                           PtDto ptDto,
                         HttpSession session) throws Exception {
        try {
            ptService.modify(ptDto); // 수정 처리
        } catch (Exception e) {
            e.printStackTrace();
            return "error"; // 수정 실패 시 에러 페이지로 이동
        }
        CustDto loggedInUser = (CustDto) session.getAttribute("loginid");
        String custId = loggedInUser.getCustId();
        if (loggedInUser == null) {
            return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 이동
        }
        List<PtDto> pts = ptService.getPTByTrainerId(custId);

        model.addAttribute("pts", pts);


        model.addAttribute("top", pdir + "top");
        model.addAttribute("center", pdir + "center");
        return "index"; // 수정 후 PT 목록 페이지로 리다이렉트
    }








}
