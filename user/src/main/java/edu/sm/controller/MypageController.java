    package edu.sm.controller;


    import edu.sm.app.dto.CustDto;
    import edu.sm.app.dto.PaymentDto;
    import edu.sm.app.service.CustService;
    import edu.sm.app.service.PaymentService;
    import jakarta.servlet.http.HttpSession;
    import lombok.RequiredArgsConstructor;
    import lombok.extern.slf4j.Slf4j;
    import org.springframework.stereotype.Controller;
    import org.springframework.ui.Model;
    import org.springframework.web.bind.annotation.PostMapping;
    import org.springframework.web.bind.annotation.RequestMapping;
    import org.springframework.web.bind.annotation.RequestParam;

    import java.util.List;

    @Controller
    @RequestMapping("/mypage")
    @RequiredArgsConstructor
    @Slf4j
    public class MypageController {

        private final PaymentService paymentService;
        String dir = "mypage/";
        private final CustService custService;

        // /mypage 요청에 대한 처리
        @RequestMapping("")
        public String my(Model model) {
            model.addAttribute("top", dir + "top");
            model.addAttribute("center", dir + "center");
            return "index";
        }
        @RequestMapping("/info")
        public String get(Model model,HttpSession session) throws Exception {
            CustDto custDto = (CustDto) session.getAttribute("loginid");
            if (custDto != null) {
                model.addAttribute("cust", custDto);
                log.info("로그인된 고객 정보: {}", custDto);
            } else {
                log.info("로그인된 고객 정보가 없습니다.");
            }
            model.addAttribute("cust",custDto);
            model.addAttribute("top",dir+"top");
            model.addAttribute("center",dir+"info");
            return "index";
        }

        @RequestMapping("/updateimpl")
        public String updateimpl(Model model, CustDto custDto ) throws Exception {
            custService.modify(custDto);
            return "redirect:/mypage/info";
        }

        @RequestMapping("/deleteimpl")
        public String deleteimpl(Model model, @RequestParam("id") String id ) throws Exception {
            custService.del(id);
            return "redirect:/";
        }

        @RequestMapping("/payment")
        public String paymentGet(Model model, HttpSession session) throws Exception {
            CustDto custDto = (CustDto) session.getAttribute("loginid");
            if (custDto == null) {
                log.info("로그인된 고객 정보가 없습니다.");
                return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
            }

            model.addAttribute("cust", custDto);
            log.info("로그인된 고객 정보: {}", custDto);

            // 고객 ID로 결제 내역 가져오기
            List<PaymentDto> payments = paymentService.getPaymentByCustId(custDto.getCustId());
            log.info("결제 내역: {}", payments);

            if (payments == null || payments.isEmpty()) {
                log.info("결제 내역이 없습니다.");
            }

            model.addAttribute("payments", payments);
            model.addAttribute("top", dir + "top");
            model.addAttribute("center", dir + "payment");
            return "index";
        }



    }







