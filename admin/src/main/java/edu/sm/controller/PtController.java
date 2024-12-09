package edu.sm.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.PtDto;
import edu.sm.app.dto.TrainerDto;
import edu.sm.app.service.CustCheckService;
import edu.sm.app.service.CustService;
import edu.sm.app.service.PaymentService;
import edu.sm.app.service.PtService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.ResponseEntity;
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
                         TrainerDto trainerDto,
                         HttpSession session) throws Exception {
        TrainerDto loggedInTrainer = (TrainerDto) session.getAttribute("loginid");
        String trainerId = loggedInTrainer.getTrainerId();

        List<PtDto> pts = ptService.getPTByTrainerId(trainerId);

        // 예약 데이터를 모델에 추가
        model.addAttribute("pts", pts);

        model.addAttribute("left", pdir+"left");
        model.addAttribute("top", pdir+"top");
        model.addAttribute("center", pdir+"center");


        return "index";
    }

    @RequestMapping("/write")
    public String write(Model model,
                        TrainerDto trainerDto,
                        HttpSession session){

        TrainerDto loggedInTrainer = (TrainerDto) session.getAttribute("loginid");
        String trainerId = loggedInTrainer.getTrainerId();

        model.addAttribute("left", pdir+"left");
        model.addAttribute("top", pdir+"top");
        model.addAttribute("center", pdir+"write");


        return "index";
    }

    @RequestMapping("/ptimpl")
    public String ptimpl(Model model,
                               TrainerDto trainerDto,
                               PtDto ptDto,
                               HttpSession session) throws DuplicateKeyException, Exception {
        log.info("ptimpl 까지옴");
        TrainerDto loggedInTrainer = (TrainerDto) session.getAttribute("loginid");
        String trainerId = loggedInTrainer.getTrainerId();
        if (loggedInTrainer == null) {
            return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 이동
        }
        try {
            ptService.add(ptDto); // DB에 사용자 추가
        } catch (DuplicateKeyException e) {
            throw e; // 예외 발생하면 전달
        } catch (Exception e) {
            throw e;
        }
        // 사용자 ID를 이용해 운동일지 내역 조회

        List<PtDto> pts = ptService.getPTByTrainerId(trainerId);


        model.addAttribute("pts", pts);

        model.addAttribute("left", pdir+"left");
        model.addAttribute("top", pdir+"top");
        model.addAttribute("center", pdir+"center");

        return "index";
    }

    // PT 삭제 처리
    @PostMapping("/delete")
    public String deletePts(Model model,@RequestBody Map<String, List<Integer>> request) {
        List<Integer> ptNos = request.get("ptNos");

        ptService.deletePts(ptNos); // 여러 PT 삭제

        model.addAttribute("left", pdir+"left");
        model.addAttribute("top", pdir+"top");
        model.addAttribute("center", pdir+"center");

        return "index";
    }

    // PT 수정 페이지로 이동
    @GetMapping("/edit")
    public String editForm(Model model,@RequestParam("ptNo") Integer ptNo, HttpServletRequest request) throws Exception {
        PtDto pt = ptService.gets(ptNo);
        request.setAttribute("pt", pt);

        model.addAttribute("left", pdir+"left");
        model.addAttribute("top", pdir+"top");
        model.addAttribute("center", pdir+"update");
        return "index"; // update.jsp로 이동
    }

    // PT 수정 처리
    @PostMapping("/update")
    public String updatePt(PtDto ptDto) {
        try {
            ptService.modify(ptDto); // 수정 처리
        } catch (Exception e) {
            e.printStackTrace();
            return "error"; // 수정 실패 시 에러 페이지로 이동
        }
        return "redirect:/pt/list"; // 수정 후 PT 목록 페이지로 리다이렉트
    }








}
