package edu.sm.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
@Slf4j
public class SmExceptionHandler {
    @ExceptionHandler(DuplicateKeyException.class)//이 예외가 발생하면
    public String ex1(Model model, DuplicateKeyException e) {//발생되는 Exception을 받는다.(예외 객체를 넣어주고)
        model.addAttribute("msg", "ID가 중복");
        model.addAttribute("center", "error");
        return  "index";

    }

    @ExceptionHandler(Exception.class)//이 예외가 발생하면
    public String ex1(Model model, Exception e) {//발생되는 Exception을 받는다.(예외 객체를 넣어주고)
        model.addAttribute("msg", e.getMessage());
        model.addAttribute("center", "error");
        return  "index";

    }
}
