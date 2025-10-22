package com.lgcns.inspire_spring.test.dao;

import org.springframework.stereotype.Repository;

import com.lgcns.inspire_spring.test.domain.TestRequestDTO;
import com.lgcns.inspire_spring.test.domain.TestResponseDTO;

@Repository
public class TestRepository {
   /*
        SQL
        - JDBC
        1. driver loading
        2 Connection
        3. Statement(SQL)
        4. execute
        5.ResultSet
        6. close
    */

   public TestResponseDTO testRow(TestRequestDTO request){
        System.out.println("[debug] >>> repository");
        String testSQL= "SELECT * " + 
                    "FROM employee " + 
                    "WHERE emp_id = "+request.getEmp_id()+ 
                    "AND emp_name = "+request.getEmail() ;
        System.out.println("[debug] >>>" +testSQL);

        TestResponseDTO response = TestResponseDTO.builder()
                                        .emp_id("100")
                                        .emp_name("한선기")
                                        .salary(900)
                                        .build();
        return response;
    }
}




