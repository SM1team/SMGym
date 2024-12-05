package edu.sm.controller;


import edu.sm.app.dto.CustDto;

import edu.sm.app.dto.WorkoutDetailDto;
import edu.sm.app.dto.WorkoutLogDto;
import edu.sm.app.service.WorkoutLogService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Random;

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
    @RequestMapping("/write")
    public String showWritePage(Model model ) {
        List<String> exerciseNames = workoutLogService.getAllExerciseNames();

        // 랜덤으로 운동 이름 선택
        String randomExerciseName = exerciseNames.get(new Random().nextInt(exerciseNames.size()));

        // 랜덤 운동 이름을 모델에 추가
        model.addAttribute("randomExerciseName", randomExerciseName);
        model.addAttribute("top", wdir + "top");
        model.addAttribute("center", wdir + "write");
        return "index";  // /views/write.jsp로 포워딩됨
    }

    @RequestMapping("/save")
    public String saveWorkout(
            @RequestParam Date workoutDate,
            @RequestParam int workoutTime,
            @RequestParam int workoutCalories,
            @RequestParam String workoutComments,
            @RequestParam String machineName,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        // 로그인된 사용자 정보 가져오기
        CustDto loggedInUser = getLoggedInUser(session, redirectAttributes);
        if (loggedInUser == null) {
            return "redirect:/login";  // 로그인 페이지로 리다이렉트
        }

        // 운동 기록 저장 로직
        String custId = loggedInUser.getCustId();
        WorkoutLogDto workoutLogDto = WorkoutLogDto.builder()
                .custId(custId)
                .workoutDate(workoutDate)  // Date로 변환
                .workoutTime(workoutTime)
                .workoutCalories(workoutCalories)
                .workoutComments(workoutComments)
                .machineName(machineName)
                .build();

        try {
            // 운동 기록 서비스 호출하여 저장
            workoutLogService.add(workoutLogDto);

            // 성공 시 메시지 추가 후 리다이렉트
            redirectAttributes.addFlashAttribute("message", "운동 기록이 저장되었습니다.");
            return "redirect:/workout";  // 운동 기록 목록 페이지로 리다이렉트
        } catch (Exception e) {
            // 오류 발생 시 로그 기록 및 오류 메시지 추가
            log.error("운동 기록 저장 중 오류 발생", e);
            redirectAttributes.addFlashAttribute("message", "운동 기록 저장 중 오류가 발생했습니다.");
            return "redirect:/workout"; // 오류 발생 시에도 목록 페이지로 리다이렉트
        }

    }

    // 로그인한 사용자 정보를 가져오는 메서드
    private CustDto getLoggedInUser(HttpSession session, RedirectAttributes redirectAttributes) {
        CustDto loggedInUser = (CustDto) session.getAttribute("loginid");
        if (loggedInUser == null) {
            // 로그인 정보가 없으면 메시지를 전달하고 리다이렉트
            redirectAttributes.addFlashAttribute("message", "로그인이 필요합니다.");
        }
        return loggedInUser;
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
