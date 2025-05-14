plugins {
    alias(libs.plugins.kotlinMultiplatform)
    alias(libs.plugins.kotlinCocoapods)
}

group = "org.jetbrains.kotlin.sample.native"
version = "1.0"

kotlin {
    iosArm64()
    iosSimulatorArm64()
    macosArm64()
    tvosArm64()
    tvosSimulatorArm64()
    watchosSimulatorArm64()
    watchosDeviceArm64()

    cocoapods {
        summary = "Kotlin CocoaPods library"
        homepage = "https://github.com/Kotlin/multitarget-xcode-with-kotlin-cocoapods-sample"

        podfile = project.file("../severalTargetsXcodeProject/Podfile")

        ios.deploymentTarget = "16.6"
        osx.deploymentTarget = "13.5"
        tvos.deploymentTarget = "16.6"
        watchos.deploymentTarget = "9.6"

        framework {
            baseName = "KotlinLibrary"
            isStatic = true
        }
    }
}
