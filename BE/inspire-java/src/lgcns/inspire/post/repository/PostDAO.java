package lgcns.inspire.post.repository;

import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import lgcns.inspire.post.domain.dto.PostRequestDTO;
import lgcns.inspire.post.domain.dto.PostResponseDTO;

/*
DAO(Data Access Object) 
- db 와의 작업을 담당하는 클래스 
- 입력(C), 읽기(R), 수정(U), 삭제(D) : CRUD 
- Structure Query Language (SQL) : DDL, DML, DCL, Select Query 


*/
public class PostDAO {

    private List<PostResponseDTO> posts ; 

    public PostDAO() {
        // 파일 입출력으로 데이터 저장 및 로드를 위해서
        posts = new ArrayList<PostResponseDTO>();

        // 파일 입력
        try(ObjectInputStream ois = new ObjectInputStream(new FileInputStream("C:\\AM_INSPIRE\\BE\\inspire-java\\text.txt"))){
            posts.clear();
            posts = (List<PostResponseDTO>)ois.readObject();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        // 초기 데이터 생성 
        // posts = new ArrayList<>(Arrays.asList(
        //     PostResponseDTO.builder()
        //                     .id(1)
        //                     .title("mvc")
        //                     .content("springboot")
        //                     .writer("jslim").build(),
        //     PostResponseDTO.builder()
        //                     .id(2)
        //                     .title("stream api")
        //                     .content("기초문법")
        //                     .writer("jsalim").build(),
        //     PostResponseDTO.builder()
        //                     .id(3)
        //                     .title("lambda")
        //                     .content("함수형 인터페이스와 연동")
        //                     .writer("lgcns").build(),
        //     PostResponseDTO.builder()
        //                     .id(4)
        //                     .title("springboot")
        //                     .content("pattern 조합")
        //                     .writer("inspire").build()
        // ));
    }
    // C(입력)
    public int insertRow(PostRequestDTO request) {
        System.out.println(">>>> dao insertRow");
        int flag = 1 ; 
        posts.add(PostRequestDTO.toResponseDTO(request)) ;
        return flag ;  
    } 
    // R(전체 검색) 
    public List<PostResponseDTO> selectRow() {
        System.out.println(">>>> dao selectRow");
        // 데이터베이스 연동 후 값을 가져온다고 가정하고 더미데이터를 생성
        if (posts.size() == 0){
            // 파일로 부터 데이터 로딩해서 맴버변수에 할당하고 반환
        }else{ 
            // 기존 Posts 반환 
        }
        return posts ; 

    }
    // public PostResponseDTO selectRow(String id) {
    //     System.out.println(">>>> dao selectRow id");
    //     // R(조건에 만족하는 검색) 
    //     // SQL : select * from table where id = ? ; 
    //     return null ;
    // }

    // U(수정)
    // Stream peek() : 원본 리스트 안의 객체 속성을 변경할 수 있다.
    public int updateRow(PostRequestDTO request) {
        System.out.println(">>>> dao updateRow");
        // for(int idx = 0 ; idx < posts.size(); idx++){
        //     PostRequestDTO post = post.get(idx);
        //     if( post.getId() == request.getId()){
        //         post.setTitle(request.getTitle());
        //         post.setContent(request.getContent());
        //     }
        // }

        // posts.stream()
        //     .filter(post -> post.getId() == request.getId())
        //     .findFirst()
        //     .ifPresent(post -> {
        //         post.setTitle();
        //         post.setContent();
        //     });

        posts.stream()
            .filter(post -> post.getId() == request.getId())
            .peek( post -> post.setTitle(request.getTitle()))
            .peek( post -> post.setContent(request.getContent()))
            .forEach(System.out::println);
         return 0 ;
    }

    // D(삭제) 
    public int deleteRow(Map<String, Integer> map) {
        System.out.println(">>>> dao deleteRow id : " +map.get("key"));

        // delete from teble where id = ? (SQL)
        // posts.removeIf(null)
        boolean flag = posts.removeIf(post -> post.getId() == map.get("key"));
        return (flag) ? 1 : 0 ;
    }
    
}
