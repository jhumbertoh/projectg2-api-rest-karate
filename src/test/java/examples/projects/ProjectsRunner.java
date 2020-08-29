package examples.projects;

import com.intuit.karate.junit5.Karate;

public class ProjectsRunner {

    @Karate.Test
    Karate testProjects(){
        return Karate.run("projects").relativeTo(getClass());
    }

}
