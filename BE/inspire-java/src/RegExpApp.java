import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegExpApp {
   /*
        정규표현식
        - 패턴을 정의하고 해당 패턴에 맞는 문자열을 추출하거나, 치환과 같은 작업을 수행
        - java.util.regex(Pattern, Matchcher)
    */
    public static void main(String[] args) {
        
        String txt = "저는 남자이고, 제 네이버 계정은 hyunjinlee1@naver.com 이며, 핸드폰 번호는 010-1234-5678입니다. ";

        // 전화번호
        Pattern pattern = Pattern.compile("\\d{3}-\\d{4}-\\d{4}");
        Matcher match   = pattern.matcher(txt);
        if(match.find()){
            System.out.println(">>> 전화번호 추출");
            System.out.println(match.group());
        }

        // 이메일 패턴
        String regex = "[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-z]{2,}"; // 소문자 2개 이상 반복
        pattern = Pattern.compile(regex);
        match   = pattern.matcher(txt);
        if(match.find()){
            System.out.println(">>> 이메일 추출");
            System.out.println(match.group());
        }

        

    }
    
}
