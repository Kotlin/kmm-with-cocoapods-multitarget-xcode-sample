package org.jetbrains.kotlin.sample.native

import platform.WatchKit.WKInterfaceDevice

class IOSPlatform: Platform {
    override val name: String = "watchOS " + WKInterfaceDevice.currentDevice().systemVersion

    override fun bar() {
        println("watchosBar")
    }

    override fun bazz() {
        println("watchosBazz")
    }
}

actual fun getPlatform(): Platform = IOSPlatform()