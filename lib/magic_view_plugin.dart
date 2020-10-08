import 'dart:async';

import 'package:flutter/services.dart';

class MagicViewPlugin {
  MethodChannel _channel;

  MagicViewPlugin(int id) {
    _channel = new MethodChannel('MagicView/$id');
    _channel.setMethodCallHandler(_handleMethod);
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case 'sendFromNative':
        String text = call.arguments as String;
        return new Future.value("Text from native: $text");
    }
  }

  Future<void> receiveFromFlutter(String text) async {
    try {
      final String result =
          await _channel.invokeMethod('receiveFromFlutter', {"text": text});
      print("Result from native: $result");
    } on PlatformException catch (e) {
      print("Error from native: $e.message");
    }
  }
}
