import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Choice extends StatefulWidget {
  Choice({Key key}) : super(key: key);
  static const routeName = "/choice";

  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  bool _onclick1 = true;
  bool _onclick2 = true;
  void _toggleClick1() {
    setState(() {
      _onclick1 = !_onclick1;
      _onclick2 = true;
    });
  }

  void _toggleClick2() {
    setState(() {
      _onclick2 = !(_onclick2);
      _onclick1 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromRGBO(241, 24, 52, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 125, 13),
              child: Text("Choose Your Profile",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 25,
                      color: Color.fromRGBO(241, 24, 52, 1),
                      fontWeight: FontWeight.bold)),
            ),
            height: MediaQuery.of(context).copyWith().size.width / (360 / 90),
            width: MediaQuery.of(context).copyWith().size.width / (360 / 315),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            width: MediaQuery.of(context).copyWith().size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    (_onclick1
                        ? GestureDetector(
                            onTap: _toggleClick1,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/student.png"),
                              backgroundColor: Colors.white,
                              maxRadius:
                                  MediaQuery.of(context).copyWith().size.width /
                                      6,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(2.0), // borde width
                            decoration: new BoxDecoration(
                              color: const Color(0xFFFFFFFF), // border color
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                  blurRadius:
                                      6.0, // has the effect of softening the shadow
                                  spreadRadius:
                                      5.0, // has the effect of extending the shadow
                                  offset: Offset(
                                    0, // horizontal, move right 10
                                    8, // vertical, move down 10
                                  ),
                                )
                              ],
                            ),
                            child: GestureDetector(
                              onTap: _toggleClick1,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/student.png"),
                                backgroundColor: Colors.white,
                                maxRadius: MediaQuery.of(context)
                                        .copyWith()
                                        .size
                                        .width /
                                    6,
                              ),
                            ),
                          )),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text("Student",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
                VerticalDivider(color: Colors.white, indent: 65, endIndent: 65),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    (_onclick2
                        ? GestureDetector(
                            onTap: _toggleClick2,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/teacher.png"),
                              backgroundColor: Colors.white,
                              maxRadius:
                                  MediaQuery.of(context).copyWith().size.width /
                                      6,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(2.0), // borde width
                            decoration: new BoxDecoration(
                              color: const Color(0xFFFFFFFF), // border color
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                  blurRadius:
                                      6.0, // has the effect of softening the shadow
                                  spreadRadius:
                                      5.0, // has the effect of extending the shadow
                                  offset: Offset(
                                    0, // horizontal, move right 10
                                    8, // vertical, move down 10
                                  ),
                                )
                              ],
                            ),
                            child: GestureDetector(
                              onTap: _toggleClick2,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/teacher.png"),
                                backgroundColor: Colors.white,
                                maxRadius: MediaQuery.of(context)
                                        .copyWith()
                                        .size
                                        .width /
                                    6,
                              ),
                            ),
                          )),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text("Faculty",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).copyWith().size.width / (360 / 39),
              width: MediaQuery.of(context).copyWith().size.width / (360 / 312),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: (_onclick1 != _onclick2)
                  ? Center(
                      child: Text("Continue",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: Color.fromRGBO(241, 24, 52, 1),
                              fontWeight: FontWeight.bold)),
                    )
                  : Center(
                      child: Text("Tap",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: Color.fromRGBO(241, 24, 52, 1),
                              fontWeight: FontWeight.bold)),
                    )),
        ],
      ),
    ));
  }
}
