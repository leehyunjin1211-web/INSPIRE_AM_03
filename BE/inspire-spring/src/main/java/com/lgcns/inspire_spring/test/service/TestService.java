package com.lgcns.inspire_spring.test.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgcns.inspire_spring.test.dao.TestMapper;
// import com.lgcns.inspire_spring.test.dao.TestRepository;
import com.lgcns.inspire_spring.test.domain.TestRequestDTO;
import com.lgcns.inspire_spring.test.domain.TestResponseDTO;

@Service
public class TestService {

    // @Autowired
    // private TestRepository repository;

     @Autowired
    private TestMapper repository;

    public TestResponseDTO testService(TestRequestDTO request){
        System.out.println("[debug] >>> service");
        System.out.println("[debug] >>> repository"+repository);
        return repository.selectRow(request);
        
    }
}
