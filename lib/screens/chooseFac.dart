import 'package:flutter/material.dart';
import '../widgets/bottomBar.dart';
import '../widgets/grid.dart';

class Faculty extends StatefulWidget {
  Faculty({Key key}) : super(key: key);

  _FacultyState createState() => _FacultyState();
}

class _FacultyState extends State<Faculty> {
  @override
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
                      Text(
                        "Choose Faculty",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
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
                                Grid(),
                                Grid(),
                                Grid(),
                                Grid(),
                                Grid(),
                                Grid(),
                                Grid(),
                                Grid()
                              ],
                            ),
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
