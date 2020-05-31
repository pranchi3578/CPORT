import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oneportal/screens/GlobalVariables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FacultySignup extends StatefulWidget {
  static const routeName = "/facultySignup";
  @override
  _FacultySignupState createState() => _FacultySignupState();
}

class _FacultySignupState extends State<FacultySignup> {
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  Map<String, String> _authData = {'pfId': '', 'password': '', 'cPassword': ''};
  Map<String, dynamic> _data = Map<String, dynamic>();

  Future<void> _signup() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    const url = 'http://' + GloabalVariables.ip + ':5000/api/faculties/signup';
    try {
      print(_authData);
      final response = await http.post(url,
          body: {"pfId": _authData['pfId'], "password": _authData['password']});
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

      Navigator.of(context).pushReplacementNamed('/facStatus');
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
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter a value';
                        }
                      },
                      onSaved: (value) {
                        _authData['pfId'] = value;
                      },
                      decoration: InputDecoration(labelText: "Faculty Id"),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Password';
                        }
                      },
                      onSaved: (value) {
                        _authData['password'] = value;
                      },
                      decoration: InputDecoration(labelText: "New Password"),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Password';
                        }
                      },
                      onSaved: (value) {
                        _authData['cPassword'] = value;
                      },
                      decoration:
                          InputDecoration(labelText: "Re-EnterPassword"),
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
                      RaisedButton(
                        onPressed: _signup,
                        child: Text('Submit'),
                      ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text('Login'))
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
