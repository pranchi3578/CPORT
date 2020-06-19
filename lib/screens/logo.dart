import 'package:flutter/material.dart';

import '../widgets/clipperLogo1.dart';
import '../widgets/clipperLogo2.dart';

class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);
  static const routeName = "/flashscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(241, 24, 52, 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).copyWith().size.width / 2.22222,
                width: MediaQuery.of(context).copyWith().size.width / 2.22222,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(
                        MediaQuery.of(context).copyWith().size.width /
                            2.22222 *
                            2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipPath(
                      clipper: TriangleClipper1(),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        height: MediaQuery.of(context).copyWith().size.width /
                            4.626060,
                        width: MediaQuery.of(context).copyWith().size.width /
                            11.523687,
                        color: Color.fromRGBO(241, 24, 52, 1),
                      ),
                    ),
                    ClipPath(
                      clipper: TriangleClipper2(),
                      child: Container(
                        height: MediaQuery.of(context).copyWith().size.width /
                            4.626060,
                        width: MediaQuery.of(context).copyWith().size.width /
                            11.523687,
                        color: Color.fromRGBO(241, 24, 52, 1),
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(bottom: 8),
              ),
              Text(
                "CPORT",
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'OpenSans',
                  color: Colors.white.withOpacity(1),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0),
                child: Text(
                  "CUSAT ONE PORTAL SYSYTEM",
                  style: TextStyle(
                    color: Colors.white.withOpacity(1),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
