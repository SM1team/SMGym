package edu.sm.app.scheduler;


import edu.sm.app.dto.TrainerMsg;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component
@Slf4j
@RequiredArgsConstructor
public class Scheduler {

    private final SimpMessageSendingOperations simpMessageSendingOperations;

    @Scheduled(cron = "*/3 * * * * *")//
    public void cronJobDailyUpdate() {//이 함수가 3초에 한번씩 동작.
        log.info("====================================================");
        Random r = new Random();
        int content1 = r.nextInt(100)+1;
        int content2 = r.nextInt(1000)+1;
        int content3 = r.nextInt(500)+1;
        int content4 = r.nextInt(10)+1;
        TrainerMsg trainerMsg = new TrainerMsg();
        trainerMsg.setContent1(content1);
        trainerMsg.setContent2(content2);
        trainerMsg.setContent3(content3);
        trainerMsg.setContent4(content4);
        simpMessageSendingOperations.convertAndSend("/send2",trainerMsg);
    }




}