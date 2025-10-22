public class VariavleApp {
    public static void main(String[] args) {
        // 변수 선언 및 값 할당
        int age = 24;
        double height = 178;
        char gender = 'M';
        String name = "jslim";
        boolean isMarriage = true;

        // 변수를 사용하여 출력
        System.out.println(age);
        System.out.println(height);
        System.out.println(name);
        System.out.println(isMarriage);

        // casting( ) , upcasting(자동), downcasting(연산자를 이용해서 강제로)
        // (타입)변수명
        byte x = 10, y = 10, sum = 0;
        sum = (byte)(x + y);
        System.out.println("연산된 결과는 : " +sum);

        char charVar01 = 'A'; char charVar02 = 'B';
        System.out.println(charVar01 + charVar02);
        System.out.println((char)97);
        
        double doubleVar = 10.4;
    }
    
}
