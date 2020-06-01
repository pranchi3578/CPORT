import 'package:flutter/material.dart';
import '../widgets/facBar.dart';

class FacApplicationView extends StatefulWidget {
  final dynamic contentPassed;
  final dynamic personalInfo;
  FacApplicationView({Key key, this.contentPassed, this.personalInfo})
      : super(key: key);
  static const routeName = "/viewApplication";
  _FacApplicationViewState createState() => _FacApplicationViewState();
}

class _FacApplicationViewState extends State<FacApplicationView> {
  @override
  Widget build(BuildContext context) {
    final FacApplicationView args = ModalRoute.of(context).settings.arguments;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
                                  args.contentPassed['subject']
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
                                  args.contentPassed['content'],
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
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              Positioned(
                  bottom: height * .0468, left: width * .138, child: FacBar())
          ],
        ));
  }
}
