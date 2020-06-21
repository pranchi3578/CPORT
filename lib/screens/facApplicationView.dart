import 'package:flutter/material.dart';
import '../widgets/facBar.dart';
import '../screens/GlobalVariables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import '../widgets/viewAttachments.dart';

class FacApplicationView extends StatefulWidget {
  final dynamic contentPassed;
  final dynamic personalInfo;
  FacApplicationView({Key key, this.contentPassed, this.personalInfo})
      : super(key: key);
  static const routeName = "/viewApplication";
  _FacApplicationViewState createState() => _FacApplicationViewState();
}

class _FacApplicationViewState extends State<FacApplicationView> {
  final _formKey = GlobalKey<FormState>();
  SharedPreferences sp;
  var _content;
  var _studentInfo;
  var _message = "";
  var _approved;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final FacApplicationView args = ModalRoute.of(context).settings.arguments;
    _content = args.contentPassed;
    _studentInfo = args.personalInfo;
    print(_content);
  }

  navigationResponse(value, BuildContext context) {
    _formKey.currentState.save();
    if (value == 1 || value == 2) writeResponseToDb(value);
    print(value);
    setState(() {
      _approved = value;
    });
    showCustomDialogWithImage(context, value);
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

  void showCustomDialogWithImage(BuildContext context, approved) async {
    Dialog dialogWithImage = Dialog(
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: approved == 1
                  ? Text(
                      "Approved",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )
                  : Text(
                      "Canceled",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
            ),
            Container(
              height: 200,
              width: 300,
              child: approved == 1
                  ? Image.asset(
                      'assets/approved.png',
                      fit: BoxFit.scaleDown,
                    )
                  : Image.asset(
                      'assets/cancel.png',
                      fit: BoxFit.scaleDown,
                    ),
            ),
          ],
        ),
      ),
    );

    showDialog(
        context: context, builder: (BuildContext context) => dialogWithImage);
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacementNamed('/facStatus');
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final FacApplicationView args = ModalRoute.of(context).settings.arguments;
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

                      Text(
                        args.personalInfo['name'].toString().toUpperCase(),
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        args.personalInfo['department']
                            .toString()
                            .toUpperCase(),
                        style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
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
                                ViewAttachments(_content['image']),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 33.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your Comments :",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 90),
                        child: Container(
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
                          ),
                          child: Center(
                              child: Form(
                            key: _formKey,
                            child: TextFormField(
                              onSaved: (value) {
                                _message = value;
                              },
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              minLines: 10,
                              decoration: InputDecoration(
                                  hintText: "eg.Meet me",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
                            ),
                          )),
                        ),
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
                  child: FacBar(
                      response: (int) => navigationResponse(int, context)))
          ],
        ));
  }
}
