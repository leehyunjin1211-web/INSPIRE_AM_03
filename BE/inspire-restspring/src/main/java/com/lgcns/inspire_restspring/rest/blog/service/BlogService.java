package com.lgcns.inspire_restspring.rest.blog.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lgcns.inspire_restspring.rest.blog.domain.BlogRequestDTO;
import com.lgcns.inspire_restspring.rest.blog.domain.BlogResponseDTO;
import com.lgcns.inspire_restspring.rest.blog.repository.BlogMapper;
import com.lgcns.inspire_restspring.rest.comment.domain.CommentResponseDTO;
import com.lgcns.inspire_restspring.rest.comment.repository.CommentMapper;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BlogService {

    private final BlogMapper mapper ; 
    private final CommentMapper commentMapper;
    public List<BlogResponseDTO> select() {
        System.out.println("[debug] >>> blog service select "); 
        return mapper.selectRow() ;
    }

    public int insert(BlogRequestDTO request) {
        System.out.println("[debug] >>> blog service insert "); 
        return mapper.insertRow(request) ; 
    }  

   @Transactional
    public BlogResponseDTO find(Integer idx) {
        System.out.println("[debug] >>> blog service find ");

        BlogResponseDTO blog = mapper.findById(idx) ;
        System.out.println("[debug] >>> blog find id :" +blog.getId());

        List<CommentResponseDTO> list = commentMapper.selectRow(blog.getId());
        System.out.println("[debug] >>> blog find id list:" +list);
        
        blog.setComments(list);
        return blog ;

    }

    public int update(Integer id , BlogRequestDTO request) {
        System.out.println("[debug] >>> blog service update "); 
        request.setId(id);
        return mapper.updateRow(request) ;
    }

    public int delete(Integer id) {
        System.out.println("[debug] >>> blog service delete "); 
        return mapper.deleteRow(BlogRequestDTO.builder().id(id).build()) ; 
    }

    public List<BlogResponseDTO> findKeyword(String keyword) {
        System.out.println("[debug] >>> blog service findKeyword "); 
        return mapper.findByKeyword(keyword) ;
    }




}



