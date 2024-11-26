package edu.sm.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@Slf4j
public class WebMvcConfig implements WebMvcConfigurer {

    @Value("${app.dir.imgdir}")
    String imgdir;
    @Value("${app.dir.logdir}")
    String logdir;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        log.info("================"+logdir);

        registry.addResourceHandler("/img/**")
                .addResourceLocations("file:///c:/SMGym/user/src/main/resources/static/assets/img");
        registry.addResourceHandler("/logs/**").addResourceLocations(logdir);

    }
    //우리의 webapp가 사용될 수 있도록 등록한다.

}
