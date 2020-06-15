import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:oneportal/widgets/upload_image.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
  File image;
  String imageName = 'Take Photo';

  Map<String, dynamic> ticketData = {'subject': '', 'content': '', 'image': []};
  Map<String, dynamic> _data = Map<String, dynamic>();

  Future<void> _upload() async {
    setState(() {
      _isLoading = true;
    });
    final ref = FirebaseStorage.instance
        .ref()
        .child('applications_images')
        .child(DateTime.now().toString() + image.toString() + '.jpg');
    await ref.putFile(image).onComplete;
    final url = await ref.getDownloadURL();
    ticketData['image'].add(url);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text('Uploaded..!'),
          content: new Text(
              "If you want more photos to upload click on 'Take Next Photo' "),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    setState(() {
      _isLoading = false;
      imageName = 'Take Next Photo';
    });
  }

  _next() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    print(ticketData);
    Navigator.pushNamed(context, Department.routeName,
        arguments: Department(content: ticketData));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                              minLines: 5,
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
                                    child: Padding(
                                      padding: EdgeInsets.all(height * 0.004),
                                      child: InkWell(
                                        onTap: () => {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (_) {
                                                return UploadImage(
                                                  setImage: (x, y) => {
                                                    setState(() {
                                                      image =
                                                          x != null ? x : image;
                                                      imageName =
                                                          y != null ? y : image;
                                                    })
                                                  },
                                                );
                                              })
                                        },
                                        child: AutoSizeText(
                                          imageName,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          maxFontSize: 16,
                                          minFontSize: 12,
                                        ),
                                      ),
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
                                    child: _isLoading
                                        ? CircularProgressIndicator()
                                        : InkWell(
                                            onTap: _upload,
                                            child: Text(
                                              "Upload",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * .018),
                          RaisedButton(
                            color: Color(0xff8BC34A),
                            // onPressed: (_dob == null ||
                            //         _gender == null ||
                            //         _homeTown == null)
                            //     ? null
                            //     : () {
                            //         onSubmitDetails(model);
                            //       },
                            onPressed: _next,
                            child: Text(
                              "Next",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
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
