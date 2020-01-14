package com.example.hello

import android.content.Context;
import android.content.Intent
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar


class HelloPlugin(private val mContent: Context) : MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "hello")
            channel.setMethodCallHandler(HelloPlugin(registrar.activity()));
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (call.method == "startActivity") {
            val intent = Intent(mContent, MainActivity::class.java)
            mContent.startActivity(intent)
        } else {
            result.notImplemented()
        }
    }
}
