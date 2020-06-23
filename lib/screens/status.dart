import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/bottomBar.dart';
import '../widgets/cardStatus.dart';
import 'package:oneportal/screens/GlobalVariables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './studentApplicationView.dart';

class Status extends StatefulWidget {
  static const routeName = "/status";

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  var _isLoading = false;
  List<dynamic> _status = List<dynamic>();
  dynamic _facInfo;
  SharedPreferences sp;
  Future _fetchTickets() async {
    const url = 'http://' + GloabalVariables.ip + ':5000/api/tickets';
    try {
      sp = await SharedPreferences.getInstance();
      final response = await http.get(url,
          headers: {HttpHeaders.authorizationHeader: sp.getString('jwt')});
      return json.decode(response.body);
    } catch (err) {
      throw (err);
    }
  }

  _selectedTicket(dynamic ticket) async {
    print(ticket['fid']);
    final url = 'http://' +
        GloabalVariables.ip +
        ':5000/api/students/getFacInfo/${ticket['fid']}';
    try {
      sp = await SharedPreferences.getInstance();
      final response = await http.get(url,
          headers: {HttpHeaders.authorizationHeader: sp.getString('jwt')});

      _facInfo = json.decode(response.body);
      print("printing personal info");
      print(_facInfo);
    } catch (err) {
      throw (err);
    }
    Navigator.pushNamed(context, StudentApplicationView.routeName,
        arguments:
            StudentApplicationView(contentPassed: ticket, facInfo: _facInfo));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).copyWith().size.width / 5.8065, 0, 0),
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).copyWith().size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 54),
                        child: Text(
                          "Status",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w200,
                              fontSize: 26),
                        ),
                      ),
                      FutureBuilder(
                        future: _fetchTickets(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Center(
                                      child: new CircularProgressIndicator()));
                            default:
                              if (snapshot.hasError ||
                                  snapshot.data.length == 0)
                                return Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Center(
                                      child: new Text('No Tickets found')),
                                );
                              else {
                                return CardStatus(
                                    tickets: snapshot.data,
                                    chooseTicket: (dynamic) =>
                                        _selectedTicket(dynamic));
                              }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 50,
                child: BottomBar(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
