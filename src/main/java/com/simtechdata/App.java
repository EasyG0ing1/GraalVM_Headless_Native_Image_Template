package ${PACKAGE_NAME};

import ${PACKAGE_NAME}.VersionProvider;
import picocli.CommandLine;

import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;

@CommandLine.Command(
        name = "App",
        mixinStandardHelpOptions = true,
        versionProvider = VersionProvider.class,
        usageHelpWidth = 190,
        description = {
                "",
                "${PROJECT_NAME} is a great program that does great things.",
                "Note: It is not necessary to use the '=' sign when assigning values to arguments. A space will work too.",
                ""
        }
)

public class App implements Callable<Integer> {

    /*
     * ***********************************************
     * Read the README.md file before writing any code
     * ***********************************************
     */


    @CommandLine.Option(
            names = {"-s", "--string"},
            description = "String argument example"
    )
    private String stringExample;

    @CommandLine.Option(
            names = {"-u", "--timeUnit"},
            description = "Map<TimeUnit, Long> as many as you need"
    )
    private Map<TimeUnit, Long> timeout;


    @CommandLine.Option(
            names = {"-b", "--boolean"},
            description = "Boolean argument example",
            defaultValue = "false")
    private boolean booleanExample;

    @CommandLine.Option(
            names = {"-a", "--array"},
            arity = "1..*",
            description = "Array argument example"
    )
    private String[] arrayExample;

    @CommandLine.Option(
            names = {"-g", "--graal"},
            description = "Used for GraalVM reflection inspection",
            defaultValue = "false")
    private boolean graal;


    @Override
    public Integer call() throws Exception {

        if (timeout != null) {
            System.out.println("You passed in the --timeUnit argument with these values:");
            for (Map.Entry<TimeUnit, Long> entry : timeout.entrySet()) {
                System.out.println("\t" + entry.getKey() + " = " + entry.getValue());
            }
            return 0;
        }

        if (stringExample != null) {
            System.out.print("You passed in: --string ");
            System.out.println(stringExample);
            return 0;
        }

        if (booleanExample) {
            System.out.println("You passed in the --boolean argument");
            return 0;
        }

        if (arrayExample != null) {
            System.out.println("You passed in the --array argument with these Strings:");
            for (String s : arrayExample) {
                System.out.println("\t" + s);
            }
        }

        if (graal) {
            graal();
            return 0;
        }

        return 0;
    }

    public static void main(String[] args) throws Exception {
        int exitCode = new CommandLine(new App()).execute(args);
        System.exit(exitCode);
    }

    private static void graal() {
        /**
         * Use this method to run other parts of your code so that every possible case where reflection
         * is used gets experienced by the graalvm reflection inspector.
         */
        System.out.println("Running Reflection Code for GraalVM Inspector");
    }

}
