package edu.sm.controller;

import com.github.pagehelper.PageInfo;
import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.ReservationDto;
import edu.sm.app.dto.Search;
import edu.sm.app.dto.TrainerDto;
import edu.sm.app.service.CustService;
import edu.sm.app.service.ReservationService;
import edu.sm.app.service.TrainerService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {

    private final TrainerService trainerService;
    private final ReservationService reservationService;
    private final CustService custService;


    @Value("${app.url.server-url}")
    String serverUrl;

    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("charturl",serverUrl);
        model.addAttribute("serverurl",serverUrl);

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
        model.addAttribute("top","top");
        model.addAttribute("left","left");
        model.addAttribute("center","login");
        return "index";
    }


    @RequestMapping("/loginimpl")
    public String loginimpl(
            @RequestParam("id") String id,
            @RequestParam("pwd") String pwd,
            HttpSession Session) throws Exception {
        TrainerDto trainerDto = null;

        log.info("여기까지옴");


            trainerDto = trainerService.get(id);


        Session.setAttribute("loginid",trainerDto);
        log.info("loginid까지 됨.");

        return "redirect:/";
    }
    @RequestMapping("/reservation")
    public String reservation(Model model) throws Exception {
        model.addAttribute("top","top");
        model.addAttribute("left","left");
        model.addAttribute("center","reservation");


        return "index";
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
