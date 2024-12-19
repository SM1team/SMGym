package edu.sm;

import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
@Slf4j
class Day03ApplicationTests {

    @Autowired
    BCryptPasswordEncoder encoder;
    @Autowired
    StandardPBEStringEncryptor textEncoder;

    @Test
    void contextLoads() {
        String pwd = "abc";
        String encPwd = encoder.encode(pwd);
        log.info("Pwd: "+pwd);
        log.info("Enc Pwd: "+encPwd);

        String inputPwd = "abc";

        boolean result1 = encoder.matches(inputPwd, encPwd);
        log.info("result 1 : "+result1);

        String encText = textEncoder.encrypt("서울시");
        log.info("text Encodint 1 : "+encText);
        log.info("text Encodint 1 : "+textEncoder.decrypt(encText));



    }


    @Test
    void passwordEncryptionTest() {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String rawPassword = "password123";
        String encodedPassword = encoder.encode(rawPassword);

        System.out.println("Encoded Password: " + encodedPassword);

        // 매칭 여부 확인
        boolean isMatched = encoder.matches(rawPassword, encodedPassword);
        System.out.println("Password Matches: " + isMatched);

        // 검증 조건
        assertTrue(isMatched, "Password does not match");
    }




}