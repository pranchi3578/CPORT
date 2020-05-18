import 'package:flutter/material.dart';
import '../widgets/facBar.dart';

class FacApplicationView extends StatefulWidget {
  FacApplicationView({Key key}) : super(key: key);

  _FacApplicationViewState createState() => _FacApplicationViewState();
}

class _FacApplicationViewState extends State<FacApplicationView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color.fromRGBO(241, 24, 52, 1),
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
                        "Themothy Dal ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "IT sem 6 ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 10),
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
                                    6.0, // has the effect of softening the shadow
                                spreadRadius:
                                    5.0, // has the effect of extending the shadow
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
                            padding: const EdgeInsets.fromLTRB(19, 17, 13, 10),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Leave Application aaaaaaaaaaaaaaaa  12455383847 i want it dear ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _  ",
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "content here",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.redAccent,
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
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
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: TextFormField(
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            minLines: 10,
                            decoration: InputDecoration(
                                hintText: "eg.Meet me",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                          ),
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
            Positioned(
                bottom: height * .0468, left: width * .138, child: FacBar())
          ],
        ));
  }
}