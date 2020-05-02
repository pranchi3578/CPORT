import 'package:flutter/material.dart';
import '../widgets/bottomBar.dart';
import '../widgets/grid.dart';
import '../screens/GlobalVariables.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseFaculty extends StatefulWidget {
  final String departmentSelected;
  final Map<dynamic, dynamic> contentPassed;
  ChooseFaculty({Key key, this.departmentSelected, this.contentPassed})
      : super(key: key);
  static const routeName = "/choose-faculty";
  @override
  _FacultyState createState() => _FacultyState();
}

class _FacultyState extends State<ChooseFaculty> {
  @override
  var _department;
  var _isLoading = false;
  dynamic _pfId;
  SharedPreferences sp;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ChooseFaculty args = ModalRoute.of(context).settings.arguments;
    _department = args.departmentSelected;

    fetchpfId();
    print("_argument value");
    print(args.contentPassed);
    print(_department);
  }

  Future fetchpfId() async {
    setState(() {
      _isLoading = true;
    });

    sp = await SharedPreferences.getInstance();
    try {
      final queryParameters = {
        'deptName': _department,
      };
      final headers = {HttpHeaders.authorizationHeader: sp.getString('jwt')};
      final uri = Uri.http(
          'http://' + GloabalVariables.ip + ':5000/api/students',
          '/getfId',
          queryParameters);
      final response = await http.get(uri, headers: headers);

      _pfId = json.decode(response.body);
      print("THIS IS PFID KOOOOOOOOOOI");
      print(_pfId);
    }
    // Storing token in Shared preference

    catch (err) {
      throw err;
    }

    //Navigator.of(context).pushNamed("/studentSignup");

    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => StudentSignup()),
    //   );
  }

  @override
  Widget build(BuildContext context) {
    final ChooseFaculty args = ModalRoute.of(context).settings.arguments;
    _department = args;
    // print(args.contentPassed);
    // print(args.departmentSelected);
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 24, 52, 1),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).copyWith().size.width / 5.8065, 0, 0),
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).copyWith().size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Choose Faculty",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      CustomScrollView(
                        primary: false,
                        shrinkWrap: true,
                        slivers: <Widget>[
                          SliverPadding(
                            padding: const EdgeInsets.all(20),
                            sliver: SliverGrid.count(
                              crossAxisSpacing: 35,
                              mainAxisSpacing: 19,
                              crossAxisCount: 2,
                              children: <Widget>[],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 50,
                child: BottomBar(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
