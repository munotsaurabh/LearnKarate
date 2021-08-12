package testApp;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit5.Karate;

@KarateOptions(tags = {"@demo"})
class TestAppTest {
    
    // this will run all *.feature files that exist in sub-directories
    // see https://github.com/intuit/karate#naming-conventions   
    @Karate.Test
    Karate testAll() {
        return new Karate().relativeTo(getClass());
    }

    @Karate.Test
    Karate testTags() {
        return new Karate().feature().tags("@delete").relativeTo(getClass());
    }
    
}
