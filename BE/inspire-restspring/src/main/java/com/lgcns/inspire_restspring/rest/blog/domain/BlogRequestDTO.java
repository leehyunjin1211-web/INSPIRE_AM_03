package com.lgcns.inspire_restspring.rest.blog.domain;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BlogRequestDTO {

    @Schema(description = "블로그 식별자" , example = "1")
    private Integer id ; 
    
    @Schema(description = "블로그 제목" , example = "스프링 재미있다.")
    private String title ; 

    @Schema(description = "블로그 내용" , example = "뻥이야")
    private String content ; 
}


