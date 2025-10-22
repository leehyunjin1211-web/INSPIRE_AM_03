

package com.lgcns.inspire_spring.test.domain;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter 
public class TestRequestDTO {
    private String emp_id;
    private String email;
    
}
