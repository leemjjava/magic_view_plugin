import 'package:flutter/material.dart';
import 'package:magic_view_plugin/magic_view_plugin.dart';

import 'magic_view.dart';

void main() {
  runApp(
    MaterialApp(
      title: '쾌변',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: MagicScreen(),
    ),
  );
}

class MagicScreen extends StatefulWidget {
  @override
  _MagicScreenState createState() => _MagicScreenState();
}

class _MagicScreenState extends State<MagicScreen> {
  MagicViewPlugin _magicViewPlugin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Magic App"),
      ),
      body: Stack(
        children: <Widget>[
          MagicView(
            onMagicViewCreated: (MagicViewPlugin controller) {
              setState(() {
                _magicViewPlugin = controller;
              });
            },
          ),
        ],
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          _magicViewPlugin.receiveFromFlutter('hello');
        },
      ),
    );
  }
}
