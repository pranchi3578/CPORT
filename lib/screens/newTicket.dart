import 'package:flutter/material.dart';
import 'package:oneportal/widgets/bottomBar.dart';

class NewTicket extends StatefulWidget {
  @override
  _NewTicketState createState() => _NewTicketState();
}

class _NewTicketState extends State<NewTicket> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomBar(),
      backgroundColor: Color.fromRGBO(241, 24, 52, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "New Ticket",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  SizedBox(
                    height: 54,
                  ),
                  SizedBox(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left:
                                33.0), //please use mediaquery for all the metices , so it looks cool on all devices
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Subject",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8, //use mediaquery
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                      ),
                      SizedBox(
                        height: 12, //use mediaquery
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 33.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Content :",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        minLines: 10,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(left: 33.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Attachments :",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 39,
                              // width: 60,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      topLeft: Radius.circular(30))),
                              child: Center(
                                child: InkWell(
                                  child: Text("logo"),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 39,
                              // width: 0,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              child: Center(
                                child: InkWell(
                                  child: Text(
                                    "Send",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                  SizedBox(height: 34),
                  BottomBar()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
