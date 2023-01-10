package org.example;

import java.util.Map;

public class Demo01 {
    static Integer catCount;
    static Animal animalCount = new Animal(catCount);

    static {
        try {
            catCount = 10;
        }catch (Exception e){
            System.out.println("aaa");
        }

    }


    public static void main(String[] args) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println("aaa");
            }
        });


        System.out.println(animalCount);
    }

    private static class Animal {
        private final Integer catCount;
        public Animal(Integer catCount) {
            this.catCount = catCount;
        }

        @Override
        public String toString() {
            return "Animal{" +
                    "catCount=" + catCount +
                    '}';
        }
    }
}
