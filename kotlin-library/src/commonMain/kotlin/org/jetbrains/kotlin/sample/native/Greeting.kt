package org.jetbrains.kotlin.sample.native

@Suppress("UNUSED")
class Greeting {
    private val platform by lazy { getPlatform() }

    fun greet() = "Hello, ${platform.name}!"
    fun callBar() = platform.bar()
    fun callBazz() = platform.bazz()
}