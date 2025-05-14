package org.jetbrains.kotlin.sample.native

import platform.UIKit.UIDevice

class IOSPlatform: Platform {
    override val name: String = UIDevice.currentDevice.systemName() + " " + UIDevice.currentDevice.systemVersion

    override fun bar() {
        println("iosBar")
    }

    override fun bazz() {
        println("iosBazz")
    }
}

actual fun getPlatform(): Platform = IOSPlatform()