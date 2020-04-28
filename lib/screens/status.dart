import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/bottomBar.dart';
import '../widgets/cardStatus.dart';
import 'package:oneportal/screens/GlobalVariables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Status extends StatefulWidget {
  static const routeName = "/status";

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  var _isLoading = false;
  List<dynamic> _status = List<dynamic>();

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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 24, 52, 1),
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
                                return CardStatus(tickets: snapshot.data);
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
