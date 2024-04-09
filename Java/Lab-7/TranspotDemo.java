interface Transport{
    void deliver();
}
abstract class Animal{
    
}
class Tiger extends Animal{
    void deliver(){
        System.out.println("You are Tiger");
    }
}
class Camel extends Animal implements Transport{
    public void deliver(){
        System.out.println("You are Camel");
    }
}
class Deer extends Animal{
    void deliver(){
        System.out.println("You are Deer");
    }
}
class Donkey extends Animal implements Transport{
    public void deliver(){
        System.out.println("You are Donkey");
    }
}

public class TranspotDemo {
    public static void main(String[] args) {
        Animal[] a = {new Tiger(), new Camel(), new Deer(), new Donkey()};
        for(Animal b : a){
            if(b instanceof Transport){
                Transport t1 = (Transport)b;
                t1.deliver();
            }
        }
    }
    
}