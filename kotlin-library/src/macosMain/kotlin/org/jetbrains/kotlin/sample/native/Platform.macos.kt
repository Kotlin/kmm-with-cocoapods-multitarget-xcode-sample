package org.jetbrains.kotlin.sample.native

import platform.Foundation.NSProcessInfo

class IOSPlatform: Platform {
    override val name: String = "macOS " + NSProcessInfo.processInfo.operatingSystemVersionString

    override fun bar() {
        println("macosBar")
    }

    override fun bazz() {
        println("macosBazz")
    }
}

actual fun getPlatform(): Platform = IOSPlatform()