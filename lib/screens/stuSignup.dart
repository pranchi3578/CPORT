import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oneportal/screens/GlobalVariables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import './stuLogin.dart';

class StudentSignup extends StatefulWidget {
  static const routeName = "/studentSignup";
  @override
  _StudentSignupState createState() => _StudentSignupState();
}

class _StudentSignupState extends State<StudentSignup> {
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  Map<String, String> _authData = {
    'admissionNumber': '',
    'password': '',
    'cPassword': ''
  };
  Map<String, dynamic> _data = Map<String, dynamic>();

  Future<void> _signup() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    const url = 'http://' + GloabalVariables.ip + ':5000/api/students/signup';
    try {
      print(_authData);
      final response = await http.post(url, body: {
        "admissionNumber": _authData['admissionNumber'],
        "password": _authData['password']
      });
      print(response.body);
      _data = json.decode(response.body);
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
      return _data['token']; //endina ithu return cheyunne?
    } catch (err) {
      throw err;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(241, 24, 52, 1),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Container(
              height: MediaQuery.of(context).copyWith().size.height,
              child: Form(
                key: _formKey,
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).copyWith().size.height / 2.5,
                    width: MediaQuery.of(context).copyWith().size.width / 1.5,
                    child: Column(
                      children: <Widget>[
                        if (_data['msg'] != null)
                          Text(
                            _data['msg'],
                            style: TextStyle(color: Colors.red),
                          ),
                        SizedBox(
                          width: 312,
                          height: 39,
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'please enter a value';
                              }
                            },
                            onSaved: (value) {
                              _authData['admissionNumber'] = value;
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black38),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(36.0))),
                              // prefixIcon: const Icon(
                              //   Icons.person,
                              //   color: Colors.white,
                              // ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(36.0))),
                              labelText: "Admission No",

                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 50),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 312,
                          height: 39,
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Password';
                              }
                            },
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black38),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(36.0))),
                              // prefixIcon: const Icon(
                              //   Icons.person,
                              //   color: Colors.white,
                              // ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(36.0))),
                              labelText: "New Password",

                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 50),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 312,
                          height: 39,
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Password';
                              }
                            },
                            onSaved: (value) {
                              _authData['cPassword'] = value;
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black38),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(36.0))),
                              // prefixIcon: const Icon(
                              //   Icons.person,
                              //   color: Colors.white,
                              // ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(36.0))),
                              labelText: "Re-Enter password",

                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 50),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                            buttonColor: Colors.white,
                            child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              onPressed: _signup,
                              child: Text(
                                'Signup',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromRGBO(241, 24, 52, 1),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        // RaisedButton(
                        //   onPressed: _signup,
                        //   child: Text('Submit'),
                        // ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(StudentLogin.routeName);
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
