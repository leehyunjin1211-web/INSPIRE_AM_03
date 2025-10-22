package com.lgcns.inspire_spring.test.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lgcns.inspire_spring.test.domain.TestRequestDTO;
import com.lgcns.inspire_spring.test.domain.TestResponseDTO;

@Mapper
public interface TestMapper {
    public TestResponseDTO selectRow(TestRequestDTO request);
    
} 
