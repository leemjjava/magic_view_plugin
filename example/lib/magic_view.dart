import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_view_plugin/magic_view_plugin.dart';

// magic_view.dart
typedef void MagicViewCreatedCallback(MagicViewPlugin controller);

class MagicView extends StatelessWidget {
  MagicView({Key key, this.onMagicViewCreated}) : super(key: key);

  final MagicViewCreatedCallback onMagicViewCreated;
  static const StandardMessageCodec _decoder = StandardMessageCodec();

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = {"someInit": "initData"};
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'MagicPlatformView',
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParams: args,
        creationParamsCodec: _decoder,
      );
    }

    return UiKitView(
      viewType: 'MagicPlatformView',
      onPlatformViewCreated: _onPlatformViewCreated,
      creationParams: args,
      creationParamsCodec: _decoder,
    );
  }

  void _onPlatformViewCreated(int id) {
    if (onMagicViewCreated == null) {
      return;
    }
    onMagicViewCreated(MagicViewPlugin(id));
  }
}
