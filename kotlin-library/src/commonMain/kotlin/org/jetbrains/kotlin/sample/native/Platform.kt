package org.jetbrains.kotlin.sample.native

interface Platform {
    val name: String

    fun bar()
    fun bazz()
}

expect fun getPlatform(): Platform