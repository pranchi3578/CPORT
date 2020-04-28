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

  @override
  void initState() {
    super.initState();
    _statusAsyncMethod();
  }

  SharedPreferences sp;
  Future<void> _statusAsyncMethod() async {
    const url = 'http://' + GloabalVariables.ip + ':5000/api/tickets';
    try {
      sp = await SharedPreferences.getInstance();
      final response = await http.get(url,
          headers: {HttpHeaders.authorizationHeader: sp.getString('jwt')});
      _status = json.decode(response.body);
      print(_status);
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
                      CustomScrollView(
                        primary: false,
                        shrinkWrap: true,
                        slivers: <Widget>[
                          SliverPadding(
                            padding: const EdgeInsets.all(20),
                            sliver: SliverGrid.count(
                                crossAxisSpacing: 35,
                                mainAxisSpacing: 19,
                                crossAxisCount: 2,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[],
                                  )
                                ]),
                          ),
                        ],
                      )
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
