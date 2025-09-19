tasks.register<JavaExec>("downloadResources") {
    description = "Download Schemas and Schematron files from NIST"

    classpath(file("${rootDir}/buildSrc/build/classes/main"))

    mainClass.set("buildscript.DownloadHelper")
    args = listOf("docTypes.xml", "nist")
}

tasks.register<Zip>("createStylesheet") {
    description = "Package stylesheet"
    from("schematron")
    include("*.xsl")
    destinationDirectory.set(file("build/generated/resources/stylesheetDir"))
    archiveFileName.set("stylesheet")
}

tasks.register<Zip>("createCachefile") {
    description = "Package Cachefile"
    from("nist/generated/prebundle")
    destinationDirectory.set(file("build/generated/resources/cachefileDir"))
    archiveFileName.set("cachefile")
}

tasks.named("compileJava") { dependsOn("createStylesheet", "createCachefile") }
tasks.named("processResources") { dependsOn("createStylesheet", "createCachefile") }

tasks.named<ProcessResources>("processResources") {
    duplicatesStrategy = DuplicatesStrategy.INCLUDE
}
tasks.named<Jar>("sourcesJar") {
    dependsOn("createCachefile", "createStylesheet")
    duplicatesStrategy = DuplicatesStrategy.INCLUDE
}