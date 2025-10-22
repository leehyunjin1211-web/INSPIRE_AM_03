package lgcns.inspire.control.game;

import java.util.Scanner;

public class GuessGame {
    // 1~100 난수 생성 후 반환
    public static int generatorNan(){
        int answer = (int)(Math.random()*100) + 1;
        return answer;

    }
    /*
        기회는 총 10번
        - 매개변수로 정답을 반환받고
        - 반환값으로 
        - 성공) xx번째 정답을 맞췄습니다.
        - 실패) 10번의 기회를 모두 성공하였습니다.
     */
    public String gameStart(int answer){
        String result = null;

        Scanner scan = new Scanner(System.in);
        System.out.print("정답을 입력하세요 :");
        int guess = scan.nextInt();
        System.out.printf("당신의 생각의 %d 이네요", guess);
        
        return result;
    }
}

