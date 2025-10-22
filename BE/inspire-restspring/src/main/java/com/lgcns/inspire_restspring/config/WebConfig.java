package com.lgcns.inspire_restspring.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")  // 모든 API 경로
                .allowedOriginPatterns("http://localhost:3000")
                .allowedMethods("GET", "POST")
                .allowCredentials(true) ; // 인증허용   
                
    }

}
