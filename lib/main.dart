import 'package:flutter/material.dart';
import 'package:oneportal/screens/chat.dart';
import 'package:oneportal/screens/facLogin.dart';

import 'package:oneportal/screens/newTicket.dart';
import 'package:oneportal/screens/viewTicket.dart';
import 'screens/facSignup.dart';
import 'screens/facLogin.dart';

import './screens/stuLogin.dart';
import './screens/stuSignup.dart';
import './screens/choice.dart';
import './screens/status.dart';
import './screens/logo.dart';
import './screens/chooseDept.dart';
import './screens/chooseFac.dart';
import './screens/messages.dart';
import './screens/facStatus.dart';
import './screens/facApplicationView.dart';
import './screens/studentApplicationView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Portal',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Montserrat'),
      home: FacultyLogin(),
      routes: {
        Logo.routeName: (ctx) => Choice(),
        Choice.routeName: (ctx) => Choice(),
        StudentLogin.routeName: (ctx) => StudentLogin(),
        StudentSignup.routeName: (ctx) => StudentSignup(),
        NewTicket.routeName: (ctx) => NewTicket(),
        Status.routeName: (ctx) => Status(),
        Department.routeName: (ctx) => Department(),
        ChooseFaculty.routeName: (ctx) => ChooseFaculty(),
        FacStatus.routeName: (ctx) => FacStatus(),
        FacultyLogin.routeName: (ctx) => FacultyLogin(),
        FacultySignup.routeName: (ctx) => FacultySignup(),
        FacApplicationView.routeName: (ctx) => FacApplicationView(),
        StudentApplicationView.routeName: (ctx) => StudentApplicationView()
      },
    );
  }
}
