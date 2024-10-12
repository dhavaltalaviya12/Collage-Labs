public class NumberDemo {
        public static void main(String[] args) {
            try {
                int x = Integer.parseInt(args[0]);
                if (x < 0) {
                    throw new NegativeNumber();
                }
                if (x % 2 == 0) {
                    throw new EvenNumberIsAppered();
                }
                if (x > 7000) {
                    throw new GraterNum();
                }
                if (x > 1000 || x < 2000) {
                    throw new NumberRange();
                }
            } catch (NegativeNumber a) {
                a.printStackTrace();
            } catch (NumberRange c) {
                c.printStackTrace();
            } catch (GraterNum b) {
                b.printStackTrace();
            } catch (EvenNumberIsAppered d) {
                d.printStackTrace();
            }
        }
    }
    
    class NegativeNumber extends Exception {
        NegativeNumber() {
            super("please enter positive number");
        }
    }
    
    class NumberRange extends Exception {
        NumberRange() {
            super("please enter number between 1000 and 2000");
        }
    }
    
    class GraterNum extends Exception {
        GraterNum() {
            super("please enter number less then 7000");
        }
    }
    
    class EvenNumberIsAppered extends Exception {
        EvenNumberIsAppered() {
            super("you can not enter even number");
        }
    }

