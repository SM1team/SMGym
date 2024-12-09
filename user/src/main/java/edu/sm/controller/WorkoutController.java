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
        try {
            // 세션에서 로그인된 사용자 정보 가져오기
            CustDto loggedInUser = (CustDto) session.getAttribute("loginid");

            // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
            if (loggedInUser == null) {
                return "redirect:/login";
            }

            // 사용자 ID를 이용해 운동일지 내역 조회
            String custId = loggedInUser.getCustId();
            List<WorkoutLogDto> workouts = workoutLogService.getWorkoutByCustId(custId);

            // 각 운동 일지에 대해 소모 칼로리 및 운동 시간 합산
            for (WorkoutLogDto workoutLog : workouts) {
                // workoutLog.getWorkoutNo()에 해당하는 WorkoutDetail을 가져옴
                List<WorkoutDetailDto> workoutDetails = workoutLogService.getWorkoutDetails(workoutLog.getWorkoutNo());

                // 소모 칼로리 합산
                int totalCalories = workoutDetails.stream()
                        .mapToInt(WorkoutDetailDto::getWdetailCalories) // 칼로리 합산
                        .sum();
                workoutLog.setWorkoutCalories(totalCalories); // WorkoutLogDto에 소모 칼로리 설정

                // 운동 시간 합산
                int totalWorkoutTime = workoutDetails.stream()
                        .mapToInt(WorkoutDetailDto::getWdetailTime) // 운동 시간만 추출 (예: 분 단위)
                        .sum();
                workoutLog.setWorkoutTime(totalWorkoutTime); // WorkoutLogDto에 운동 시간 설정

                // 운동 일지에 대해 소모 칼로리 합산과 운동 시간을 더한 후, 첫 번째 세부 사항에서 날짜와 코멘트 설정
                if (!workoutDetails.isEmpty()) {
                    workoutLog.setWorkoutDate(workoutDetails.get(0).getWorkoutDate()); // 첫 번째 운동 세부 사항에서 날짜 설정
                    workoutLog.setWorkoutComments(workoutDetails.get(0).getWorkoutComments()); // 첫 번째 운동 세부 사항에서 코멘트 설정
                }
            }

            // 모델에 운동일지 목록과 관련된 데이터를 추가
            model.addAttribute("workouts", workouts);
            model.addAttribute("top", wdir + "top");
            model.addAttribute("center", wdir + "center");

            // "index.jsp" 페이지로 이동
            return "index";

        } catch (Exception e) {
            // 예외가 발생하면 에러 페이지로 리다이렉트
            e.printStackTrace();
            return "error";
        }
    }



    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam(name = "workoutNo", required = false) Integer workoutNo) throws Exception {
        // workoutNo가 없으면 첫 번째 운동 기록을 불러온다
        if (workoutNo == null || workoutNo == 0) {
            // workoutNo가 없는 경우에는 예를 들어 첫 번째 운동 기록을 불러오거나
            // 목록 페이지로 리다이렉트할 수 있음
            return "redirect:/workout";
        }

        // workoutNo가 존재하는 경우 처리
        List<WorkoutDetailDto> workoutDetailDtoList = workoutLogService.WorkoutdetailNo(workoutNo);
        model.addAttribute("workoutNo", workoutNo);
        model.addAttribute("details", workoutDetailDtoList);

        // workoutNo에 해당하는 소모 칼로리 합산 계산
        Integer getTotalWorkoutTime = workoutLogService.getTotalWorkoutTime(workoutNo);
        Integer totalCalories = workoutLogService.getTotalCalories(workoutNo);
        model.addAttribute("totalCalories", totalCalories); // 소모 칼로리 합산을 모델에 추가
        model.addAttribute("getTotalWorkoutTime", getTotalWorkoutTime); // 운동 시간 합산을 모델에 추가


        model.addAttribute("top", wdir + "top");
        model.addAttribute("center", wdir + "detail");

        return "index";
    }

    // 운동 세부 정보 저장
    @PostMapping("/saveWorkoutDetail")
    public String saveWorkoutDetail(WorkoutDetailDto workoutDetailDto) {
        workoutLogService.saveWorkoutDetail(workoutDetailDto);
        return "redirect:/workout/detail?workoutNo=" + workoutDetailDto.getWorkoutNo();
    }

    @PostMapping("/addWorkoutDetail")
    public String addWorkoutDetail(@ModelAttribute WorkoutDetailDto workoutDetailDto, Model model) throws Exception {
        // workoutNo 값 확인 (폼에서 전달됨)
        System.out.println("workoutNo: " + workoutDetailDto.getWorkoutNo()); // workoutNo 확인
        System.out.println("Exercise Name: " + workoutDetailDto.getWdetailExname()); // 입력된 운동명 확인

        // workoutDetailDto에 전달된 값으로 세부 정보를 추가
        workoutLogService.addWorkoutDetail(workoutDetailDto);

        // 세부 정보가 추가된 후, 해당 workoutNo에 관련된 세부 정보를 모델에 추가
        model.addAttribute("details", workoutLogService.getWorkoutDetails(workoutDetailDto.getWorkoutNo()));
        model.addAttribute("top", wdir + "top");
        model.addAttribute("center", wdir + "addWorkoutDetail");


        // 리디렉션: 세부 정보를 추가한 후, 해당 운동 상세 페이지로 이동
        return "redirect:/workout/detail?workoutNo=" + workoutDetailDto.getWorkoutNo();
    }

    @RequestMapping("/detail/delete")
    public String delete(@RequestParam("workoutNo") int workoutNo, HttpSession session) {
        if (workoutNo == 0) {
            return "redirect:/workout"; // 잘못된 요청이라면 리다이렉트
        }

        try {
            workoutLogService.deleteWorkoutDetail(workoutNo);  // workoutNo를 이용한 삭제 처리
            return "redirect:/workout";  // 삭제 후 목록으로 리다이렉트
        } catch (Exception e) {
            return "redirect:/workout";  // 오류 발생 시 목록 페이지로 리다이렉트
        }
    }

    // 운동 세부 기록 수정
    @RequestMapping("/detail/edit")
    public String editWorkoutDetail(@RequestParam("workoutNo") int workoutNo,
                                    @RequestParam("workoutDetailNo") int workoutDetailNo,
                                    @RequestParam("wdetailExname") String wdetailExname,
                                    @RequestParam("wdetailSets") int wdetailSets,
                                    @RequestParam("wdetailCount") int wdetailCount,
                                    @RequestParam("wdetailWeight") int wdetailWeight,
                                    @RequestParam("wdetailCalories") int wdetailCalories,
                                    @RequestParam("wdetailTime") int wdetailTime,
                                    HttpSession session, Model model) {
        // 로그인 확인
        String loggedInUserId = (String) session.getAttribute("loginid");
        if (loggedInUserId == null) {
            return "redirect:/login"; // 로그인하지 않으면 로그인 페이지로 이동
        }

        // 수정할 운동 세부 기록 DTO 생성
        WorkoutDetailDto workoutDetailDto = WorkoutDetailDto.builder()
                .wdetailId(workoutDetailNo)
                .workoutNo(workoutNo)
                .wdetailExname(wdetailExname)
                .wdetailSets(wdetailSets)
                .wdetailCount(wdetailCount)
                .wdetailWeight(wdetailWeight)
                .wdetailCalories(wdetailCalories)
                .wdetailTime(wdetailTime)
                .build();

        try {
            // 운동 세부 기록 수정
            workoutLogService.editWorkoutDetail(workoutDetailDto);

            // 수정 후 운동 기록 상세 정보 조회
            List<WorkoutDetailDto> workoutDetails = workoutLogService.getWorkoutDetails(workoutNo);
            model.addAttribute("workoutDetails", workoutDetails);
            model.addAttribute("pageTitle", "운동 기록 상세보기");
            model.addAttribute("center", "workout/workoutDetail");
        } catch (Exception e) {
            // 오류 처리
            model.addAttribute("error", "운동 세부 기록 수정 중 오류가 발생했습니다.");
        }

        return "index"; // index.jsp 반환
    }



    // 운동 세부 기록 추가 처리
    @RequestMapping("/workoutdetail/add")
    public String addWorkoutDetail(@RequestParam("workoutNo") int workoutNo,
                                   @RequestParam("machineNo") int machineNo,
                                   @RequestParam("wdetailExname") String wdetailExname,
                                   @RequestParam("wdetailSets") int wdetailSets,
                                   @RequestParam("wdetailCount") int wdetailCount,
                                   @RequestParam("wdetailWeight") int wdetailWeight,
                                   @RequestParam("wdetailCalories") int wdetailCalories,
                                   @RequestParam("wdetailTime") int wdetailTime,
                                   HttpSession session,
                                   Model model) {

        // 세션에서 로그인된 사용자 확인
        String loggedInUserId = (String) session.getAttribute("loginid");
        if (loggedInUserId == null) {
            return "redirect:/login";  // 로그인 페이지로 리다이렉트
        }

        // 운동 세부 기록 DTO 생성
        WorkoutDetailDto workoutDetailDto = WorkoutDetailDto.builder()
                .workoutNo(workoutNo)
                .machineNo(machineNo)
                .wdetailExname(wdetailExname)
                .wdetailSets(wdetailSets)
                .wdetailCount(wdetailCount)
                .wdetailWeight(wdetailWeight)
                .wdetailCalories(wdetailCalories)
                .wdetailTime(wdetailTime)
                .build();

        try {
            // 운동 세부 기록 추가
            workoutLogService.addWorkoutDetail(workoutDetailDto);
        } catch (Exception e) {
            model.addAttribute("error", "운동 세부 기록 추가 중 오류가 발생했습니다.");
            return "redirect:/workout/detail?workoutNo=" + workoutNo;
        }

        // 운동 기록 상세 조회
        WorkoutLogDto workoutLog = null;
        try {
            workoutLog = workoutLogService.get(workoutNo);
        } catch (Exception e) {
            model.addAttribute("error", "운동 기록 상세 조회 실패");
        }

        // 운동 세부 정보 조회
        List<WorkoutDetailDto> workoutDetails = null;
        try {
            workoutDetails = workoutLogService.getWorkoutDetails(workoutNo);
        } catch (Exception e) {
            model.addAttribute("error", "운동 세부 정보 조회 실패");
        }

        // 모델에 데이터 추가
        model.addAttribute("workoutLog", workoutLog);
        model.addAttribute("workoutDetails", workoutDetails);
        model.addAttribute("pageTitle", "운동 기록 상세보기");
        model.addAttribute("center", "workout/workoutDetail");

        return "index";  // index.jsp 반환
    }




    // 쓰기 버튼
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

    // 쓰기 버튼을 누르고 저장을 누르면 저장됌
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
    // 새로운 항목 추가 버튼 클릭시 생성
    @PostMapping("/add")
    public ResponseEntity<String> addWorkout(HttpSession session) {
        try {
            // 로그인된 사용자 정보 가져오기
            CustDto loggedInUser = (CustDto) session.getAttribute("loginid");

            if (loggedInUser == null) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("로그인이 필요합니다.");
            }

            // 새 운동 항목 생성
            WorkoutLogDto workoutLogDto = WorkoutLogDto.builder()
                    .custId(loggedInUser.getCustId()) // 로그인된 사용자 ID 설정
                    .build(); // workout_no는 자동 증가값(AI) 처리되므로 따로 설정하지 않음.

            // 서비스에서 새 항목 저장
            workoutLogService.add(workoutLogDto);

            // 성공적인 응답
            return ResponseEntity.status(HttpStatus.OK).body("새로운 항목이 추가되었습니다.");
        } catch (Exception e) {
            log.error("운동 기록 추가 중 오류 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("새로운 항목을 추가하는 데 실패했습니다.");
        }
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
