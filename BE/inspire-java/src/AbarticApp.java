import lgcns.inspire.abstraction.Animal;
import lgcns.inspire.abstraction.Bird;
import lgcns.inspire.abstraction.SuperMan;
import lgcns.inspire.abstraction.inter.Flyer;

public class AbarticApp {

    public static void main(String[] args) {
        // 추상 클래스는 객체 생성 불가
        // Animal animal = new Animal() 

        // 배열 객체 생성으로 가능함
        Flyer [] animalAry = new Flyer[2];

        animalAry[0] = new Bird();
        animalAry[1] = new SuperMan();

        for(Flyer element : animalAry){
            element.fly();
        }
    }
    
}
