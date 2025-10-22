import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.Buffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.swing.plaf.synth.SynthScrollPaneUI;

import lgcns.inspire.post.domain.dto.PostResponseDTO;

public class IOStreamApp {

    public static void main(String[] args) {

        // System.out.print(">>> stream 이용한 데이터 입력 :");
        // try{
        //     int input = System.in.read();                      // 1byte 한글 입력 x
        //     System.out.println(">>>result :" +(char)input);
        // } catch (IOException e){
        //     e.printStackTrace();
        // }

        /// char stream
        // System.out.print(">>> stream 이용한 데이터 입력 :");
        // BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        // try{
        //     String input = br.readLine();
        //     System.err.println(">>> result : " +input);
        // }catch (IOException e){
        //     e.printStackTrace();
        // }
        System.out.println(">>> 파일에 데이터(문자열, 객체, ....)을 저장하기");
       

        // 9 AutoCloseable
        //try (  ){ }catch( ){   }
        String data = "IO 스트림을 이용한 파일 출력입니다.";

        // try (BufferedWriter bw = new BufferedWriter(new FileWriter(new File("./text.txt")))) {
        //     bw.write(data);
        //     System.out.println(">>> 파일 저장 완료");

        // } catch (IOException e) {
        //     e.printStackTrace();
        // }

        List<PostResponseDTO> posts = new ArrayList<>(Arrays.asList(
            PostResponseDTO.builder()
                            .id(1)
                            .title("mvc")
                            .content("springboot")
                            .writer("jslim").build(),
            PostResponseDTO.builder()
                            .id(2)
                            .title("stream api")
                            .content("기초문법")
                            .writer("jsalim").build(),
            PostResponseDTO.builder()
                            .id(3)
                            .title("lambda")
                            .content("함수형 인터페이스와 연동")
                            .writer("lgcns").build(),
            PostResponseDTO.builder()
                            .id(4)
                            .title("springboot")
                            .content("pattern 조합")
                            .writer("inspire").build()
        ));

        System.out.println(">>> 직렬화된 객체를 파일에 저장!");
        // ObjectOutputStream -> FileOutoutStream -> "test.txt"
        // oos.writeObject(posts);

        // ObjecrInputStream <- FileInputStream <- "test.txt";
        // List<PostResponseDTO> posts = (List<PostResponseDTO>)ois.readObject();

        // try(ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("./text.txt"))){
        //     oos.writeObject(posts);
        //     System.out.println(">>> 직렬화된 객체 파일에 저장 완료");
        // }catch(Exception e){
        //     e.printStackTrace();
        // }

         try(ObjectInputStream ois = new ObjectInputStream(new FileInputStream("./text.txt"))){
            posts.clear();
            posts = (List<PostResponseDTO>)ois.readObject();
            posts.stream()
                .forEach(System.out::println);
        }catch(Exception e){
            e.printStackTrace();
        }

    }
    
}
