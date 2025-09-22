plugins {
    `java-gradle-plugin`
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

repositories {
    mavenCentral()
}

dependencies {
    annotationProcessor(libs.lombok)
    compileOnly(libs.lombok)
    implementation(libs.async.http.client)
    implementation(libs.netty3)
    implementation(libs.commons.lang)
    implementation(libs.bundles.jaxb)
}

gradlePlugin {
    val muval by plugins.creating {
        id = "io.github.rahulsom.muval"
        implementationClass = "buildscript.MuvalPlugin"
    }
}