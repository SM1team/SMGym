package edu.sm.controller;


import edu.sm.app.dto.TrainerDto;
import edu.sm.app.service.TrainerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/trainer")
@RequiredArgsConstructor
public class TrainerController {

    final TrainerService trainerService;

    String dir = "trainer/";
    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        // Database에서 데이터를 가지고 온다.
        List<TrainerDto> list = new ArrayList<>();
        try {
            list = trainerService.get();
            model.addAttribute("trainers",list);
            model.addAttribute("center",dir+"get");
        } catch (Exception e) {
            throw new Exception("ER0001");
        }
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){

        model.addAttribute("center",dir+"add");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model,@RequestParam("id") String id){
        // Database에서 데이터를 가지고 온다.
        TrainerDto trainerDto = null;
        try {
            trainerDto = trainerService.get(id);
            model.addAttribute("trainer", trainerDto);
            model.addAttribute("center",dir+"detail");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }
    @RequestMapping("/update")
    public String update(Model model,TrainerDto trainerDto){

        try {
            trainerService.modify(trainerDto);
            return "redirect:/trainer/detail?id="+trainerDto.getTrainerId();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model,TrainerDto trainerDto) throws Exception {
        trainerService.add(trainerDto);
        return "redirect:/trainer/detail?id="+trainerDto.getTrainerId();

    }
    @RequestMapping("/delete")
    public String delete(Model model,@RequestParam("id") String id){

        try {
            trainerService.del(id);
            return "redirect:/trainer/get";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//    @RequestMapping("/search")
//    public String search(Model model, @RequestParam(value = "keyword", required = false) String keyword) {
//        List<TrainerDto> list = new ArrayList<>();
//        try {
//            // 검색어가 있을 경우, 검색어에 맞는 트레이너들만 필터링해서 가져오기
//            if (keyword != null && !keyword.trim().isEmpty()) {
//                list = trainerService.search(keyword);
//            } else {
//                // 검색어가 없으면 모든 트레이너 목록을 가져오기
//                list = trainerService.get();
//            }
//            model.addAttribute("trainers", list);
//            model.addAttribute("center", dir + "get");  // 검색 결과는 기존 'get' 페이지로 보여줄 수 있음
//        } catch (Exception e) {
//            throw new RuntimeException("Search Error: " + e.getMessage());
//        }
//        return "index";
//    }
}
