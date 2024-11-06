package edu.sm.controller;

import edu.sm.app.dto.CustDto;
//import edu.sm.app.dto.Marker;
import edu.sm.app.service.CustService;
import edu.sm.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@RestController
@Slf4j
@RequiredArgsConstructor
public class AjaxRestController {
    private final CustService custService;
    @Value("${app.dir.uploadimgdir}")
    String uploadImgDir;

//    @RequestMapping("/getmarkers")
//    public Object getmarkers(@RequestParam("target") int target){
//
//        final CustService custService;
//
//
//
//
//        log.info("Tager" + target);
//        List<Marker> markers = new ArrayList<>();
//        if(target == 100){
//            markers.add(new Marker(37.564472,126.990841,"순대국1","ss1.jpg",101));
//            markers.add(new Marker(37.544472,126.970841,"순대국2","ss2.jpg",102));
//            markers.add(new Marker(37.564472,126.970841,"순대국3","ss3.jpg",103));
//        } else if (target == 200) {
//            markers.add(new Marker(35.175109,129.165474,"돈까스","bb1.jpg",201));
//            markers.add(new Marker(35.165109,129.175474,"돈까스1","bb2.jpg",202));
//            markers.add(new Marker(35.185109,129.185474,"돈까스2","bb3.jpg",203));
//
//        }else {
//            markers.add(new Marker(33.254564,126.540944,"짬뽕","JJ1.jpg",301));
//            markers.add(new Marker(33.244564,126.550944,"짬뽕1","JJ2.jpg",302));
//            markers.add(new Marker(33.264564,126.530944,"짬뽕2","JJ3.jpg",303));
//
//        }
//        log.info("Size"+markers.size());
//
//        return markers;
//    }
    @RequestMapping("/getbike")
    public Object getbike(){
        JSONObject obj = new JSONObject();
        double lat = 36.799102;
        double lng = 127.075026;
        Random r = new Random();
        float num = r.nextFloat(1);
        lat += num/10;
        lng += num/10;
        obj.put("lat", lat);
        obj.put("lng", lng);
        return obj;
    }

    @RequestMapping("/checkid")
    public Object checkid(@RequestParam("rid") String id) throws Exception {//rid로 보냈으니깐 rid로 받은거임.//object으로도 가능,Requsetparam도 가능.
        JSONObject obj = new JSONObject();
        CustDto custDto = null;
        custDto = custService.get(id);
        obj.put("result", "0"); //register.jsp에서 check
        if(custDto != null){
            obj.put("result", "1");//만약 select 된게 존재한다면 1로 변경
        }


        return obj;
    }


    @RequestMapping("/getctime")
    public Object getctime(){
        JSONObject obj = new JSONObject();
        // {'ctime','2023-12-12'}
        LocalDateTime now = LocalDateTime.now();
        obj.put("ctime", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(now));
        return obj;
    }
    @RequestMapping("/getdata")
    public Object getdata(){
        // [{"no":1, "desc":"연무5호"},{},{}]
        JSONArray arr = new JSONArray();
        for(int i=1;i<6;i++){
            JSONObject obj = new JSONObject();
            obj.put("no",i);
            obj.put("desc","연무5호");
            arr.add(obj);
        }
        return arr;
    }

    @RequestMapping("/saveimg")
    public String saveimg(@RequestParam("file") MultipartFile file) throws IOException {//받는 이름도 'file'
        String imgname = file.getOriginalFilename();//파일에서 이름을 끄집어내서
        FileUploadUtil.saveFile(file, uploadImgDir);
        return imgname;//이미지 이름이 내려온다.
    }
}
