package conduitApp.utils;

import com.github.javafaker.Faker;

public class DataGenerator {

    public static String getTitle(){
        Faker faker = new Faker();

        return faker.book().title().toString();
    }
    
}
