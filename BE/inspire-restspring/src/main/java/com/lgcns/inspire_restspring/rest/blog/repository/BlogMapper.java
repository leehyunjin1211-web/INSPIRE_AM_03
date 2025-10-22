package com.lgcns.inspire_restspring.rest.blog.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lgcns.inspire_restspring.rest.blog.domain.BlogRequestDTO;
import com.lgcns.inspire_restspring.rest.blog.domain.BlogResponseDTO;

@Mapper
public interface BlogMapper {
    public List<BlogResponseDTO>    selectRow() ; 
    public int                      insertRow(BlogRequestDTO request) ;
    public int                      updateRow(BlogRequestDTO request) ; 
    public BlogResponseDTO          findById(Integer id) ;
    public int                      deleteRow(BlogRequestDTO request) ; 
    public List<BlogResponseDTO>    findByKeyword(String keyword) ;

}

