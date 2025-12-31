package buildscript;

import org.gradle.api.Plugin;
import org.gradle.api.Project;
import org.gradle.api.tasks.bundling.Zip;
import org.jetbrains.annotations.NotNull;

public class MuvalPlugin implements Plugin<@NotNull Project> {
    @Override
    public void apply(Project project) {
        var tasks = project.getTasks();

        tasks.register("downloadResources", task -> {
            task.setDescription("Download Schemas and Schematron files from NIST");
            task.doLast(t -> DownloadHelper.getInstance().downloadFrom(project.file("docTypes.xml"), project.file("nist")));
        });

        var createStylesheet = tasks.register("createStylesheet", Zip.class, task -> {
            task.setDescription("Package Stylesheet");
            task.from("schematron");
            task.include("*.xsl");
            task.getDestinationDirectory().set(project.file("build/generated/resources/stylesheetDir"));
            task.getArchiveFileName().set("stylesheet");
        });

        var createCachefile = tasks.register("createCachefile", Zip.class, task -> {
            task.setDescription("Package Cachefile");
            task.from("nist/generated/prebundle");
            task.getDestinationDirectory().set(project.file("build/generated/resources/cachefileDir"));
            task.getArchiveFileName().set("cachefile");
        });

        tasks.named("compileJava", task -> task.dependsOn(createStylesheet, createCachefile));
        tasks.named("processResources", task -> task.dependsOn(createStylesheet, createCachefile));
    }
}
