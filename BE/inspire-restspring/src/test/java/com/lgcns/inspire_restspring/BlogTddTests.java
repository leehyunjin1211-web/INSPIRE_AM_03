package com.lgcns.inspire_restspring;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

// import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.lgcns.inspire_restspring.rest.blog.domain.BlogRequestDTO;
import com.lgcns.inspire_restspring.rest.blog.domain.BlogResponseDTO;
import com.lgcns.inspire_restspring.rest.blog.repository.BlogMapper;

@SpringBootTest
public class BlogTddTests {
    
    @Autowired
    private BlogMapper mapper ; 

    // @BeforeEach
    // public void init() {
    //     // givn 테스트용 데이터 사입 
    //     mapper.insertRow(BlogRequestDTO.builder()
    //                                 .title("불금")
    //                                 .content("이번주도 플렉스하자~~")
    //                                 .build()); 
    // }

    // TDD - Red(failing Test) : (블로그 등록 기능)
    @Test 
    public void blogInsertTest() {
        
        // given 
        BlogRequestDTO request = BlogRequestDTO.builder()
                                    .title("불금")
                                    .content("이번주도 플렉스하자~~")
                                    .build() ; 

        // when 
        int flag = mapper.insertRow(request); 
        System.out.println(">>>>>>>>>> flag : "+flag);
        System.out.println(">>>>>>>>>> id   : "+request.getId() ) ;
        
        // then 
        assertEquals(1, flag); 
        assertNotNull(request.getId() ); 

    } 

    @Test
    public void blogUpdateTest() {
        // given 
        BlogRequestDTO request = BlogRequestDTO.builder()
                                    .id(5)
                                    .title("TDD")
                                    .content("Junit 단위 테스트")
                                    .build() ; 
        // when 
        int flag = mapper.updateRow(request);
        System.out.println(">>>>>>>>>> flag : "+flag);

        // then (검증포인트) 
        assertEquals(1, flag); 

        BlogResponseDTO response = mapper.findById(request.getId()) ;
        assertEquals(request.getTitle()     , response.getTitle());
        assertEquals(request.getContent()   , response.getContent());
        
    }


    @Test
    public void blogListTest() {
        // givn

        // when 
        List<BlogResponseDTO> list = mapper.selectRow();  

        // then 
        // 검증포인트 : 조회결과 null 아님, 리스트에 데이터 존재여부
        // stream : 필터링을 통한 검증 
        assertNotNull(list); 
        assertFalse(list.isEmpty());
        assertTrue(list.size() >= 3); 

        // 무결성 
        assertTrue(list.stream()
                        .allMatch(blog -> blog.getTitle() != null )); 

    }

    @Test
    public void blogDeleteTest() {
        // givn
        BlogRequestDTO blog = BlogRequestDTO.builder()
                                .id(2)
                                .build() ; 
        // when : 삭제 실행
        int beforeCnt = mapper.selectRow().size() ; 
        int flag      = mapper.deleteRow(blog) ;
        int afterCnt  = mapper.selectRow().size() ; 
        
        // then 
        // 삭제된 row 확인 , 삭제 후 다시 조회 시 null , 전체 count 줄어든 것 확인 
        assertEquals(1, flag); 
        assertNull(mapper.findById(2)); 
        assertEquals(beforeCnt-1 , afterCnt); 
    }


    @Test
    public void blogFindKeyword() {
        // givn
        String keyword = "플렉스"; 
        // when 
        List<BlogResponseDTO> list = mapper.findByKeyword(keyword) ;

        // then 
        assertNotNull(list); 
        assertFalse(list.isEmpty());

        System.out.println(">>>>>>>>>> result ");
        list.stream()
            .forEach(System.out::println); 
    }
}
