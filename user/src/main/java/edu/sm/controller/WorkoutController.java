package edu.sm.controller;


import edu.sm.app.dto.CustDto;

import edu.sm.app.dto.WorkoutDetailDto;
import edu.sm.app.dto.WorkoutLogDto;
import edu.sm.app.service.WorkoutLogService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/workout")
@RequiredArgsConstructor
@Slf4j
public class WorkoutController {

    final WorkoutLogService workoutLogService;

//    @Value("${app.url.server-url}")
//    String serverurl;




    String wdir = "workout/";
    @RequestMapping("")
    public String workoutmain(Model model, HttpSession session) throws Exception {
        // 세션에서 로그인된 사용자 정보 가져오기
        CustDto loggedInUser = (CustDto) session.getAttribute("loginid");

        if (loggedInUser == null) {
            return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 이동
        }

        // 사용자 ID를 이용해 운동일지 내역 조회
        String custId = loggedInUser.getCustId();
        List<WorkoutLogDto> workouts = workoutLogService.getWorkoutByCustId(custId);

        // 예약 데이터를 모델에 추가
        model.addAttribute("workouts", workouts);
        model.addAttribute("top",wdir+"top");
        model.addAttribute("center",wdir+"center");

        return "index"; // JSP 페이지 이름
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("workoutNo") int workoutNo) throws Exception {
        List<WorkoutDetailDto> workoutDetailDto = workoutLogService.WorkoutdetailNo(workoutNo);

        model.addAttribute("details", workoutDetailDto);

        model.addAttribute("top", wdir + "top");
        model.addAttribute("center", wdir + "detail");

        return "index";
    }



//    @RequestMapping("/reservation")
//    public String reservation(Model model){
//        model.addAttribute("top",wdir+"top");
//        model.addAttribute("center",wdir+"reservation");
//        return "index";
//    }


//    @RequestMapping("/history")
//    public String history(Model model, HttpSession session) throws Exception {
//        // 세션에서 로그인된 사용자 정보 가져오기
//        CustDto loggedInUser = (CustDto) session.getAttribute("loginid");
//
//        if (loggedInUser == null) {
//            return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 이동
//        }
//
//        // 사용자 ID를 이용해 예약 내역 조회
//        String custId = loggedInUser.getCustId();
//        List<ReservationDto> reservations = workoutLogService.getReservationsByCustId(custId);
//
//        // 예약 데이터를 모델에 추가
//        model.addAttribute("reservations", reservations);
//        model.addAttribute("top",wdir+"top");
//        model.addAttribute("center",wdir+"history");
//
//        return "index"; // JSP 페이지 이름
//    }




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
