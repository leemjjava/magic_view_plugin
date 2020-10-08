package kr.co.mj.magic_view_plugin

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class MagicViewFactory(private val messenger: BinaryMessenger)
    : PlatformViewFactory(StandardMessageCodec.INSTANCE){

    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        return MagicPlatformView(context,messenger,viewId,args)
    }
}