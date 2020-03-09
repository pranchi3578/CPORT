import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Choice extends StatelessWidget {
  const Choice({Key key}) : super(key: key);

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
                  )),
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
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius:
                          MediaQuery.of(context).copyWith().size.width / 6,
                    ),
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
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius:
                          MediaQuery.of(context).copyWith().size.width / 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
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
          ),
        ],
      ),
    ));
  }
}
