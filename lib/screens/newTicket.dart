import 'dart:convert';
import './chooseDept.dart';
import 'package:flutter/material.dart';
import 'package:oneportal/screens/GlobalVariables.dart';
import 'package:oneportal/widgets/bottomBar.dart';

class NewTicket extends StatefulWidget {
  static const routeName = "/create-ticket";
  @override
  _NewTicketState createState() => _NewTicketState();
}

class _NewTicketState extends State<NewTicket> {
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  Map<String, dynamic> ticketData = {'subject': '', 'content': '', 'image': []};
  Map<String, dynamic> _data = Map<String, dynamic>();

  Future<void> _checkForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState() {
      _isLoading = true;
    }

    print(ticketData);

    Navigator.pushNamed(context, Department.routeName,
        arguments: Department(content: ticketData));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 24, 52, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "New Ticket",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      SizedBox(
                        height: height * .084,
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
                            height: height * .0125, //use mediaquery
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'please enter a value';
                              }
                            },
                            onSaved: (value) {
                              ticketData['subject'] = value;
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)))),
                          ),
                          SizedBox(
                            height: height * .018, //use mediaquery
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
                            height: height * .0125,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: TextFormField(
                              onSaved: (value) {
                                ticketData['content'] = value;
                              },
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              minLines: 10,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
                            ),
                          ),
                          SizedBox(height: height * .018),
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
                          SizedBox(height: height * .0125),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: height * .06,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topLeft: Radius.circular(20))),
                                  child: Center(
                                    child: InkWell(
                                      child: Text("logo"),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: height * .06,
                                  // width: 0,
                                  decoration: BoxDecoration(
                                      color: Color(0xff8BC34A),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(30),
                                          topRight: Radius.circular(30))),
                                  child: Center(
                                    child: InkWell(
                                      onTap: _checkForm,
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
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: height * .0468,
              left: width * .138,
              child: BottomBar(),
            )
          ],
        ),
      ),
    );
  }
}
