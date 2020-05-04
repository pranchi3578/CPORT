import 'package:flutter/material.dart';
import 'package:oneportal/screens/status.dart';
import '../widgets/bottomBar.dart';
import '../widgets/grid.dart';
import '../screens/GlobalVariables.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/gridForFaculty.dart';

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
  var _pfId;
  dynamic _dataFetched;
  SharedPreferences sp;
  List<Widget> faculties = List();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ChooseFaculty args = ModalRoute.of(context).settings.arguments;
    _department = args.departmentSelected;
    print("_argument value");
    print(args.contentPassed);
    print(_department);
  }

  Future _fetchpfId() async {
    final url = 'http://' +
        GloabalVariables.ip +
        ':5000/api/students/getfId/${_department}';
    try {
      setState(() {
        _isLoading = true;
      });
      sp = await SharedPreferences.getInstance();
      final headers = {HttpHeaders.authorizationHeader: sp.getString('jwt')};
      final response = await http.get(url, headers: headers);
      return json.decode(response.body);
    } catch (err) {
      throw err;
    }

    //Navigator.of(context).pushNamed("/studentSignup");

    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => StudentSignup()),
    //   );
  }

  void selectedFac(pfId) {
    setState(() {
      _pfId = pfId;
    });
    if (_pfId != null) print(_pfId);
    Navigator.pushNamed(context, Status.routeName);
  }

  @override
  Widget build(BuildContext context) {
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
                      FutureBuilder(
                        future: _fetchpfId(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Center(
                                      child: new CircularProgressIndicator()));
                            default:
                              if (snapshot.hasError ||
                                  snapshot.data.length == 0)
                                return Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Center(
                                      child: new Text('No faculty  found')),
                                );
                              else {
                                return GridFaculty(
                                    content: snapshot.data,
                                    chooseFac: (int) => selectedFac(int));
                              }
                          }
                        },
                      ),
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
