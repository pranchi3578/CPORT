import 'package:flutter/material.dart';

class StudentSignup extends StatefulWidget {
  static const routeName = "/studentSignup";
  @override
  _StudentSignupState createState() => _StudentSignupState();
}

class _StudentSignupState extends State<StudentSignup> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).copyWith().size.height / 2.5,
          width: MediaQuery.of(context).copyWith().size.width / 1.5,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please enter a value';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: "Admission No"),
              ),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: "New Password"),
              ),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: "Re-EnterPassword"),
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                },
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
    ));
  }
}
