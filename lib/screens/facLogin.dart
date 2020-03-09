import 'package:flutter/material.dart';
//import './stuSignup.dart';

class FacultyLogin extends StatefulWidget {
  static const routeName = "/studentLogin";
  @override
  _FacultyLoginState createState() => _FacultyLoginState();
}

class _FacultyLoginState extends State<FacultyLogin> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _authdata = {'admissionNo': '', 'password': ''};
  checkform() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    Navigator.of(context).pushNamed("/studentSignup");

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
          color: Color.fromRGBO(241, 24, 52, 1),
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
                                borderSide: BorderSide(color: Colors.black38),
                              ),
                              // prefixIcon: const Icon(
                              //   Icons.person,
                              //   color: Colors.white,
                              // ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(36.0))),
                              labelText: "Faculty I.D",
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
                                borderSide: BorderSide(color: Colors.black38),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(36.0))),
                              // prefixIcon: const Icon(
                              //   Icons.security,
                              //   color: Colors.white,
                              // ),
                              labelText: "Password",
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 50.0),
                            ),
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 312,
                          height: 39,
                          buttonColor: Colors.white,
                          child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            onPressed: checkform,
                            child: Text(
                              'login',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Color.fromRGBO(241, 24, 52, 1),
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
