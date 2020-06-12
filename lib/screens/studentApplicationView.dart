import 'package:flutter/material.dart';
import '../widgets/facBar.dart';
import '../screens/GlobalVariables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import '../widgets/bottomBar.dart';

class StudentApplicationView extends StatefulWidget {
  final dynamic contentPassed;
  final dynamic facInfo;
  StudentApplicationView({Key key, this.contentPassed, this.facInfo})
      : super(key: key);
  static const routeName = "/studentviewApplication";
  _StudentApplicationViewState createState() => _StudentApplicationViewState();
}

class _StudentApplicationViewState extends State<StudentApplicationView> {
  final _formKey = GlobalKey<FormState>();
  SharedPreferences sp;
  var _content;
  var _studentInfo;
  var _message = "";
  var _approved;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final StudentApplicationView args =
        ModalRoute.of(context).settings.arguments;
    _content = args.contentPassed;
    _studentInfo = args.facInfo;
    print(_content);
  }

  Future writeResponseToDb(int approved) async {
    print(approved.runtimeType);
    final url = 'http://' +
        GloabalVariables.ip +
        ':5000/api/faculties/writeStatus/${_content['_id']}';
    final Map a = {'approved': approved.toString(), 'message': _message};
    try {
      sp = await SharedPreferences.getInstance();
      final headers = {HttpHeaders.authorizationHeader: sp.getString('jwt')};
      final response = await http.post(url, headers: headers, body: a);
    } catch (err) {
      print(err);

      throw (err);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final StudentApplicationView args =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        //resizeToAvoidBottomInset: false,

        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        body: Stack(
          children: <Widget>[
            Container(
              height: height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 62,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sent To:",
                            style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              args.facInfo['name'].toString().toUpperCase(),
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20),
                            )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "department:  " +
                                  args.facInfo['department']
                                      .toString()
                                      .toUpperCase(),
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12),
                            )),
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                                blurRadius:
                                    2.0, // has the effect of softening the shadow
                                spreadRadius:
                                    1.0, // has the effect of extending the shadow
                                offset: Offset(
                                  0, // horizontal, move right 10
                                  8, // vertical, move down 10
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(19, 17, 13, 30),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  _content['subject'].toString().toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _  ",
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  _content['content'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Status :",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: _content['approved'] == 3
                                ? Text(
                                    "PENDING",
                                    style: TextStyle(
                                        color: Colors.blue[200],
                                        fontWeight: FontWeight.w200,
                                        fontSize: 20),
                                  )
                                : _content['approved'] == 1
                                    ? Text(
                                        "ACCEPTED",
                                        style: TextStyle(
                                            color: Colors.green[200],
                                            fontWeight: FontWeight.w200,
                                            fontSize: 15),
                                      )
                                    : Text(
                                        "REJECTED",
                                        style: TextStyle(
                                            color: Colors.red[200],
                                            fontWeight: FontWeight.w200,
                                            fontSize: 20),
                                      )),
                      ),

                      // Positioned(
                      //     bottom: height * .0468,
                      //     left: width * .138,
                      //     child: FacBar())
                    ],
                  ),
                ),
              ),
            ),
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              Positioned(
                  bottom: height * .0468,
                  left: width * .138,
                  child: BottomBar())
          ],
        ));
  }
}
