package kr.co.mj.magic_view_plugin

import android.content.Context
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.platform.PlatformView


class MagicPlatformView internal constructor(
        private val context: Context?,
        messenger: BinaryMessenger,
        id: Int,
        args: Any?): PlatformView, MethodCallHandler{

    private val textView: TextView = TextView(context)
    private val methodChannel: MethodChannel = MethodChannel(messenger, "MagicView/$id")

    init {
        methodChannel.setMethodCallHandler(this)
    }

    override fun dispose() {

    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when(call.method){
            "receiveFromFlutter"->{
                val text = call.argument<String>("text");
                if(text!=null){
                    textView.text = text;
                    result.success("receiveFromFlutter success")
                }else{
                    result.error("-1","Error","Error Details")
                }
            }
            else -> result.notImplemented()
        }
    }

    private fun sendFromNative(text: String) {
        methodChannel.invokeMethod("sendFromNative", text)
    }

    override fun getView(): View {
        textView.text = "nativeView";
        return textView;
    }

}
