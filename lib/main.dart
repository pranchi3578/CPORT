import 'package:flutter/material.dart';
import 'package:oneportal/screens/chat.dart';
import 'package:oneportal/screens/newTicket.dart';

import './screens/stuLogin.dart';
import './screens/stuSignup.dart';
import './screens/choice.dart';
import './screens/status.dart';
import './screens/logo.dart';
import './screens/facLogin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Portal',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Montserrat'),
      home: NewTicket(),
      routes: {
        StudentLogin.routeName: (ctx) => StudentLogin(),
        StudentSignup.routeName: (ctx) => StudentSignup(),
        Chat.routeName: (ctx) => Chat()
      },
    );
  }
}
