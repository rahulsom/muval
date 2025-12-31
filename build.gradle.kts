import com.github.rahulsom.waena.WaenaExtension
import nebula.plugin.contacts.Contact
import nebula.plugin.contacts.ContactsExtension

plugins {
    java
    application
    alias(libs.plugins.waena.root)
    alias(libs.plugins.waena.published)
    alias(libs.plugins.shadow)
    id("io.github.rahulsom.muval")
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

group = "com.github.rahulsom"
description = "Meaningful Use Validator based on NIST's own."

application {
    mainClass.set("gov.nist.mu.validation.Validator")
}

val applicationOnly by configurations.creating {
    extendsFrom(configurations.runtimeOnly.get())
}

sourceSets {
    main {
        java {
            srcDir("src/main/java")
            srcDir("nist/generated/src/java")
        }
        resources {
            srcDir("src/main/resources")
            srcDir("build/generated/resources/cachefileDir")
            srcDir("build/generated/resources/stylesheetDir")
        }
    }
}

repositories {
    mavenCentral()
}

dependencies {
    compileOnly(libs.lombok)
    annotationProcessor(libs.lombok)

    implementation(libs.slf4j.api)
    applicationOnly(libs.slf4j.simple)

    implementation(libs.commons.cli)
    implementation(libs.commons.lang3)
    implementation(libs.jsr173.api)
    implementation(libs.xml.commons.resolver)
    implementation(libs.bundles.jaxb)

    implementation(libs.saxon)
    implementation(variantOf(libs.saxon) { classifier("dom") })
    implementation(variantOf(libs.saxon) { classifier("dom4j") })
    implementation(variantOf(libs.saxon) { classifier("jdom") })
    implementation(variantOf(libs.saxon) { classifier("s9api") })
    implementation(variantOf(libs.saxon) { classifier("xom") })
    implementation(variantOf(libs.saxon) { classifier("xqj") })
    implementation(variantOf(libs.saxon) { classifier("sql") })
    implementation(libs.xmlbeans) {
        exclude(group = "net.sf.saxon")
    }

    testImplementation(libs.junit.jupiter.api)
    testImplementation(libs.assertj.core)
    testImplementation(libs.activation)
    
    testRuntimeOnly(libs.bundles.junit.runtime)
}

tasks.test {
    useJUnitPlatform()
}

extensions.findByType<ContactsExtension>()?.apply {
    with(addPerson("rahulsom@noreply.github.com")) {
        moniker("Rahul Somasunderam")
        roles("owner")
        github("https://github.com/rahulsom")
    }
}

waena {
     publishMode.set(WaenaExtension.PublishMode.Central)
}

tasks.named<ProcessResources>("processResources") {
    duplicatesStrategy = DuplicatesStrategy.INCLUDE
}

tasks.named<Jar>("sourcesJar") {
    dependsOn("createCachefile", "createStylesheet")
    duplicatesStrategy = DuplicatesStrategy.INCLUDE
}

tasks.named<com.github.jengelman.gradle.plugins.shadow.tasks.ShadowJar>("shadowJar") {
    configurations = listOf(applicationOnly)
}