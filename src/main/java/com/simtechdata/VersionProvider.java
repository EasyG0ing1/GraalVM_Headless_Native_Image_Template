package ${PACKAGE_NAME};

import picocli.CommandLine;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Properties;

public class VersionProvider implements CommandLine.IVersionProvider {
    public VersionProvider() {}

    @Override
    public String[] getVersion() {
        Properties prop = new Properties();
        try (InputStream input = VersionProvider.class.getClassLoader().getResourceAsStream("version.properties")) {
            if (input == null) {
                return new String[] {"Could not determine current version"};
            }
            prop.load(input);
            return new String[] {prop.getProperty("version")};
        }
        catch (IOException e) {
            return new String[] {Arrays.toString(e.getStackTrace())};
        }
    }
}
