import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:oneportal/widgets/bottomBar.dart';

class MyChatScreen extends StatefulWidget {
  static const routeName = '/chat-screen';
  const MyChatScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyChatState createState() => new _MyChatState();
}

class _MyChatState extends State<MyChatScreen> {
  final List<dynamic> _messages = <dynamic>[];
  final _userId = "111";
  final List<Map<String, dynamic>> _messageList = <Map<String, dynamic>>[
    {"sender": "342", "receiver": "324", "message": "hii", "dateTime": "2am"},
    {"sender": "111", "receiver": "324", "message": "hii", "dateTime": "2am"}
  ];

  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final _textController = TextEditingController();
  _onTap() {
    setState(() {
      _messages.insert(
          0,
          Container(
            margin: EdgeInsets.only(left: 61, bottom: 16),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                blurRadius: 6.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  0, // horizontal, move right 10
                  8, // vertical, move down 10
                ),
              )
            ]),
            child: TextField(
              controller: _textController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              // minLines: 10,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    DateTime time = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm').format(time);

    return new Scaffold(
      body: new Container(
        color: Colors.black87,
        // width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.fromLTRB(
                  width * .0722, height * .096, width * .066, height * .15),
              child: new Column(
                children: <Widget>[
                  //Chat list
                  Text(
                    "Messages",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  new Flexible(
                    child: new ListView.builder(
                      padding: new EdgeInsets.all(8.0),
                      reverse: true,
                      itemBuilder: (_, int index) => _messages[index],
                      itemCount: _messages.length,
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  FlatButton(
                    onPressed: _onTap,
                    child: Text(
                      "Tap Here to replay",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: height * .0468,
              left: width * .138,
              child: BottomBar(),
            )
          ],
        ),
      ),
    );
  }

  void _sendMsg(String msg, String userId, String rId, String date) {
    if (msg.length == 0) {
      Fluttertoast.showToast(
          msg: "Please Enter Message",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.blue);
    } else {
      _textController.clear();
      _messageList.removeAt(0);
      setState(() {
        _messageList.insert(0, {
          "sender": userId,
          "receiver": rId,
          "message": msg,
          "dateTime": date
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _messageList.forEach((item) => {
          _messages.insert(
              0,
              Message(
                sender: item['sender'],
                message: item['message'],
                dateTime: item['dateTime'],
              ))
        });
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    // Clean up the controller when the Widget is disposed
    _textController.dispose();
    super.dispose();
  }
}

//-------------------------------------------------------------------------------------------------------------

class Message extends StatelessWidget {
  Message({this.sender, this.message, this.dateTime});

  final String sender;
  final String message;
  final String dateTime;
  String userId = "111";
  @override
  Widget build(BuildContext context) {
    return sender == userId
        ? Container(
            padding: EdgeInsets.only(bottom: 4, left: 19, top: 22, right: 19),
            margin: EdgeInsets.only(bottom: 16, left: 61),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    blurRadius: 6.0, // has the effect of softening the shadow
                    spreadRadius: 5.0, // has the effect of extending the shadow
                    offset: Offset(
                      0, // horizontal, move right 10
                      8, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Colors.white),
            child: Column(
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    dateTime,
                    style: TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                ),
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.only(bottom: 4, left: 19, top: 22, right: 19),
            width: 10,
            margin: EdgeInsets.only(bottom: 16, right: 59),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    blurRadius: 6.0, // has the effect of softening the shadow
                    spreadRadius: 5.0, // has the effect of extending the shadow
                    offset: Offset(
                      0, // horizontal, move right 10
                      8, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Color(0xff8BC34A)),
            child: Column(
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    dateTime,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
