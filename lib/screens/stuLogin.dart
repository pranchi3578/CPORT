import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oneportal/screens/GlobalVariables.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
//import './stuSignup.dart';

class StudentLogin extends StatefulWidget {
  static const routeName = "/studentLogin";
  @override
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  Map<String, String> _authdata = {'admissionNo': '', 'password': ''};
  Map<String, dynamic> _data = Map<String, dynamic>();

  Future<void> checkform() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    const url = 'http://' + GloabalVariables.ip + ':5000/api/students/login';
    try {
      final response = await http.post(url, body: {
        "admissionNumber": _authdata['admissionNo'],
        "password": _authdata['password']
      });
      _data = json.decode(response.body);
      print(_data);
      if (_data['token'] == null) {
        setState(() {
          _isLoading = false;
        });
        return;
      }
      // Storing token in Shared preference
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt', _data['token']);

      Navigator.of(context).pushReplacementNamed('/create-ticket');
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
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
    return Scaffold(
        body: SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Container(
          color: Colors.black87,
          width: MediaQuery.of(context).copyWith().size.width,
          height: MediaQuery.of(context).copyWith().size.height,
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 183, 100),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 95),
                          child: Text('Hey,',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w100,
                                  fontSize: 24,
                                  color: Colors.white)),
                        ),
                        Text('Login Now',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).copyWith().size.height / 2,
                    width: MediaQuery.of(context).copyWith().size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 312,
                          height: 39,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'please enter a value';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authdata['admissionNo'] = value;
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(36.0))),
                              // prefixIcon: const Icon(
                              //   Icons.person,
                              //   color: Colors.white,
                              // ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white60),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(36.0))),
                              labelText: "Admission No",
                              labelStyle: TextStyle(color: Colors.white38),

                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 50),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 312,
                          height: 39,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'please enter Password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authdata['password'] = value;
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(36.0))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white60),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(36.0))),
                              // prefixIcon: const Icon(
                              //   Icons.security,
                              //   color: Colors.white,
                              // ),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.white38),
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 50.0),
                            ),
                          ),
                        ),
                        if (_isLoading)
                          Container(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator())
                        else
                          ButtonTheme(
                            minWidth: 312,
                            height: 39,
                            buttonColor: Colors.lightGreen,
                            child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              onPressed: checkform,
                              child: Text(
                                'login',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black87,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    ));
  }
}
