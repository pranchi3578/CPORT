import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  static const routeName = "/chat";

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Chat"),
    );
  }
}
