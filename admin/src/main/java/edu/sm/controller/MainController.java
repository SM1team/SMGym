package edu.sm.controller;

import com.github.pagehelper.Page;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import edu.sm.app.dto.*;
import edu.sm.app.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {

    private final TrainerService trainerService;
    private final ReservationService reservationService;
    private final CustService custService;
    private final TrainerCheckService trainerCheckService;
    private final NoticeService noticeService;
    private final CustCheckService custCheckService;


    @Value("${app.url.server-url}")
    String serverUrl;
    final private PaymentService paymentService;

    @RequestMapping("/")
    public String main(HttpSession session, Model model) throws Exception {

        List<AttendanceRateDto> members = custCheckService.getAttendanceRate();  // 출석률 데이터 조회

        List<Map<String, Object>> attendanceList = trainerCheckService.getTodayAttendance();

        // 최신 공지사항 시작 메인페이지에 나오게 해주는 로직
        List<NoticeDto> recentNotices = noticeService.getRecentNotices();
        log.info("Fetching recent notices");

        // 콘솔에 최신 공지사항 top4 리스트 출력
        for (NoticeDto notice : recentNotices) {
            log.info("Notice Title: " + notice.getNoticeTitle());
            log.info("Notice Content: " + notice.getNoticeContent());
            log.info("Notice Date: " + notice.getNoticeDate());
        }

        // 현재 달 정보 추가
        LocalDate now = LocalDate.now();
        String currentMonth = now.format(DateTimeFormatter.ofPattern("yyyy-MM"));  // 예: 2024-12

        model.addAttribute("members", members);  // JSP에 members 데이터 전달
        model.addAttribute("trainers", attendanceList);
        model.addAttribute("recentNotices", recentNotices);

        model.addAttribute("currentMonth", currentMonth);  // 현재 달 정보 전달
        // 세션에서 로그인 정보 확인
        Object loginId = session.getAttribute("loginid");

//        if (loginId == null) {
//            // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
//            return "redirect:/login";
//        }

        // 월별 매출 통계 가져오기
        Map<String, Double> monthlySales = paymentService.getMonthlySales();
        // 나이대별 매출 통계 가져오기
        Map<String, Double> oldSales = paymentService.getOldSales();

        // 매출 데이터를 JSON 형식으로 JSP에 전달
        model.addAttribute("monthlySales", new ObjectMapper().writeValueAsString(monthlySales));
        log.info("Monthly Sales: {}", monthlySales);
        model.addAttribute("oldSales", new ObjectMapper().writeValueAsString(oldSales));

        // 메인 페이지를 반환
        model.addAttribute("charturl", serverUrl);
        model.addAttribute("serverurl", serverUrl);

        return "index";
    }

    @RequestMapping("/websocket")
    public String websocket(Model model ){
        model.addAttribute("serverurl",serverUrl);//얘가 중요한친구임. 여기에 127.0.0...넣으면 수시로 바꿀 수 없으니가 yml에 다로 빼놓음.

        model.addAttribute("top","top");
        model.addAttribute("left","left");
        model.addAttribute("center","websocket");
        return "index";
    }

    @RequestMapping("/chat")
    public String chat(Model model){
        model.addAttribute("serverurl",serverUrl);
        model.addAttribute("center","chat");
        return "index";
    }


    @RequestMapping("/logout")
    public String logout(HttpSession httpSession){
        if(httpSession != null){
            httpSession.invalidate();
        }
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model , HttpSession httpSession){
        if(httpSession != null){
            httpSession.invalidate();
        }

        return "login";
    }


    @RequestMapping("/loginimpl")
    public String loginimpl(
            @RequestParam("id") String id,
            @RequestParam("pwd") String pwd,
            HttpSession session) throws Exception {
        TrainerDto trainerDto = trainerService.get(id);
        if (trainerDto == null || !trainerDto.getTrainerPwd().equals(pwd)) {
            // 로그인 실패 시 처리
            return "redirect:/login?error=true";
        }

        session.setAttribute("loginid", trainerDto);
        return "redirect:/";
    }

    @RequestMapping("/reservation")
    public String reservation(Model model) throws Exception {
        model.addAttribute("top","top");
        model.addAttribute("left","left");
        model.addAttribute("center","reservation");


        return "index";
    }

    @RequestMapping("/trainercheck")
    public String trainercheck(Model model) throws Exception {
        model.addAttribute("center","trainercheck");


        return "index";
    }

    @RequestMapping("/logoutimpl")
    public String logoutimpl(HttpSession session, Model model) {
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/findimpl")
    public String findimpl(Model model,
                           Search search,
                           @RequestParam(value = "pageNo",defaultValue = "1") int pageNo
    ) throws Exception {
        log.info("Search:" + search.toString());//실제 값 제대로 올라오는지 check 위해.
        PageInfo<ReservationDto> p;
        p = new PageInfo<>(reservationService.reservationgetfindPage(pageNo,search),3); //5: 하단 네비게이션 수

        model.addAttribute("cpage",p); //cpage라는 이름으로 PageInfo객체 담음.
//        model.addAttribute("target","reservation");

        model.addAttribute("search",search);
        //화면에서 search를 했다는 증표를 넣어준다.(객체를 넣어준것.)

        model.addAttribute("center","reservation");

        return "index";

    }
    @RequestMapping("/reservationupdateimpl")
    public String reservationupdateimpl(Model model,
                                        @RequestParam("reservationNo") int reservationNo
    ) throws Exception {
//        회원가입을 하는동시에 사용자의 정보를 session에 담아서 동작을 시키기 위함
        log.info("reservationNo:" + reservationNo);

        ReservationDto reservationDto = new ReservationDto();
        reservationDto.setReservationNo(reservationNo);
        reservationDto.setReservationState("예약완료"); // 예약 상태를 '예약완료'로 설정

        // 서비스에서 예약 상태 업데이트
        reservationService.modify(reservationDto);


        return "index";
    }
    @RequestMapping("/custdeleteimpl")
    public String custdeleteimpl(Model model,
                                 @RequestParam("custId") String custId
    ) throws Exception {
//        회원가입을 하는동시에 사용자의 정보를 session에 담아서 동작을 시키기 위함
        log.info("reservationNo:" + custId);

        // 서비스에서 예약 상태 업데이트
        custService.del(custId);
        model.addAttribute("top","top");
        model.addAttribute("left","left");
        model.addAttribute("center","cust");

        return "index";
    }
    @RequestMapping("/custfindimpl")
    public String custfindimpl(Model model,
                               Search search,
                               @RequestParam(value = "pageNo",defaultValue = "1") int pageNo
    ) throws Exception {
        log.info("Search:" + search.toString());//실제 값 제대로 올라오는지 check 위해.
        PageInfo<CustDto> p;
        p = new PageInfo<>(custService.custfindpage(pageNo,search),3); //5: 하단 네비게이션 수

        model.addAttribute("custpage",p); //cpage라는 이름으로 PageInfo객체 담음.
//        model.addAttribute("target","reservation");

        model.addAttribute("search",search);
        //화면에서 search를 했다는 증표를 넣어준다.(객체를 넣어준것.)



        model.addAttribute("center", "cust");

        return "index";

    }
    @RequestMapping("/cust")
    public String cust(Model model){
        model.addAttribute("top","top");
        model.addAttribute("left", "left");
        model.addAttribute("center", "cust");


        return "index";
    }


// 트레이너-------------------------------------------------------
    @RequestMapping("/trainerdeleteimpl")
    public String trainerdeleteimpl(Model model, @RequestParam("trainerId") String trainerId) throws Exception {
//        회원가입을 하는동시에 사용자의 정보를 session에 담아서 동작을 시키기 위함

        // 서비스에서 예약 상태 업데이트
        trainerService.del(trainerId);
        model.addAttribute("top","top");
        model.addAttribute("left","left");
        model.addAttribute("center","trainer");

        return "index";
    }
    @RequestMapping("/trainerfindimpl")
    public String trainerfindimpl(Model model,
                               Search search,
                               @RequestParam(value = "pageNo",defaultValue = "1") int pageNo
    ) throws Exception {
        log.info("Search:" + search.toString());//실제 값 제대로 올라오는지 check 위해.
        PageInfo<TrainerDto> p;
        p = new PageInfo<>(trainerService.trainerfindpage(pageNo,search),3); //5: 하단 네비게이션 수

        model.addAttribute("trainerpage",p); //cpage라는 이름으로 PageInfo객체 담음.
//        model.addAttribute("target","reservation");

        model.addAttribute("search",search);
        //화면에서 search를 했다는 증표를 넣어준다.(객체를 넣어준것.)



        model.addAttribute("center", "trainer");

        return "index";

    }

    @RequestMapping("/trainercheckimpl")
    public String trainercheckimpl(Model model,
                                  Search search,
                                  @RequestParam(value = "pageNo",defaultValue = "1") int pageNo
    ) throws Exception {
        log.info("Search:" + search.toString());//실제 값 제대로 올라오는지 check 위해.
        PageInfo<TrainerCheckDto> p;
        p = new PageInfo<>(trainerCheckService.trainercheckfindpage(pageNo,search),3); //5: 하단 네비게이션 수

        model.addAttribute("trainercheckpage",p); //cpage라는 이름으로 PageInfo객체 담음.
//        model.addAttribute("target","reservation");

        model.addAttribute("search",search);
        //화면에서 search를 했다는 증표를 넣어준다.(객체를 넣어준것.)



        model.addAttribute("center", "trainercheck");

        return "index";

    }


    @RequestMapping("/trainer")
    public String trainer(Model model){ //트레이너 조회
        model.addAttribute("top","top");
        model.addAttribute("left", "left");
        model.addAttribute("center", "trainer");


        return "index";
    }
    @RequestMapping("/traineradd")
    public String traineradd(Model model){ //트레이너 조회
        model.addAttribute("top","top");
        model.addAttribute("left", "left");
        model.addAttribute("center", "traineradd");


        return "index";
    }

    @RequestMapping("/traineraddimpl")
    public String traineraddimpl (Model model,
                                TrainerDto trainerDto,
                                HttpSession session) throws DuplicateKeyException, Exception {
//        회원가입을 하는동시에 사용자의 정보를 session에 담아서 동작을 시키기 위함
        log.info("traineraddimpl 까지옴");
        try {
//            custDto.setCustPwd(passwordEncoder.encode(custDto.getCustPwd()));//Dto에서 입력된 pwd를 encode로 변환해서
            trainerService.add(trainerDto);//다시 db에 집어 넣는다.
            log.info("추가완료.");

        } catch (DuplicateKeyException e) {
//            throw new Exception("ER0001");//사용자에게 ER0001라는 내용의 메세지를 보냄.
            throw e;//예외 발생하면 떤지겠다.

        } catch (Exception e) {
            throw e;
        }

        session.setAttribute("trainer", trainerDto);
        //loginid라는 이름으로 객체를 끄집어내서 id,pwd,name등을 사용가능.

        model.addAttribute("center", "traineraddok");

        return "index";
    }

    @RequestMapping("/checkin")
    public String checkin(Model model){ //트레이너 조회
        model.addAttribute("top","top");
        model.addAttribute("left", "left");
        model.addAttribute("center", "checkin");


        return "index";
    }

    @RequestMapping("/checkout")
    public String checkout(Model model){ //트레이너 조회
        model.addAttribute("top","top");
        model.addAttribute("left", "left");
        model.addAttribute("center", "checkout");


        return "index";
    }




}
